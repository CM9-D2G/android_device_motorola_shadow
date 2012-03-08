# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/shadow/shadow.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_shadow
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := shadow
PRODUCT_MODEL := DROID X
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := vzw

# Release name and versioning
PRODUCT_RELEASE_NAME := DROIDX

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)
