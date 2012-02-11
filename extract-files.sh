#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE=droid2we

mkdir -p ../../../vendor/moto/$DEVICE/proprietary
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/app
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/bin
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/etc
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/etc/firmware
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/lib
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/lib/hw
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/lib/egl
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/tts/lang_pico
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/usr/keychars
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/usr/keylayout
mkdir -p ../../../vendor/moto/$DEVICE/proprietary/xbin



adb pull /system/app/PhoneConfig.apk ../../../vendor/moto/$DEVICE/proprietary/app
adb pull /system/app/ProgramMenu.apk ../../../vendor/moto/$DEVICE/proprietary/app
adb pull /system/app/ProgramMenuSystem.apk ../../../vendor/moto/$DEVICE/proprietary/app

adb pull /system/bin/Hostapd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/SaveBPVer ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/akmd2 ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/ap_gain.bin ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/ap_gain_mmul.bin ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/batch ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/battd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/btcmd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/bthelp ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/bttest_mot ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/charge_only_mode ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/chat-ril ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/dbvc_atvc_property_set ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/dmt ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/dund ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/ecckeyd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/fdisk ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/firewall.sh ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/ftmipcd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/gkilogd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/loadpreinstalls.sh ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/mdm_panicd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/napics.sh ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/pppd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/pppd-ril ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/pvrsrvinit ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/secclkd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/smc_pa_ctrl ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/smoduled ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/startup_smc.sh ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/tcmd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/testpppd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/tstmetainfo ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/usbd ../../../vendor/moto/$DEVICE/proprietary/bin
adb pull /system/bin/battd ../../../vendor/moto/$DEVICE/proprietary/bin

adb pull /system/etc/amazon-kindle.properties ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/backup_targets.csv ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/cameraCalFileDef5M.bin ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/excluded-input-devices.xml ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/firmware/wl1271.bin ../../../vendor/moto/$DEVICE/proprietary/etc/firmware
adb pull /system/etc/fm_rx_init_1273.2.bts ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/fm_rx_init_6450.2.bts ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/fmc_init_1273.2.bts ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/fmc_init_6450.2.bts ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/ppp/peers/pppd-ril.options ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/priority_notifications_config.xml ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/security/mancacerts.zip ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/security/oprcacerts.zip ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/security/suplcerts.bks ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/smc_android_cfg.ini ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/smc_android_cfg_256.ini ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/smc_pa.ift ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/smc_pa_pk_4_ipa.bin ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/supportedlocales.conf ../../../vendor/moto/$DEVICE/proprietary/etc
adb pull /system/etc/vzwpubagps.cer ../../../vendor/moto/$DEVICE/proprietary/etc

#adb pull /system/etc/wifi/fw_tiwlan_ap.bin ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/fw_wlan1271.bin ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
#adb pull /system/etc/wifi/hostapd.conf.templet ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/tiwlan.ini ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
#adb pull /system/etc/wifi/tiwlan_ap.ini ../../../vendor/moto/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/moto/$DEVICE/proprietary/etc/wifi

adb pull /system/lib/dsp/baseimage.dof ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/conversions.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/h264vdec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/h264venc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/jpegenc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/m4venc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mp3dec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mp4vdec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mpeg4aacdec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/mpeg4aacenc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/nbamrdec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/nbamrenc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/postprocessor_dualout.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/ringio.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/usn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wbamrdec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wbamrenc_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wmadec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp
adb pull /system/lib/dsp/wmv9dec_sn.dll64P ../../../vendor/moto/$DEVICE/proprietary/lib/dsp

adb pull /system/lib/egl/libEGL_POWERVR_SGX530_125.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libGLESv2_POWERVR_SGX530_125.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libeglinfo.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libgles1_texture_stream.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl
adb pull /system/lib/egl/libgles2_texture_stream.so ../../../vendor/moto/$DEVICE/proprietary/lib/egl

adb pull /system/lib/hw/gralloc.omap3.so ../../../vendor/moto/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/lights.venus2.so ../../../vendor/moto/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/sensors.venus2.so ../../../vendor/moto/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/gps.venus2.so ../../../vendor/moto/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/overlay.omap3.so ../../../vendor/moto/$DEVICE/proprietary/lib/hw

