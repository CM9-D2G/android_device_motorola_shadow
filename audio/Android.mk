ifeq ($(BOARD_USES_AUDIO_LEGACY),true)

LOCAL_PATH := $(call my-dir)

# output for libaudio intermediates
LIBAUDIO_INTERMEDIATES_PREREQS := $(PRODUCT_OUT)/obj/lib

# prerequisites for building audio
file := $(LIBAUDIO_INTERMEDIATES_PREREQS)/libaudio.so
$(file) : device/motorola/shadow/audio/libaudio.so
	@echo "Copy libaudio.so -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/shadow/audio/libaudio.so $@

file := $(LIBAUDIO_INTERMEDIATES_PREREQS)/liba2dp.so
$(file) : device/motorola/shadow/audio/liba2dp.so
	@echo "Copy liba2dp.so -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/motorola/shadow/audio/liba2dp.so $@

include $(all-subdir-makefiles)

endif # BOARD_USES_AUDIO_LEGACY
