TOP := $(ANDROID_BUILD_TOP)
ifeq (${TOP},)
  TOP := ../../../..
endif

all: exe

exe:
	make -j8 ${TOP}/out/target/product/${TARGET_DEVICE}/obj/EXECUTABLES/charge_only_mode_intermediates/charge_only_mode ; cd -

copy:
	adb push ${TOP}/out/target/product/${TARGET_DEVICE}/obj/EXECUTABLES/charge_only_mode_intermediates/charge_only_mode /system/bin/
