# Droid Pro Board Config

# Camera
USE_CAMERA_STUB := false
BOARD_USE_LEGACY_TOUCHSCREEN := true

# inherit from the proprietary version
-include vendor/moto/droid2we/BoardConfigVendor.mk

# Processor
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := droid2we
TARGET_CPU_SMP := false
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

# Command line
TARGET_PREBUILT_KERNEL := device/motorola/droid2we/kernel
BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=498M@0x80C00000 init=/init ip=off brdrev=P3A androidboot.bootloader=0x0000 mmcparts=mmcblk1:p7(pds),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(userdata) androidboot.mode=reboot androidboot.bootloader=D011 androidboot.serialno=0A3A94CF0602D02
BOARD_KERNEL_BASE := 0x10000000

# Sensors
ENABLE_SENSORS_COMPAT := true

# Do da wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wl1271
#BOARD_SOFTAP_DEVICE         := wl1271
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1271.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_tiwlan_ap.bin"
# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_AUDIO_LEGACY := true
ifdef BOARD_USES_AUDIO_LEGACY
    COMMON_GLOBAL_CFLAGS += -DBOARD_USES_AUDIO_LEGACY
endif
#TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Recovery
BOARD_HAS_LOCKED_BOOTLOADER := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/droid2we/kernel
BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_MKE2FS := device/motorola/droid2we/releaseutils/mke2fs
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true

#BOARD_BOOTIMAGE_PARTITION_SIZE := 0x003fffff
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x004fffff
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0bdfffff   # limited so we enforce room to grow
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000

# Graphics
BOARD_EGL_CFG := device/motorola/droid2we/prebuilt/etc/egl.cfg
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DTARGET_OMAP3 -DOMAP_COMPAT -DMOTOROLA_UIDS
BOARD_NO_RGBX_8888 := true
DEFAULT_FB_NUM := 0
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_VENDOR := ti
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif
OMX_TI_OMAP_TIER_LEVEL := 10

# OMAP
OMAP_ENHANCEMENT := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3
endif

# MOTOROLA
USE_MOTOROLA_CODE := true
ifdef USE_MOTOROLA_CODE
COMMON_GLOBAL_CFLAGS += -DUSE_MOTOROLA_CODE
endif
USE_MOTOROLA_USERS := true
ifdef USE_MOTOROLA_USERS
COMMON_GLOBAL_CFLAGS += -DUSE_MOTOROLA_USERS
endif

TARGET_PROVIDES_INIT_RC := true

# OTA Packaging
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/droid2we/releasetools/droid2we_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/motorola/droid2we/releasetools/droid2we_img_from_target_files

# UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun%d/file"
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/motorola/droid2we/UsbController.cpp

# Hijack
#TARGET_NEEDS_MOTOROLA_HIJACK := true
#BOARD_HIJACK_LOG_ENABLE := true

# Misc.
#BOARD_USE_BATTERY_CHARGE_COUNTER := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_NEEDS_CUTILS_LOG := true
BOARD_USES_SECURE_SERVICES := true
BOARD_ALWAYS_INSECURE := true
BOARD_USES_KEYBOARD_HACK := true
