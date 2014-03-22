# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Millenium

TARGET_BOOTANIMATION_NAME := 540

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit AOSP device configuration for SPRO.
$(call inherit-product, device/dell/streakpro/streakpro.mk)

# Device naming
PRODUCT_DEVICE := streakpro
PRODUCT_NAME := cm_streakpro
PRODUCT_BRAND := dell
PRODUCT_MODEL := Dell Streak Pro
PRODUCT_MANUFACTURER := DELL

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
