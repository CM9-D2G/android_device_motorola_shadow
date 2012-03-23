# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x854

# Inherit device configuration
$(call inherit-product, device/motorola/shadow/shadow.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := shadow
PRODUCT_NAME := cm_shadow
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROIDX
PRODUCT_MANUFACTURER := Motorola

