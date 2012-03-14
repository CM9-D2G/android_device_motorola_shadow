/* vim:et:sts=4:sw=4
 *
 * Copyright (C) 2012, rondoval (ms2), Epsylon3 (defy)
 * Copyright (C) 2012, Won-Kyu Park
 * Copyright (C) 2012, Raviprasad V Mummidi
 * Copyright (C) 2011, Ivan Zupan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * ChangeLog
 *
 * 2012/01/19 - based on Raviprasad V Mummidi's code and some code by Ivan Zupan
 * 2012/01/21 - cleaned up by wkpark.
 * 2012/02/09 - first working version for P990/SU660 with software rendering
 *            - need to revert "MemoryHeapBase: Save and binderize the offset"
 *              commit f24c4cd0f204068a17f61f1c195ccf140c6c1d67.
 *            - some wrapper functions are needed (please see the libui.patch)
 * 2012/02/19 - Generic cleanup and overlay support (for Milestone 2)
 */

#define LOG_TAG "CameraHAL"
#define LOG_NDEBUG 0
#define LOG_PARAMS 0

#include <hardware/camera.h>
#include <ui/Overlay.h>
#include <binder/IMemory.h>
#include <hardware/gralloc.h>
#include <utils/Errors.h>

#include "CameraHardwareInterface.h"

/* Prototypes and extern functions. */
extern "C" android::sp<android::CameraHardwareInterface> HAL_openCameraHardware(int cameraId);
extern "C" int HAL_getNumberOfCameras();
extern "C" void HAL_getCameraInfo(int cameraId, struct CameraInfo* cameraInfo);

namespace android {
     int camera_device_open(const hw_module_t* module, const char* name, hw_device_t** device);
     int CameraHAL_GetCam_Info(int camera_id, struct camera_info *info);
}

static hw_module_methods_t camera_module_methods = {
    open: android::camera_device_open
};

camera_module_t HAL_MODULE_INFO_SYM = {
    common: {
        tag: HARDWARE_MODULE_TAG,
        version_major: 1,
        version_minor: 1,
        id: CAMERA_HARDWARE_MODULE_ID,
        name: "Camera HAL for ICS/CM9",
        author: "Won-Kyu Park, Raviprasad V Mummidi, Ivan Zupan, Epsylon3, rondoval",
        methods: &camera_module_methods,
        dso: NULL,
        reserved: {0},
    },
    get_number_of_cameras: android::HAL_getNumberOfCameras,
    get_camera_info: android::CameraHAL_GetCam_Info,
};


namespace android {

struct legacy_camera_device {
    camera_device_t device;
    int id;

    // New world
    camera_notify_callback         notify_callback;
    camera_data_callback           data_callback;
    camera_data_timestamp_callback data_timestamp_callback;
    camera_request_memory          request_memory;
    void                          *user;
    preview_stream_ops            *window;

    // Old world
    sp<CameraHardwareInterface>    hwif;
    gralloc_module_t const        *gralloc;
    camera_memory_t               *clientData;
    sp<Overlay>                    overlay;

