# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# Device overlay and prebuilt directories
DEVICE_PREBUILT := device/motorola/shadow/prebuilt

# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Camera
PRODUCT_PACKAGES := \
	Camera

# Audio
PRODUCT_COPY_FILES += \
  device/motorola/shadow/audio/libaudio.so:/system/lib/libaudio.so \
  device/motorola/shadow/audio/liba2dp.so:/system/lib/liba2dp.so

PRODUCT_PACKAGES += \
  audio.primary.omap3 \
  libaudiohw_legacy \
  audio.a2dp.default \
  libaudioutils \
  hcitools \
  hciattach \
  hcidump 


PRODUCT_PACKAGES += \
  hijack-boot.zip

# Hijack files
PRODUCT_COPY_FILES += \
   $(DEVICE_PREBUILT)/etc/hijack-boot.zip:system/etc/hijack-boot.zip

#Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/shadow/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
  find device/motorola/shadow/modules -name '*.ko' \
  | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
  | tr '\n' ' ')

PRODUCT_PROPERTY_OVERRIDES += \
  persist.ril.features=0x07 \
  persist.ril.modem.ttydevice=/dev/usb/tty1-3:1.0 \
  persist.ril.mux.noofchannels=7 

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from shadow device
$(call inherit-product, device/motorola/shadow/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_shadow
PRODUCT_DEVICE := shadow
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROIDX
