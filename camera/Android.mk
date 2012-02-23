LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),droid2we)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.droid2we
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false

LOCAL_SRC_FILES += v4l2_utils.c overlay.cpp

LOCAL_SHARED_LIBRARIES += \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libhardware \
    libcamera_client \
    libcamera \

LOCAL_SHARED_LIBRARIES += libdl

include $(BUILD_SHARED_LIBRARY)

endif #TARGET_DEVICE
