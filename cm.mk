## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/shadow/shadow.mk)

# Inherit our vendor filez, yo.
$(call inherit-product, vendor/motorola/shadow/shadow-vendor.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_shadow
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := shadow
PRODUCT_MODEL := Droid X
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := vzw

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid X

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)