    int32_t                        previewWidth;
    int32_t                        previewHeight;
    OverlayFormats                 previewFormat;
    uint32_t                       previewBpp;
};

/** camera_hw_device implementation **/
static inline struct legacy_camera_device * to_lcdev(struct camera_device *dev) {
    return reinterpret_cast<struct legacy_camera_device *>(dev);
}

//
// http://code.google.com/p/android/issues/detail?id=823#c4
//
void Yuv420spToRgba8888(char* rgb, char* yuv420sp, int width, int height) {
    int frameSize = width * height;
    int colr = 0;
    for (int j = 0, yp = 0, k = 0; j < height; j++) {
        int uvp = frameSize + (j >> 1) * width, u = 0, v = 0;
        for (int i = 0; i < width; i++, yp++) {
            int y = (0xff & ((int) yuv420sp[yp])) - 16;
            if (y < 0) y = 0;
            if ((i & 1) == 0) {
                 v = (0xff & yuv420sp[uvp++]) - 128;
                 u = (0xff & yuv420sp[uvp++]) - 128;
            }
            int y1192 = 1192 * y;
            int r = (y1192 + 1634 * v);
            int g = (y1192 - 833 * v - 400 * u);
            int b = (y1192 + 2066 * u);

            if (r < 0) r = 0; else if (r > 262143) r = 262143;
            if (g < 0) g = 0; else if (g > 262143) g = 262143;
            if (b < 0) b = 0; else if (b > 262143) b = 262143;

            /* for RGB8888 */
            r = (r >> 10) & 0xff;
            g = (g >> 10) & 0xff;
            b = (b >> 10) & 0xff;

            rgb[k++] = r;
            rgb[k++] = g;
            rgb[k++] = b;
            rgb[k++] = 255;
        }
    }
}

void Yuv422iToRgba8888 (char* rgb, char* yuv422i, int width, int height) {
    int yuv_index = 0;
    int rgb_index = 0;
    int frame_size = width * height;

    for (int i = 0; i < frame_size/2; i++) {

        int y1 = (0xff & ((int) yuv422i[yuv_index++])) - 16;
        if (y1 < 0) y1 = 0;

        int u = (0xff & yuv422i[yuv_index++]) - 128;

        int y2 = (0xff & ((int) yuv422i[yuv_index++])) - 16;
        if (y2 < 0) y2 = 0;

        int v = (0xff & yuv422i[yuv_index++]) - 128;

        int y1192 = 1192 * y1;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v - 400 * u);
        int b = (y1192 + 2066 * u);

        if (r < 0) r = 0; else if (r > 262143) r = 262143;
        if (g < 0) g = 0; else if (g > 262143) g = 262143;
        if (b < 0) b = 0; else if (b > 262143) b = 262143;

        /* for RGB8888 */
        r = (r >> 10) & 0xff;
        g = (g >> 10) & 0xff;
        b = (b >> 10) & 0xff;

        rgb[rgb_index++] = r;
        rgb[rgb_index++] = g;
        rgb[rgb_index++] = b;
        rgb[rgb_index++] = 255;

        y1192 = 1192 * y2;
        r = (y1192 + 1634 * v);
        g = (y1192 - 833 * v - 400 * u);
        b = (y1192 + 2066 * u);

        if (r < 0) r = 0; else if (r > 262143) r = 262143;
        if (g < 0) g = 0; else if (g > 262143) g = 262143;
        if (b < 0) b = 0; else if (b > 262143) b = 262143;

        /* for RGB8888 */
        r = (r >> 10) & 0xff;
        g = (g >> 10) & 0xff;
        b = (b >> 10) & 0xff;

        rgb[rgb_index++] = r;
        rgb[rgb_index++] = g;
        rgb[rgb_index++] = b;
        rgb[rgb_index++] = 255;
    }
}

