# Copyright (C) 2008 The Android Open Source Project
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

# since we're creating our own boot package, make sure we're on droid2
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),droid2)

LOCAL_PATH:= $(call my-dir)

# output for droid2_boot
DROID2_BOOT_OUT := $(PRODUCT_OUT)/droid2-boot
DROID2_BOOT_OUT_UNSTRIPPED := $(TARGET_OUT_UNSTRIPPED)/droid2-boot

# prerequisites for building droid2-boot.zip
# we will need the bootimage made to ensure our root directory is finalized
DROID2_BOOT_PREREQS := $(INSTALLED_BOOTIMAGE_TARGET)

# copy the hijack file
file := $(DROID2_BOOT_OUT)/sbin/hijack
$(file) : $(call intermediates-dir-for,EXECUTABLES,hijack)/hijack
	@echo "Copy hijack -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a $(call intermediates-dir-for,EXECUTABLES,hijack)/hijack $@
DROID2_BOOT_PREREQS += $(file)

# copy hijack log dump if we must (we use a custom one for the chroot environment)
ifeq ($(BOARD_HIJACK_LOG_ENABLE),true)
file := $(DROID2_BOOT_OUT)/sbin/hijack.log_dump
$(file) : device/motorola/droid2/droid2-boot/hijack.log_dump
	@echo "Copy hijack.log_dump -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/droid2/droid2-boot/hijack.log_dump $@
DROID2_BOOT_PREREQS += $(file)
endif

# copy hijack kill script
file := $(DROID2_BOOT_OUT)/sbin/hijack.killall
$(file) : device/motorola/droid2/droid2-boot/hijack.killall
	@echo "Copy hijack.killall -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/droid2/droid2-boot/hijack.killall $@
DROID2_BOOT_PREREQS += $(file)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := getprop.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := droid2_boot_getprop
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libcutils libc
LOCAL_MODULE_CLASS := DROID2_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(DROID2_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(DROID2_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := getprop
DROID2_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := 2nd-init.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_CFLAGS := -0s
LOCAL_MODULE := droid2_boot_2nd-init
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libc
LOCAL_MODULE_CLASS := DROID2_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(DROID2_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(DROID2_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := 2nd-init
DROID2_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := stop.c
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := droid2_boot_stop
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libcutils libc
LOCAL_MODULE_CLASS := DROID2_BOOT_EXECUTABLES
LOCAL_MODULE_PATH := $(DROID2_BOOT_OUT)/sbin
LOCAL_UNSTRIPPED_PATH := $(DROID2_BOOT_OUT_UNSTRIPPED)
LOCAL_MODULE_STEM := stop
DROID2_BOOT_PREREQS += $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM)
include $(BUILD_EXECUTABLE)

# now we make the droid2-boot target files package
name := $(TARGET_PRODUCT)-droid2_boot_files
intermediates := $(call intermediates-dir-for,PACKAGING,droid2_boot_files)
BUILT_DROID2_BOOT_FILES_PACKAGE := $(intermediates)/$(name).zip
$(BUILT_DROID2_BOOT_FILES_PACKAGE) : intermediates := $(intermediates)
$(BUILT_DROID2_BOOT_FILES_PACKAGE) : \
		zip_root := $(intermediates)/$(name)

built_ota_tools := \
        $(call intermediates-dir-for,EXECUTABLES,applypatch)/applypatch \
        $(call intermediates-dir-for,EXECUTABLES,applypatch_static)/applypatch_static \
        $(call intermediates-dir-for,EXECUTABLES,check_prereq)/check_prereq \
        $(call intermediates-dir-for,EXECUTABLES,updater)/updater

$(BUILT_DROID2_BOOT_FILES_PACKAGE) : PRIVATE_OTA_TOOLS := $(built_ota_tools)
$(BUILT_DROID2_BOOT_FILES_PACKAGE) : PRIVATE_RECOVERY_API_VERSION := $(RECOVERY_API_VERSION)
$(BUILT_DROID2_BOOT_FILES_PACKAGE) : \
		$(DROID2_BOOT_PREREQS) \
		$(INSTALLED_ANDROID_INFO_TXT_TARGET) \
		$(built_ota_tools) \
		$(HOST_OUT_EXECUTABLES)/fs_config \
		| $(ACP)
	@echo "Package droid2-boot files: $@"
	$(hide) rm -rf $@ $(zip_root)
	$(hide) mkdir -p $(dir $@) $(zip_root)
	@# Components of the boot section
	$(hide) mkdir -p $(zip_root)/NEWBOOT
	$(hide) $(call package_files-copy-root, \
		$(TARGET_ROOT_OUT),$(zip_root)/NEWBOOT)
	$(hide) $(call package_files-copy-root, \
		$(DROID2_BOOT_OUT),$(zip_root)/NEWBOOT)
	@# Contents of the OTA package
	$(hide) mkdir -p $(zip_root)/OTA/bin
	$(hide) $(ACP) $(INSTALLED_ANDROID_INFO_TXT_TARGET) $(zip_root)/OTA/
	$(hide) $(ACP) $(PRIVATE_OTA_TOOLS) $(zip_root)/OTA/bin/
	@# Files required to build an update.zip
	$(hide) mkdir -p $(zip_root)/META
	$(hide) echo "recovery_api_version=$(PRIVATE_RECOVERY_API_VERSION)" > $(zip_root)/META/misc_info.txt
	@# Zip everything up, preserving symlinks
	$(hide) (cd $(zip_root) && zip -qry ../$(notdir $@) .)
	@# Run fs_config on all the boot files in the zip and save the output
	$(hide) echo "newboot 0 0 755" > $(zip_root)/META/filesystem_config.txt
	$(hide) zipinfo -1 $@ \
		| awk -F/ 'BEGIN { OFS="/" } /^NEWBOOT\/./' \
		| sed -r 's/^NEWBOOT\///' \
		| $(HOST_OUT_EXECUTABLES)/fs_config \
		| sed -r 's/^/newboot\//' >> $(zip_root)/META/filesystem_config.txt
	$(hide) (cd $(zip_root) && zip -q ../$(notdir $@) META/filesystem_config.txt)

# next it's the OTA target
DROID2_BOOT_OTA_PACKAGE_TARGET := $(PRODUCT_OUT)/droid2-boot.zip
$(DROID2_BOOT_OTA_PACKAGE_TARGET) : $(BUILT_DROID2_BOOT_FILES_PACKAGE) $(OTATOOLS)
	@echo "Package droid2-boot OTA: $@"
	$(hide) ./device/motorola/droid2/releasetools/droid2_boot_ota_from_target_files -v \
	   -p $(HOST_OUT) \
	   -k $(KEY_CERT_PAIR) \
	   --backup=$(false) \
	   --override_device=auto \
	   $(BUILT_DROID2_BOOT_FILES_PACKAGE) $@

# then copy the OTA to /system/etc
DROID2_BOOT := $(TARGET_OUT_ETC)/droid2-boot.zip
$(DROID2_BOOT) : $(DROID2_BOOT_OTA_PACKAGE_TARGET) | $(ACP)
	@echo "Copy droid2-boot OTA -> $@"
	$(hide) $(ACP) $(DROID2_BOOT_OTA_PACKAGE_TARGET) $(DROID2_BOOT)

# finally add the ota in /system/etc to ALL_PREBUILT so that all of this will get pulled
# in as dependencies and built
ALL_PREBUILT += $(DROID2_BOOT)

endif
