# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/shadow/shadow.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := shadow
PRODUCT_NAME := cm_shadow
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROID X
PRODUCT_MANUFACTURER := Motorola