adb pull /system/lib/libHPImgApi.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libIMGegl.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.AAC.decode.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.AMR.decode.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.MP3.decode.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.WBAMR.decode.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libOMX.TI.WMA.decode.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libWifiAPHardware.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libarcsoftpe.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libarcsoft.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libbattd.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libcaps.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libcryptoki.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libdmengine.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libdmjavaplugin.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libglslcompiler.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libhostapd_client.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libimage_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libjanus.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libjanus_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmediaext.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmetainfo.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_atcmd.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_atcmd_mflex.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_bluetooth_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_btpan_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmot_led.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmotdrm1.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmotdrm1_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_netutil.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_ril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmotodbgutils.so ../../../vendor/moto/$DEVICE/proprietary/lib
# adb pull /system/lib/libmotoims-sms.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmtp_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmtpstack.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libnativedrm1.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/liboemcamera.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libomx_arcomxcore_sharedlibrary.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libomx_evrcdec_sharedlibrary.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libomx_qcelpdec_sharedlibrary.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libomx_qcelpenc_sharedlibrary.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libomx_wmadec_sharedlibrary.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libopencore_arcaudiolocal.so ../../../vendor/moto/$DEVICE/proprietary/lib
#adb pull /system/lib/libopencore_arcaudiolocalreg.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpanorama.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpanorama_jni.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpkip.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin-ril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libprojectM.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libprovlib.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpvr2d.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpvrANDROID_WSEGL.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libscalado.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libsmapi.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libsrv_init.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libsrv_um.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libssmgr.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libtpa.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libtpa_core.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libui3d.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libvideoeditorlite.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libwbxmlparser.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libaudio.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libcamera.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libnmea.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libril_rds.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/librds_util.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libsmiledetect.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libsmiledetect.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libLCML.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libbridge.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libmoto_ril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libpppd_plugin-ril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libreference-ril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libril.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libril_rds.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libbattd.so ../../../vendor/moto/$DEVICE/proprietary/lib
adb pull /system/lib/libusc.so ../../../vendor/moto/$DEVICE/proprietary/lib


adb pull /system/tts/lang_pico/en-US_lh0_sg.bin ../../../vendor/moto/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/en-US_ta.bin ../../../vendor/moto/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/es-ES_ta.bin ../../../vendor/moto/$DEVICE/proprietary/tts/lang_pico
adb pull /system/tts/lang_pico/es-ES_zl0_sg.bin ../../../vendor/moto/$DEVICE/proprietary/tts/lang_pico

adb pull /system/usr/keychars/cdma_venus2-keypad.kcm.bin ../../../vendor/moto/$DEVICE/proprietary/usr/keychars

adb pull /system/usr/keylayout/cdma_venus2-keypad.kl ../../../vendor/moto/$DEVICE/proprietary/usr/keylayout
adb pull /system/usr/keylayout/cpcap-key.kl ../../../vendor/moto/$DEVICE/proprietary/usr/keylayout

adb pull /system/xbin/backup ../../../vendor/moto/$DEVICE/proprietary/xbin
adb pull /system/xbin/drm1_func_test ../../../vendor/moto/$DEVICE/proprietary/xbin
adb pull /system/xbin/run_backup ../../../vendor/moto/$DEVICE/proprietary/xbin
adb pull /system/xbin/run_restore ../../../vendor/moto/$DEVICE/proprietary/xbin
adb pull /system/xbin/ssmgrd ../../../vendor/moto/$DEVICE/proprietary/xbin



