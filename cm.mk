## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/droid2we/droid2we.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_droid2we
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := droid2we
PRODUCT_MODEL := A956
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := vzw

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid2Global

#Set build fingerprint / ID / Prduct Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=yakju BUILD_ID=ITL41D BUILD_DISPLAY_ID=ITL41D BUILD_FINGERPRINT="google/yakju/maguro:4.0.1/ITL41D/223971:user/release-keys" PRVIATE_BUILD_DESC="yakju-user 4.0.1 ITL41D 223971 release-keys"

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
#   BUILD_ID=5.5.1_84_D3G-55 \
   PRODUCT_NAME=${PRODUCT_DEVICE}_${PRODUCT_SFX} \
   BUILD_NUMBER=${DATE} \
   TARGET_DEVICE=cdma_droid2we \
#   BUILD_DISPLAY_ID=5.5.1_84_D3G-55 \
#   BUILD_FINGERPRINT=verizon/solana_vzw/cdma_solana:4.0.1/5.5.1_84_D3G-55/${BUILD_NUMBER}:user/release-keys \
#   PRIVATE_BUILD_DESC="cdma_solana-user 4.0.1 5.5.1_84_D3G-55 "${BUILD_NUMBER}" release-keys" \
   PRODUCT_BRAND=verizon \
   BUILD_UTC_DATE= \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=bikedude880 \
   BUILD_HOST=blackspark-dev \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \
