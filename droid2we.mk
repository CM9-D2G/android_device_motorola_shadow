#
# Copyright (C) 2009 The Android Open Source Project
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
#

#
# This is the product configuration for a generic droid2we,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/motorola/droid2we/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/motorola/droid2we/init.mapphone_umts.rc:root/init.mapphone_umts.rc \
    device/motorola/droid2we/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects

# Device overlay
#DEVICE_PACKAGE_OVERLAYS += device/motorola/droid2we/overlay

# Permissions files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Prebuilts
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/prebuilt/bin/mount_ext3.sh:system/bin/mount_ext3.sh \
    device/motorola/droid2we/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/droid2we/prebuilt/etc/gps.conf:system/etc/gps.conf \
    device/motorola/droid2we/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/motorola/droid2we/prebuilt/etc/powervr.ini:system/etc/powervr.ini \
    device/motorola/droid2we/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/motorola/droid2we/prebuilt/etc/wifi/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
    device/motorola/droid2we/prebuilt/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    device/motorola/droid2we/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/motorola/droid2we/prebuilt/usr/keylayout/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    device/motorola/droid2we/prebuilt/usr/keylayout/cdma_droid2we-keypad.kl:system/usr/keylayout/cdma_droid2we-keypad.kl \
    device/motorola/droid2we/prebuilt/usr/keylayout/usb_keyboard_102_en_us.kl:system/usr/keylayout/usb_keyboard_102_en_us.kl \
    device/motorola/droid2we/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip \

# Graphics
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/prebuilt/etc/egl.cfg:system/etc/egl.cfg \
    device/motorola/droid2we/prebuilt/imgtec/pvrsrvinit:system/bin/pvrsrvinit \
    device/motorola/droid2we/prebuilt/imgtec/libEGL_POWERVR_SGX530_125.so:system/lib/egl/libEGL_POWERVR_SGX530_125.so \
    device/motorola/droid2we/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX530_125.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \
    device/motorola/droid2we/prebuilt/imgtec/libGLESv2_POWERVR_SGX530_125.so:system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \
    device/motorola/droid2we/prebuilt/imgtec/gralloc.omap3.so:system/lib/hw/gralloc.omap3.so \
    device/motorola/droid2we/prebuilt/imgtec/libglslcompiler.so:system/lib/libglslcompiler.so \
    device/motorola/droid2we/prebuilt/imgtec/libIMGegl.so:system/lib/libIMGegl.so \
    device/motorola/droid2we/prebuilt/imgtec/libpvr2d.so:system/lib/libpvr2d.so \
    device/motorola/droid2we/prebuilt/imgtec/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    device/motorola/droid2we/prebuilt/imgtec/libsrv_init.so:system/lib/libsrv_init.so \
    device/motorola/droid2we/prebuilt/imgtec/libsrv_um.so:system/lib/libsrv_um.so \
    device/motorola/droid2we/prebuilt/imgtec/libusc.so:system/lib/libusc.so \

# HW Libs
PRODUCT_PACKAGES += \
    hwcomposer.default \

# Lights
#PRODUCT_PACKAGES += \
#    lights.droid2we \

# Sensors
#PRODUCT_PACKAGES += \
#    sensors.droid2we \

# Sandbox
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/prebuilt/bin/hijack:system/bin/hijack \
    device/motorola/droid2we/prebuilt/bin/hijack.log_dump:system/bin/hijack.log_dump \
    device/motorola/droid2we/prebuilt/etc/hijack-boot.zip:system/etc/hijack-boot.zip \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# High-density artwork where available
PRODUCT_LOCALES += hdpi

# these need to be here for the installer, just put them here for now
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/releaseutils/mke2fs:system/bin/mke2fs \
    device/motorola/droid2we/releaseutils/tune2fs:system/bin/tune2fs \
    device/motorola/droid2we/releaseutils/check_kernel:system/etc/releaseutils/check_kernel \
    device/motorola/droid2we/releaseutils/finalize_release:system/etc/finalize_release

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/droid2we/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/droid2we/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, hardware/ti/omap3/Android.mk)

$(call inherit-product-if-exists, vendor/motorola/droid2we/droid2we-vendor.mk)

# stuff common to all Motorola phones
#$(call inherit-product, device/motorola/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := full_droid2we
PRODUCT_DEVICE := droid2we