void CameraHAL_ProcessPreviewData(char *frame, size_t size, legacy_camera_device *lcdev) {
    LOGV("%s: frame=%p, size=%d, camera=%p", __FUNCTION__, frame, size, lcdev);
    if (NULL != lcdev->window && NULL != lcdev->request_memory) {
        int32_t stride;
        buffer_handle_t *bufHandle = NULL;
        int retVal = lcdev->window->dequeue_buffer(lcdev->window, &bufHandle, &stride);
        if (retVal != NO_ERROR) {
            LOGE("%s: ERROR dequeueing the buffer\n", __FUNCTION__);
        } else {
            LOGV("%s: dequeued window, stride=%d", __FUNCTION__, stride);
            if ( stride != lcdev->previewWidth) {
                 LOGE("%s: stride=%d doesn't equal width=%d", __FUNCTION__, stride, lcdev->previewWidth);
            }
            retVal = lcdev->window->lock_buffer(lcdev->window, bufHandle);
            if (retVal == NO_ERROR) {
                LOGV("%s: window locked", __FUNCTION__);

                int tries = 5;
                int err = 0;
                void *vaddr;
                err = lcdev->gralloc->lock(lcdev->gralloc, *bufHandle, GRALLOC_USAGE_SW_WRITE_OFTEN,
                                           0, 0, lcdev->previewWidth, lcdev->previewHeight, &vaddr);
                while (err && tries) {
                    // Pano frames almost always need a retry...
                    usleep(1000);
                    lcdev->gralloc->unlock(lcdev->gralloc, *bufHandle);
                    err = lcdev->gralloc->lock(lcdev->gralloc, *bufHandle, GRALLOC_USAGE_SW_WRITE_OFTEN,
                                               0, 0, lcdev->previewWidth, lcdev->previewHeight, &vaddr);
                    tries--;
                }
                if (!err) {
                    // The data we get is in YUV... but Window is RGBA8888. It needs to be converted
                    switch (lcdev->previewFormat) {
                    case OVERLAY_FORMAT_YUV422I:
                        Yuv422iToRgba8888((char*)vaddr, frame, lcdev->previewWidth, lcdev->previewHeight);
                        break;
                    case OVERLAY_FORMAT_YUV420SP:
                        Yuv420spToRgba8888((char*)vaddr, frame, lcdev->previewWidth, lcdev->previewHeight);
                        break;
                    case OVERLAY_FORMAT_RGBA8888:
                        memcpy(vaddr, frame, size);
                        break;
                    default:
                        LOGE("%s: Unknown video format, cannot convert!", __FUNCTION__);
                    }

                    lcdev->gralloc->unlock(lcdev->gralloc, *bufHandle);
                    if (0 != lcdev->window->enqueue_buffer(lcdev->window, bufHandle)) {
                        LOGE("%s: could not enqueue gralloc buffer", __FUNCTION__);
                    }
                } else {
                  LOGE("%s: could not lock gralloc buffer", __FUNCTION__);
                }
            } else {
                LOGE("%s: ERROR locking the buffer\n", __FUNCTION__);
                lcdev->window->cancel_buffer(lcdev->window, bufHandle);
            }
        }
    }
}

/* Overlay hooks */
void queue_buffer_hook(void *data, void *buffer, size_t size) {
    if (data != NULL && buffer != NULL) {
        CameraHAL_ProcessPreviewData((char*)buffer, size, (legacy_camera_device*) data);
    }
}

void CameraHAL_HandlePreviewData(const sp<IMemory>& dataPtr, void* user)
{
    LOGV("%s", __FUNCTION__);
    if (user != NULL) {
        struct legacy_camera_device *lcdev = (struct legacy_camera_device *) user;
        ssize_t  offset;
        size_t   size;
        sp<IMemoryHeap> mHeap = dataPtr->getMemory(&offset, &size);
        char* buffer = (char*)mHeap->getBase() + offset;
        CameraHAL_ProcessPreviewData(buffer, size, lcdev);
    }
}

camera_memory_t* CameraHAL_GenClientData(const sp<IMemory> &dataPtr,
                                void *user)
{
    ssize_t          offset;
    size_t           size;
    camera_memory_t *clientData = NULL;
    struct legacy_camera_device *lcdev = (struct legacy_camera_device *) user;
    sp<IMemoryHeap> mHeap = dataPtr->getMemory(&offset, &size);

    LOGV("CameraHAL_GenClientData: offset:%#x size:%#x base:%p\n",
          (unsigned)offset, size, mHeap != NULL ? mHeap->base() : 0);

    LOGV("%s: #1", __FUNCTION__);
    clientData = lcdev->request_memory(-1, size, 1, lcdev->user);
    LOGV("%s: #2", __FUNCTION__);
    if (clientData != NULL) {
        memcpy(clientData->data, (char *)(mHeap->base()) + offset, size);
    LOGV("%s: #3", __FUNCTION__);
    } else {
        LOGV("CameraHAL_GenClientData: ERROR allocating memory from client\n");
    }
    return clientData;
}

void CameraHAL_DataCb(int32_t msg_type, const sp<IMemory>& dataPtr,
                      void *user)
{
    struct legacy_camera_device *lcdev = (struct legacy_camera_device *) user;

    LOGV("CameraHAL_DataCb: msg_type:%d user:%p\n", msg_type, user);

    if (lcdev->data_callback != NULL && lcdev->request_memory != NULL) {
        /* Make sure any pre-existing heap is released */
        if (lcdev->clientData != NULL) {
            lcdev->clientData->release(lcdev->clientData);
            lcdev->clientData = NULL;
        }
        lcdev->clientData = CameraHAL_GenClientData(dataPtr, lcdev);
        if (lcdev->clientData != NULL) {
            LOGV("CameraHAL_DataCb: Posting data to client\n");
            lcdev->data_callback(msg_type, lcdev->clientData, 0, NULL, lcdev->user);
        }
    }

    if (msg_type == CAMERA_MSG_PREVIEW_FRAME && lcdev->overlay == NULL) {
        LOGV("CameraHAL_DataCb: preview size = %dx%d\n", lcdev->previewWidth, lcdev->previewHeight);
        CameraHAL_HandlePreviewData(dataPtr, lcdev);
    }
}

