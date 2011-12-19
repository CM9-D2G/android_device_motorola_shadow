#
# This is the product configuration for a full droid2we
#

DEVICE_PREBUILT := device/motorola/droid2we/prebuilt

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/motorola/droid2we/overlay

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
    charger \
    charger_res_images

# Audio
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/audio/libaudio.so:/system/lib/libaudio.so \
    device/motorola/droid2we/audio/libaudiopolicy.so:/system/lib/libaudiopolicy.so \
    device/motorola/droid2we/audio/liba2dp.so:/system/lib/liba2dp.so \


# Hardware HALs
#PRODUCT_PACKAGES += \
#    lights.droid2we \
#    sensors.droid2we \

PRODUCT_PACKAGES += \
    audio.primary.droid2we \
    audio_policy.droid2we \

# Modem
PRODUCT_PACKAGES += \
    libaudiomodemgeneric \
    libreference-cdma-sms \
    rild \
    radiooptions \

# HW Libs
PRODUCT_PACKAGES += \
    hwcomposer.default \

# Wifi
PRODUCT_PACKAGES += \
    libCustomWifi \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf \

# HotSpot
PRODUCT_PACKAGES += \
    tiap_loader \
    tiap_cu \
    hostap \
    hostapd.conf \

PRODUCT_PACKAGES += \
    Camera \
    Usb \
    Superuser \
    su \
    GlobalNwSwitch \


PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \

# Rootfs files
PRODUCT_COPY_FILES += \
    device/motorola/droid2we/init.rc:root/init.rc \
    device/motorola/droid2we/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/motorola/droid2we/init.mapphone_cdma.rc:root/init.mapphone_umts.rc \
    device/motorola/droid2we/init.mapphone_cdma.usb.rc:root/init.mapphone_cdma.usb.rc \
    device/motorola/droid2we/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

# Hijack files
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/hijack:system/bin/hijack \
    $(DEVICE_PREBUILT)/bin/hijack.log_dump:system/bin/hijack.log_dump \
    $(DEVICE_PREBUILT)/etc/hijack-boot.zip:system/etc/hijack-boot.zip \

# Permissions files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/bin/mount_ext3.sh:system/bin/mount_ext3.sh \
    $(DEVICE_PREBUILT)/etc/apns-conf.xml:system/etc/apns-conf.xml \
    $(DEVICE_PREBUILT)/etc/egl.cfg:system/etc/egl.cfg \
    $(DEVICE_PREBUILT)/etc/gps.conf:system/etc/gps.conf \
    $(DEVICE_PREBUILT)/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_PREBUILT)/etc/powervr.ini:system/etc/powervr.ini \
    $(DEVICE_PREBUILT)/etc/vold.fstab:system/etc/vold.fstab \
    $(DEVICE_PREBUILT)/media/bootanimation.zip:system/media/bootanimation.zip \

# Graphics
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/imgtec/pvrsrvinit:system/bin/pvrsrvinit \
    $(DEVICE_PREBUILT)/imgtec/libEGL_POWERVR_SGX530_125.so:system/lib/egl/libEGL_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libGLESv1_CM_POWERVR_SGX530_125.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libGLESv2_POWERVR_SGX530_125.so:system/lib/egl/libGLESv2_POWERVR_SGX530_125.so \
    $(DEVICE_PREBUILT)/imgtec/libglslcompiler.so:system/lib/libglslcompiler.so \
    $(DEVICE_PREBUILT)/imgtec/libHPImgApi.so:system/lib/libHPImgApi.so \
    $(DEVICE_PREBUILT)/imgtec/libIMGegl.so:system/lib/libIMGegl.so \
    $(DEVICE_PREBUILT)/imgtec/libpvr2d.so:system/lib/libpvr2d.so \
    $(DEVICE_PREBUILT)/imgtec/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
    $(DEVICE_PREBUILT)/imgtec/libsrv_init.so:system/lib/libsrv_init.so \
    $(DEVICE_PREBUILT)/imgtec/libsrv_um.so:system/lib/libsrv_um.so \
    $(DEVICE_PREBUILT)/imgtec/libusc.so:system/lib/libusc.so \
    $(DEVICE_PREBUILT)/imgtec/libeglinfo.so:system/lib/egl/libeglinfo.so \
    $(DEVICE_PREBUILT)/imgtec/libgles1_texture_stream.so:system/lib/egl/libgles1_texture_stream.so \
    $(DEVICE_PREBUILT)/imgtec/libgles2_texture_stream.so:system/lib/egl/libgles2_texture_stream.so \
    $(DEVICE_PREBUILT)/imgtec/gralloc.omap3.so:system/lib/hw/gralloc.omap3.so \

# Key Layouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PREBUILT)/usr/idc/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
    $(DEVICE_PREBUILT)/usr/idc/sholes-keypad.idc:system/usr/idc/sholes-keypad.idc \
    $(DEVICE_PREBUILT)/usr/keylayout/qtouch-touchscreen.kl:system/usr/keylayout/qtouch-touchscreen.kl \
    $(DEVICE_PREBUILT)/usr/keylayout/sholes-keypad.kl:system/usr/keylayout/sholes-keypad.kl \
    $(DEVICE_PREBUILT)/usr/keychars/qtouch-touchscreen.kcm:system/usr/keychars/qtouch-touchscreen.kcm \
    $(DEVICE_PREBUILT)/usr/keychars/sholes-keypad.kcm:system/usr/keychars/sholes-keypad.kcm \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# still need to set english for audio init
PRODUCT_LOCALES += en_US

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
$(call inherit-product-if-exists, vendor/cm/config/common_full_phone.mk)

# stuff common to all Motorola phones
#$(call inherit-product, device/motorola/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := cm_droid2we
PRODUCT_DEVICE := droid2we