(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/moto/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/moto/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/moto/__DEVICE__/proprietary/lib/libmoto_gps.so:obj/lib/libmoto_gps.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libarcsoft.so:obj/lib/libarcsoft.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libaudio.so:obj/lib/libaudio.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libnmea.so:obj/lib/libnmea.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libril_rds.so:obj/lib/libril_rds.so \\
    vendor/moto/__DEVICE__/proprietary/lib/librds_util.so:obj/lib/librds_util.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libsmiledetect.so:obj/lib/libsmiledetect.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/gralloc.omap3.so:obj/lib/hw/gralloc.omap3.so

PRODUCT_COPY_FILES += \\
    vendor/moto/__DEVICE__/proprietary/app/PhoneConfig.apk:/system/app/PhoneConfig.apk \\
    vendor/moto/__DEVICE__/proprietary/app/ProgramMenu.apk:/system/app/ProgramMenu.apk \\
    vendor/moto/__DEVICE__/proprietary/app/ProgramMenuSystem.apk:/system/app/ProgramMenuSystem.apk \\

# All the blobs necessary for venus2
PRODUCT_COPY_FILES += \\
    vendor/moto/__DEVICE__/proprietary/lib/libmoto_gps.so:/system/lib/libmoto_gps.so \\
    vendor/moto/__DEVICE__/proprietary/bin/Hostapd:/system/bin/Hostapd \\
    vendor/moto/__DEVICE__/proprietary/bin/SaveBPVer:/system/bin/SaveBPVer \\
    vendor/moto/__DEVICE__/proprietary/bin/akmd2:/system/bin/akmd2 \\
    vendor/moto/__DEVICE__/proprietary/bin/ap_gain.bin:/system/bin/ap_gain.bin \\
    vendor/moto/__DEVICE__/proprietary/bin/ap_gain_mmul.bin:/system/bin/ap_gain_mmul.bin \\
    vendor/moto/__DEVICE__/proprietary/bin/batch:/system/bin/batch \\
    vendor/moto/__DEVICE__/proprietary/bin/battd:/system/bin/battd \\
    vendor/moto/__DEVICE__/proprietary/bin/btcmd:/system/bin/btcmd \\
    vendor/moto/__DEVICE__/proprietary/bin/bthelp:/system/bin/bthelp \\
    vendor/moto/__DEVICE__/proprietary/bin/bttest_mot:/system/bin/bttest_mot \\
    vendor/moto/__DEVICE__/proprietary/bin/charge_only_mode:/system/bin/charge_only_mode \\
    vendor/moto/__DEVICE__/proprietary/bin/chat-ril:/system/bin/chat-ril \\
    vendor/moto/__DEVICE__/proprietary/bin/dbvc_atvc_property_set:/system/bin/dbvc_atvc_property_set \\
    vendor/moto/__DEVICE__/proprietary/bin/dmt:/system/bin/dmt \\
    vendor/moto/__DEVICE__/proprietary/bin/dund:/system/bin/dund \\
    vendor/moto/__DEVICE__/proprietary/bin/ecckeyd:/system/bin/ecckeyd \\
    vendor/moto/__DEVICE__/proprietary/bin/fdisk:/system/bin/fdisk \\
    vendor/moto/__DEVICE__/proprietary/bin/firewall.sh:/system/bin/firewall.sh \\
    vendor/moto/__DEVICE__/proprietary/bin/ftmipcd:/system/bin/ftmipcd \\
    vendor/moto/__DEVICE__/proprietary/bin/gkilogd:/system/bin/gkilogd \\
    vendor/moto/__DEVICE__/proprietary/bin/loadpreinstalls.sh:/system/bin/loadpreinstalls.sh \\
    vendor/moto/__DEVICE__/proprietary/bin/mdm_panicd:/system/bin/mdm_panicd \\
    vendor/moto/__DEVICE__/proprietary/bin/napics.sh:/system/bin/napics.sh \\
    vendor/moto/__DEVICE__/proprietary/bin/pppd:/system/bin/pppd \\
    vendor/moto/__DEVICE__/proprietary/bin/pppd-ril:/system/bin/pppd-ril \\
    vendor/moto/__DEVICE__/proprietary/bin/pvrsrvinit:/system/bin/pvrsrvinit \\
    vendor/moto/__DEVICE__/proprietary/bin/secclkd:/system/bin/secclkd \\
    vendor/moto/__DEVICE__/proprietary/bin/smc_pa_ctrl:/system/bin/smc_pa_ctrl \\
    vendor/moto/__DEVICE__/proprietary/bin/smoduled:/system/bin/smoduled \\
    vendor/moto/__DEVICE__/proprietary/bin/startup_smc.sh:/system/bin/startup_smc.sh \\
    vendor/moto/__DEVICE__/proprietary/bin/tcmd:/system/bin/tcmd \\
    vendor/moto/__DEVICE__/proprietary/bin/testpppd:/system/bin/testpppd \\
    vendor/moto/__DEVICE__/proprietary/bin/tstmetainfo:/system/bin/tstmetainfo \\
    vendor/moto/__DEVICE__/proprietary/bin/usbd:/system/bin/usbd \\
    vendor/moto/__DEVICE__/proprietary/etc/amazon-kindle.properties:/system/etc/amazon-kindle.properties \\
    vendor/moto/__DEVICE__/proprietary/etc/backup_targets.csv:/system/etc/backup_targets.csv \\
    vendor/moto/__DEVICE__/proprietary/etc/cameraCalFileDef5M.bin:/system/etc/cameraCalFileDef5M.bin \\
    vendor/moto/__DEVICE__/proprietary/etc/excluded-input-devices.xml:/system/etc/excluded-input-devices.xml \\
    vendor/moto/__DEVICE__/proprietary/etc/firmware/wl1271.bin:/system/etc/firmware/wl1271.bin \\
    vendor/moto/__DEVICE__/proprietary/etc/fm_rx_init_1273.2.bts:/system/etc/fm_rx_init_1273.2.bts \\
    vendor/moto/__DEVICE__/proprietary/etc/fm_rx_init_6450.2.bts:/system/etc/fm_rx_init_6450.2.bts \\
    vendor/moto/__DEVICE__/proprietary/etc/fmc_init_1273.2.bts:/system/etc/fmc_init_1273.2.bts \\
    vendor/moto/__DEVICE__/proprietary/etc/fmc_init_6450.2.bts:/system/etc/fmc_init_6450.2.bts \\
    vendor/moto/__DEVICE__/proprietary/etc/pppd-ril.options:/system/etc/ppp/peers/pppd-ril.options \\
    vendor/moto/__DEVICE__/proprietary/etc/priority_notifications_config.xml:/system/etc/priority_notifications_config.xml \\
    vendor/moto/__DEVICE__/proprietary/etc/mancacerts.zip:/system/etc/security/mancacerts.zip \\
    vendor/moto/__DEVICE__/proprietary/etc/oprcacerts.zip:/system/etc/security/oprcacerts.zip \\
    vendor/moto/__DEVICE__/proprietary/etc/suplcerts.bks:/system/etc/security/suplcerts.bks \\
    vendor/moto/__DEVICE__/proprietary/etc/smc_android_cfg.ini:/system/etc/smc_android_cfg.ini \\
    vendor/moto/__DEVICE__/proprietary/etc/smc_android_cfg_256.ini:/system/etc/smc_android_cfg_256.ini \\
    vendor/moto/__DEVICE__/proprietary/etc/smc_pa.ift:/system/etc/smc_pa.ift \\
    vendor/moto/__DEVICE__/proprietary/etc/smc_pa_pk_4_ipa.bin:/system/etc/smc_pa_pk_4_ipa.bin \\
    vendor/moto/__DEVICE__/proprietary/etc/supportedlocales.conf:/system/etc/supportedlocales.conf \\
    vendor/moto/__DEVICE__/proprietary/etc/vzwpubagps.cer:/system/etc/vzwpubagps.cer \\
    vendor/moto/__DEVICE__/proprietary/etc/wifi/fw_wlan1271.bin:/system/etc/wifi/fw_wlan1271.bin \\
    vendor/moto/__DEVICE__/proprietary/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \\
    vendor/moto/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/baseimage.dof:/system/lib/dsp/baseimage.dof \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/conversions.dll64P:/system/lib/dsp/conversions.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/h264vdec_sn.dll64P:/system/lib/dsp/h264vdec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/h264venc_sn.dll64P:/system/lib/dsp/h264venc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/jpegenc_sn.dll64P:/system/lib/dsp/jpegenc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/m4venc_sn.dll64P:/system/lib/dsp/m4venc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/mp3dec_sn.dll64P:/system/lib/dsp/mp3dec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/mp4vdec_sn.dll64P:/system/lib/dsp/mp4vdec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/mpeg4aacdec_sn.dll64P:/system/lib/dsp/mpeg4aacdec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/mpeg4aacenc_sn.dll64P:/system/lib/dsp/mpeg4aacenc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/nbamrdec_sn.dll64P:/system/lib/dsp/nbamrdec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/nbamrenc_sn.dll64P:/system/lib/dsp/nbamrenc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/postprocessor_dualout.dll64P:/system/lib/dsp/postprocessor_dualout.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/ringio.dll64P:/system/lib/dsp/ringio.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/usn.dll64P:/system/lib/dsp/usn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/wbamrdec_sn.dll64P:/system/lib/dsp/wbamrdec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/wbamrenc_sn.dll64P:/system/lib/dsp/wbamrenc_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/wmadec_sn.dll64P:/system/lib/dsp/wmadec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/dsp/wmv9dec_sn.dll64P:/system/lib/dsp/wmv9dec_sn.dll64P \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX530_125.so:/system/lib/egl/libEGL_POWERVR_SGX530_125.so \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX530_125.so:/system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libeglinfo.so:/system/lib/egl/libeglinfo.so \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libgles1_texture_stream.so:/system/lib/egl/libgles1_texture_stream.so \\
    vendor/moto/__DEVICE__/proprietary/lib/egl/libgles2_texture_stream.so:/system/lib/egl/libgles2_texture_stream.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/gralloc.omap3.so:/system/lib/hw/gralloc.omap3.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libHPImgApi.so:/system/lib/libHPImgApi.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libIMGegl.so:/system/lib/libIMGegl.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libOMX.TI.AAC.decode.so:/system/lib/libOMX.TI.AAC.decode.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libOMX.TI.AMR.decode.so:/system/lib/libOMX.TI.AMR.decode.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libOMX.TI.MP3.decode.so:/system/lib/libOMX.TI.MP3.decode.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libOMX.TI.WBAMR.decode.so:/system/lib/libOMX.TI.WBAMR.decode.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libOMX.TI.WMA.decode.so:/system/lib/libOMX.TI.WMA.decode.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libWifiAPHardware.so:/system/lib/libWifiAPHardware.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libarcsoftpe.so:/system/lib/libarcsoftpe.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libarcsoft.so:/system/lib/libarcsoft.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libbattd.so:/system/lib/libbattd.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libcaps.so:/system/lib/libcaps.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libcryptoki.so:/system/lib/libcryptoki.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libdmengine.so:/system/lib/libdmengine.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libdmjavaplugin.so:/system/lib/libdmjavaplugin.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libglslcompiler.so:/system/lib/libglslcompiler.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libhostapd_client.so:/system/lib/libhostapd_client.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libimage_jni.so:/system/lib/libimage_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libjanus.so:/system/lib/libjanus.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libjanus_jni.so:/system/lib/libjanus_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmediaext.so:/system/lib/libmediaext.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmetainfo.so:/system/lib/libmetainfo.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmot_atcmd.so:/system/lib/libmot_atcmd.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmot_atcmd_mflex.so:/system/lib/libmot_atcmd_mflex.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmot_bluetooth_jni.so:/system/lib/libmot_bluetooth_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmot_btpan_jni.so:/system/lib/libmot_btpan_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmot_led.so:/system/lib/libmot_led.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmotdrm1.so:/system/lib/libmotdrm1.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmotdrm1_jni.so:/system/lib/libmotdrm1_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmoto_netutil.so:/system/lib/libmoto_netutil.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmoto_ril.so:/system/lib/libmoto_ril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmotodbgutils.so:/system/lib/libmotodbgutils.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmtp_jni.so:/system/lib/libmtp_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmtpstack.so:/system/lib/libmtpstack.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libnativedrm1.so:/system/lib/libnativedrm1.so \\
    vendor/moto/__DEVICE__/proprietary/lib/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libomx_arcomxcore_sharedlibrary.so:/system/lib/libomx_arcomxcore_sharedlibrary.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpanorama.so:/system/lib/libpanorama.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpanorama_jni.so:/system/lib/libpanorama_jni.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpkip.so:/system/lib/libpkip.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpppd_plugin-ril.so:/system/lib/libpppd_plugin-ril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpppd_plugin.so:/system/lib/libpppd_plugin.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libprojectM.so:/system/lib/libprojectM.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libprovlib.so:/system/lib/libprovlib.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpvr2d.so:/system/lib/libpvr2d.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:/system/lib/libpvrANDROID_WSEGL.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libscalado.so:/system/lib/libscalado.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libsmapi.so:/system/lib/libsmapi.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libsrv_init.so:/system/lib/libsrv_init.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libsrv_um.so:/system/lib/libsrv_um.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libssmgr.so:/system/lib/libssmgr.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libtpa.so:/system/lib/libtpa.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libtpa_core.so:/system/lib/libtpa_core.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libui3d.so:/system/lib/libui3d.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libvideoeditorlite.so:/system/lib/libvideoeditorlite.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libwbxmlparser.so:/system/lib/libwbxmlparser.so \\
    vendor/moto/__DEVICE__/proprietary/tts/lang_pico/en-US_lh0_sg.bin:/system/tts/lang_pico/en-US_lh0_sg.bin \\
    vendor/moto/__DEVICE__/proprietary/tts/lang_pico/en-US_ta.bin:/system/tts/lang_pico/en-US_ta.bin \\
    vendor/moto/__DEVICE__/proprietary/tts/lang_pico/es-ES_ta.bin:/system/tts/lang_pico/es-ES_ta.bin \\
    vendor/moto/__DEVICE__/proprietary/tts/lang_pico/es-ES_zl0_sg.bin:/system/tts/lang_pico/es-ES_zl0_sg.bin \\
    vendor/moto/__DEVICE__/proprietary/usr/keychars/cdma_venus2-keypad.kcm.bin:/system/usr/keychars/cdma_venus2-keypad.kcm.bin \\
    vendor/moto/__DEVICE__/proprietary/usr/keychars/cdma_venus2-keypad.kcm.bin:/system/usr/keychars/qwerty.kcm.bin \\
    vendor/moto/__DEVICE__/proprietary/usr/keychars/cdma_venus2-keypad.kcm.bin:/system/usr/keychars/qwerty2.kcm.bin \\
    vendor/moto/__DEVICE__/proprietary/usr/keylayout/cdma_venus2-keypad.kl:/system/usr/keylayout/cdma_venus2-keypad.kl \\
    vendor/moto/__DEVICE__/proprietary/usr/keylayout/cdma_venus2-keypad.kl:/system/usr/keylayout/qwerty.kl \\
    vendor/moto/__DEVICE__/proprietary/usr/keylayout/cpcap-key.kl:/system/usr/keylayout/cpcap-key.kl \\
    vendor/moto/__DEVICE__/proprietary/xbin/backup:/system/xbin/backup \\
    vendor/moto/__DEVICE__/proprietary/xbin/drm1_func_test:/system/xbin/drm1_func_test \\
    vendor/moto/__DEVICE__/proprietary/xbin/run_backup:/system/xbin/run_backup \\
    vendor/moto/__DEVICE__/proprietary/xbin/run_restore:/system/xbin/run_restore \\
    vendor/moto/__DEVICE__/proprietary/xbin/ssmgrd:/system/xbin/ssmgrd \\
    vendor/moto/__DEVICE__/proprietary/lib/libaudio.so:/system/lib/libaudio.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libcamera.so:/system/lib/libcamera.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libnmea.so:/system/lib/libnmea.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libril_rds.so:/system/lib/libril_rds.so \\
    vendor/moto/__DEVICE__/proprietary/lib/librds_util.so:/system/lib/librds_util.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libsmiledetect.so:/system/lib/libsmiledetect.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libbridge.so:/system/lib/libbridge.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libLCML.so:/system/lib/libLCML.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libmoto_ril.so:/system/lib/libmoto_ril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libpppd_plugin-ril.so:/system/lib/libpppd_plugin-ril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libreference-ril.so:/system/lib/libreference-ril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libril.so:/system/lib/libril.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libril_rds.so:/system/lib/libril_rds.so \\
    vendor/moto/__DEVICE__/proprietary/lib/libbattd.so:/system/lib/libattd.so \\
    vendor/moto/__DEVICE__/proprietary/bin/battd.so:/system/bin/battd \\
    vendor/moto/__DEVICE__/proprietary/lib/libusc.so:/system/lib/libusc.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/lights.venus2.so:/system/lib/hw/lights.venus2.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/sensors.venus2.so:/system/lib/hw/sensors.venus2.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/gps.venus2.so:/system/lib/hw/gps.venus2.so \\
    vendor/moto/__DEVICE__/proprietary/lib/hw/overlay.omap3.so:/system/lib/hw/overlay.omap3.so

EOF

./setup-makefiles.sh