void CameraHAL_DataTSCb(nsecs_t timestamp, int32_t msg_type,
                         const sp<IMemory>& dataPtr, void *user)
{
    struct legacy_camera_device *lcdev = (struct legacy_camera_device *) user;

    LOGD("CameraHAL_DataTSCb: timestamp:%lld msg_type:%d user:%p\n",
          timestamp /1000, msg_type, user);

    if (lcdev->data_callback != NULL && lcdev->request_memory != NULL) {
        camera_memory_t *clientData = CameraHAL_GenClientData(dataPtr, lcdev);
        if (clientData != NULL) {
            LOGV("CameraHAL_DataTSCb: Posting data to client timestamp:%lld\n",
                  systemTime());
            lcdev->data_timestamp_callback(timestamp, msg_type, clientData, 0, lcdev->user);
            lcdev->hwif->releaseRecordingFrame(dataPtr);
        } else {
            LOGD("CameraHAL_DataTSCb: ERROR allocating memory from client\n");
        }
    }
}

/* HAL helper functions. */
void CameraHAL_NotifyCb(int32_t msg_type, int32_t ext1, int32_t ext2, void *user) {
    struct legacy_camera_device *lcdev = (struct legacy_camera_device *) user;

    if (NULL == lcdev) {
      return;
    }

    LOGV("%s: msg_type:%d ext1:%d ext2:%d user:%p\n", __FUNCTION__, msg_type, ext1, ext2, user);
    if (lcdev->notify_callback != NULL) {
        lcdev->notify_callback(msg_type, ext1, ext2, lcdev->user);
    }
}

int CameraHAL_GetCam_Info(int camera_id, struct camera_info *info)
{
    int rv = 0;
    LOGV("CameraHAL_GetCam_Info()");

    CameraInfo cam_info;
    HAL_getCameraInfo(camera_id, &cam_info);

    info->facing = cam_info.facing;
    info->orientation = 90;

    LOGD("%s: id:%i faceing:%i orientation: %i", __FUNCTION__,
          camera_id, info->facing, info->orientation);

    return rv;
}

void CameraHAL_FixupParams(CameraParameters &settings)
{
    /* Motorola camera doesn't support YUV420sp...
    * it advertises so, but then sends "yuv422i-yuyv"
    */
    settings.set(CameraParameters::KEY_VIDEO_FRAME_FORMAT, CameraParameters::PIXEL_FORMAT_YUV422I);
    settings.setPreviewFormat(CameraParameters::PIXEL_FORMAT_YUV422I);

    /* defy: focus locks the camera, but dunno how to disable it... */
    if (!settings.get(android::CameraParameters::KEY_SUPPORTED_FOCUS_MODES))
        settings.set(android::CameraParameters::KEY_SUPPORTED_FOCUS_MODES, "auto,macro,infinity,off");

    if (!settings.get(android::CameraParameters::KEY_SUPPORTED_EFFECTS))
        settings.set(android::CameraParameters::KEY_SUPPORTED_EFFECTS, "none,mono,negative,sepia");

    if (!settings.get(android::CameraParameters::KEY_SUPPORTED_SCENE_MODES))
        settings.set(android::CameraParameters::KEY_SUPPORTED_EFFECTS,
                     "auto,portrait,landscape,action,night-portrait,sunset,steadyphoto");

    settings.set(android::CameraParameters::KEY_EXPOSURE_COMPENSATION, "0");

    //LibSOCJordanCamera( 2113): Failed substring capabilities check, unsupported parameter newparam=on parseTable[i].key=focus-mode,currparam=auto
    const char *str_focus = settings.get(android::CameraParameters::KEY_FOCUS_MODE);
    if (strcmp(str_focus, "on") == 0) {
        settings.set(android::CameraParameters::KEY_FOCUS_MODE, "auto");
    }

    /* defy: required to prevent panorama crash, but require also opengl ui */
    const char *fps_range_values = "(1000,10000),(1000,11000),(1000,15000),(1000,20000),"
                                   "(1000,25000),(1000,24000),(1000,30000)";
    if (!settings.get(android::CameraParameters::KEY_PREVIEW_FPS_RANGE))
        settings.set(android::CameraParameters::KEY_PREVIEW_FPS_RANGE, fps_range_values);

    LOGD("Parameters fixed up");
}

