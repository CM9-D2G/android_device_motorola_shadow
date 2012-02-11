## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/moto/droid2we/droid2we.mk)

# Inherit our vendor filez, yo.
$(call inherit-product, vendor/motorola/droid2we/droid2we-vendor.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_droid2we
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := droid2we
PRODUCT_MODEL := Droid2Global
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := vzw

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid2Global

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)
