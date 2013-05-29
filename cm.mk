# Inherit AOSP device configuration for salsa.
$(call inherit-product, device/acer/salsa/device_salsa.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_BRAND := acer
PRODUCT_NAME := cm_salsa
PRODUCT_DEVICE := salsa
PRODUCT_MODEL := A1
PRODUCT_MANUFACTURER := Acer
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=liquid \
BUILD_FINGERPRINT=google/yakju/maguro:4.1.2/IMM76D/299849:user/release-keys \
PRIVATE_BUILD_DESC="RomzesRover-ubuntu 4.1.2 IMM76D 299849 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := A1
PRODUCT_VERSION_DEVICE_SPECIFIC := -Liquid-WAG-Team

# Goo.im configuration (RomzesRover delete the goo manager !)
#    GOO_VERSION := $(shell date +%Y%m%d)
#PRODUCT_PROPERTY_OVERRIDES += \
#ro.goo.developerid=thepasto \
#ro.goo.rom=CM9-Liquid-WAG-Team \
#ro.goo.version=$(GOO_VERSION)

# Get eng stuff on our userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