/* Hardware Camera interface handlers. */
int camera_set_preview_window(struct camera_device * device, struct preview_stream_ops *window) {
    int rv = -EINVAL;
    const int kBufferCount = 4;
    struct legacy_camera_device *lcdev = to_lcdev(device);

    LOGV("camera_set_preview_window : Window :%p\n", window);
    if (device == NULL) {
        LOGE("camera_set_preview_window : Invalid device.\n");
        return -EINVAL;
    }

    if (lcdev->window == window) {
        return 0;
    }

    lcdev->window = window;

    if (!window) {
        LOGD("%s: window is NULL", __FUNCTION__);
        return -EINVAL;
    }

    LOGD("%s : OK window is %p", __FUNCTION__, window);

    if (!lcdev->gralloc) {
        hw_module_t const* module;
        int err = 0;
        if (hw_get_module(GRALLOC_HARDWARE_MODULE_ID, &module) == 0) {
            lcdev->gralloc = (const gralloc_module_t *)module;
        } else {
            LOGE("%s: Fail on loading gralloc HAL", __FUNCTION__);
        }
    }

    LOGD("%s: OK on loading gralloc HAL", __FUNCTION__);
    int min_bufs = -1;
    if (window->get_min_undequeued_buffer_count(window, &min_bufs)) {
        LOGE("%s: could not retrieve min undequeued buffer count", __FUNCTION__);
        return -1;
    }
    LOGD("%s: OK get_min_undequeued_buffer_count", __FUNCTION__);

    LOGD("%s: bufs:%i", __FUNCTION__, min_bufs);
    if (min_bufs >= kBufferCount) {
        LOGE("%s: min undequeued buffer count %i is too high (expecting at most %i)", __FUNCTION__, min_bufs, kBufferCount - 1);
    }

    LOGD("%s: setting buffer count to %i", __FUNCTION__, kBufferCount);
    if (window->set_buffer_count(window, kBufferCount)) {
        LOGE("%s: could not set buffer count", __FUNCTION__);
        return -1;
    }

    CameraParameters params(lcdev->hwif->getParameters());
    params.getPreviewSize(&lcdev->previewWidth, &lcdev->previewHeight);
    int hal_pixel_format = HAL_PIXEL_FORMAT_RGBA_8888; // It's becaise we don't really have hw acceleration... it's from default gralloc

    const char *str_preview_format = params.getPreviewFormat();
    LOGD("%s: preview format %s", __FUNCTION__, str_preview_format);
    lcdev->previewFormat = getOverlayFormatFromString(str_preview_format);
    lcdev->previewBpp = getBppFromOverlayFormat(lcdev->previewFormat);

    if (window->set_usage(window, GRALLOC_USAGE_SW_WRITE_OFTEN | GRALLOC_USAGE_SW_READ_OFTEN)) {
        LOGE("%s: could not set usage on gralloc buffer", __FUNCTION__);
        return -1;
    }

    if (window->set_buffers_geometry(window, lcdev->previewWidth, lcdev->previewHeight, hal_pixel_format)) {
        LOGE("%s: could not set buffers geometry", __FUNCTION__);
        return -1;
    }

    if (lcdev->hwif->useOverlay()) {
      LOGI("%s: Using overlay for device %p", __FUNCTION__, lcdev);
      lcdev->overlay= new Overlay(lcdev->previewWidth, lcdev->previewHeight,  lcdev->previewFormat, queue_buffer_hook, (void*) lcdev);
      lcdev->hwif->setOverlay(lcdev->overlay);
    }

    return NO_ERROR;
}

void camera_set_callbacks(struct camera_device * device,
                             camera_notify_callback notify_cb,
                             camera_data_callback data_cb,
                             camera_data_timestamp_callback data_cb_timestamp,
                             camera_request_memory get_memory, void *user)
{
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_set_callbacks: notify_cb: %p, data_cb: %p "
          "data_cb_timestamp: %p, get_memory: %p, user :%p",
          notify_cb, data_cb, data_cb_timestamp, get_memory, user);

    lcdev->notify_callback = notify_cb;
    lcdev->data_callback = data_cb;
    lcdev->data_timestamp_callback = data_cb_timestamp;
    lcdev->request_memory = get_memory;
    lcdev->user = user;

    lcdev->hwif->setCallbacks(CameraHAL_NotifyCb, CameraHAL_DataCb,
                                 CameraHAL_DataTSCb, (void *) lcdev);
}

void camera_enable_msg_type(struct camera_device * device, int32_t msg_type) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_enable_msg_type: msg_type:%d\n", msg_type);
    lcdev->hwif->enableMsgType(msg_type);
}

void camera_disable_msg_type(struct camera_device * device, int32_t msg_type) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_disable_msg_type: msg_type:%d\n", msg_type);
    lcdev->hwif->disableMsgType(msg_type);
}

int camera_msg_type_enabled(struct camera_device * device, int32_t msg_type) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_msg_type_enabled: msg_type:%d\n", msg_type);
    return lcdev->hwif->msgTypeEnabled(msg_type);
}

int camera_start_preview(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_start_preview:\n");
    return lcdev->hwif->startPreview();
}

void camera_stop_preview(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_stop_preview:\n");
    lcdev->hwif->stopPreview();
    return;
}

int camera_preview_enabled(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    int ret = lcdev->hwif->previewEnabled();
    LOGV("camera_preview_enabled: %d\n", ret);
    return ret;
}

int camera_store_meta_data_in_buffers(struct camera_device * device, int enable) {
    /*struct legacy_camera_device *lcdev = to_lcdev(device);
    int ret = lcdev->hwif->storeMetaDataInBuffers(enable);*/
    LOGV("camera_store_meta_data_in_buffers:\n");
    return NO_ERROR;
}

int camera_start_recording(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_start_recording\n");
    lcdev->hwif->startRecording();
    return NO_ERROR;
}

void camera_stop_recording(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_stop_recording:\n");
    lcdev->hwif->stopRecording();
}

int camera_recording_enabled(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_recording_enabled:\n");
    return (int)lcdev->hwif->recordingEnabled();
}

void camera_release_recording_frame(struct camera_device * device, const void *opaque) {
    /*
     * We release the frame immediately in CameraHAL_DataTSCb after making a
     * copy. So, this is just a NOP.
     */
    LOGV("camera_release_recording_frame: opaque:%p\n", opaque);
}

int camera_auto_focus(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_auto_focus:\n");
    lcdev->hwif->autoFocus();
    return NO_ERROR;
}

int camera_cancel_auto_focus(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_cancel_auto_focus:\n");
    lcdev->hwif->cancelAutoFocus();
    return NO_ERROR;
}

int camera_take_picture(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_take_picture:\n");

    lcdev->hwif->takePicture();
    return NO_ERROR;
}

int camera_cancel_picture(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_cancel_picture:\n");
    lcdev->hwif->cancelPicture();
    return NO_ERROR;
}

int camera_set_parameters(struct camera_device * device, const char *params) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGD("camera_set_parameters: %s\n", params);
    String8 s(params);
    CameraParameters p(s);

    lcdev->hwif->setParameters(p);
    return NO_ERROR;
}

char* camera_get_parameters(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    char *rc = NULL;
    LOGD("camera_get_parameters\n");
    CameraParameters params(lcdev->hwif->getParameters());
    CameraHAL_FixupParams(params);
    rc = strdup((char *)params.flatten().string());
    LOGD("camera_get_parameters: returning rc:%p :%s\n",
          rc, (rc != NULL) ? rc : "EMPTY STRING");
    return rc;
}

void camera_put_parameters(struct camera_device *device, char *params) {
    if (params != NULL) {
        free(params);
    }
}

int camera_send_command(struct camera_device * device, int32_t cmd, int32_t arg0, int32_t arg1) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_send_command: cmd:%d arg0:%d arg1:%d\n", cmd, arg0, arg1);
    return lcdev->hwif->sendCommand(cmd, arg0, arg1);
}

void camera_release(struct camera_device * device) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_release:\n");
    //lcdev->hwif->release();
}

int camera_dump(struct camera_device * device, int fd) {
    struct legacy_camera_device *lcdev = to_lcdev(device);
    LOGV("camera_dump:\n");
    Vector<String16> args;
    return lcdev->hwif->dump(fd, args);
}

int camera_device_close(hw_device_t* device) {
    struct camera_device * hwdev = reinterpret_cast<struct camera_device *>(device);
    struct legacy_camera_device *lcdev = to_lcdev(hwdev);
    int rc = -EINVAL;
    LOGD("camera_device_close\n");
    if (lcdev != NULL) {
        camera_device_ops_t *camera_ops = lcdev->device.ops;
        if (camera_ops) {
            if (lcdev->hwif != NULL) {
                lcdev->hwif.clear();
            }
            free(camera_ops);
        }
        free(lcdev);
        rc = NO_ERROR;
    }
    return rc;
}

int camera_device_open(const hw_module_t* module, const char* name, hw_device_t** device) {
    int ret;
    struct legacy_camera_device *lcdev;
    camera_device_t* camera_device;
    camera_device_ops_t* camera_ops;

    if (NULL == name) {
        return 0;
    }

    int cameraId = atoi(name);

    LOGD("%s: name:%s device:%p cameraId:%d\n", __FUNCTION__, name, device, cameraId);

    lcdev = (struct legacy_camera_device *)calloc(1, sizeof(*lcdev));
    //if lcdev = null -ENOMEM
    camera_ops = (camera_device_ops_t *)malloc(sizeof(*camera_ops));
    memset(camera_ops, 0, sizeof(*camera_ops));

    lcdev->device.common.tag               = HARDWARE_DEVICE_TAG;
    lcdev->device.common.version           = 0;
    lcdev->device.common.module            = (hw_module_t *)(module);
    lcdev->device.common.close             = camera_device_close;
    lcdev->device.ops                      = camera_ops;

    camera_ops->set_preview_window         = camera_set_preview_window;
    camera_ops->set_callbacks              = camera_set_callbacks;
    camera_ops->enable_msg_type            = camera_enable_msg_type;
    camera_ops->disable_msg_type           = camera_disable_msg_type;
    camera_ops->msg_type_enabled           = camera_msg_type_enabled;
    camera_ops->start_preview              = camera_start_preview;
    camera_ops->stop_preview               = camera_stop_preview;
    camera_ops->preview_enabled            = camera_preview_enabled;
    camera_ops->store_meta_data_in_buffers = camera_store_meta_data_in_buffers;
    camera_ops->start_recording            = camera_start_recording;
    camera_ops->stop_recording             = camera_stop_recording;
    camera_ops->recording_enabled          = camera_recording_enabled;
    camera_ops->release_recording_frame    = camera_release_recording_frame;
    camera_ops->auto_focus                 = camera_auto_focus;
    camera_ops->cancel_auto_focus          = camera_cancel_auto_focus;
    camera_ops->take_picture               = camera_take_picture;
    camera_ops->cancel_picture             = camera_cancel_picture;

    camera_ops->set_parameters             = camera_set_parameters;
    camera_ops->get_parameters             = camera_get_parameters;
    camera_ops->put_parameters             = camera_put_parameters;
    camera_ops->send_command               = camera_send_command;
    camera_ops->release                    = camera_release;
    camera_ops->dump                       = camera_dump;

    lcdev->id = cameraId;
    lcdev->hwif = HAL_openCameraHardware(cameraId);
    if (lcdev->hwif == NULL) {
         ret = -EIO;
         goto err_create_camera_hw;
    }
    *device = &lcdev->device.common;
    return NO_ERROR;

err_create_camera_hw:
    free(lcdev);
    free(camera_ops);
    return ret;
}

} /* namespace android */
