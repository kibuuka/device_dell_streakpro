#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# common msm8660 configs
$(call inherit-product, device/dell/msm8660-common/msm8660.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

DEVICE_PACKAGE_OVERLAYS += device/dell/streakpro/overlay

# Test, remove this in stable builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.adb.enable=1


# GPS and Light
PRODUCT_PACKAGES += \
    gps.streakpro \
    lights.streakpro
## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

# Bluetooth firmware
$(call inherit-product, device/dell/msm8660-common/bcm_hcd.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/dell/streakpro/streakpro-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/dell/streakpro/overlay


# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.streakpro.rc:root/init.streakpro.rc \
    $(LOCAL_PATH)/ramdisk/fstab.streakpro:root/fstab.streakpro \
    $(LOCAL_PATH)/ramdisk/recovery.fstab:root/recovery.fstab \
    $(LOCAL_PATH)/ramdisk/init.streakpro.usb.rc:root/init.streakpro.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.streakpro.rc:root/ueventd.streakpro.rc \
    $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/ramdisk/init.chgonly.rc:root/init.chgonly.rc
#    $(LOCAL_PATH)/ramdisk/default.prop:root/default.prop


# Some misc configuration files
PRODUCT_COPY_FILES += \
    device/dell/streakpro/configs/99kernel:system/etc/init.d/99kernel

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/surf_keypad_mute.kl:system/usr/keylayout/surf_keypad_mute.kl \
    $(LOCAL_PATH)/configs/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
    $(LOCAL_PATH)/configs/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    $(LOCAL_PATH)/configs/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    $(LOCAL_PATH)/configs/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl \
    $(LOCAL_PATH)/configs/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    $(LOCAL_PATH)/configs/ffa-keypad_numeric.kcm.bin:system/usr/keychars/ffa-keypad_numeric.kcm.bin \
    $(LOCAL_PATH)/configs/ffa-keypad_qwerty.kcm.bin:system/usr/keychars/ffa-keypad_qwerty.kcm.bin \
    $(LOCAL_PATH)/configs/fluid-keypad_numeric.kcm.bin:system/usr/keychars/fluid-keypad_numeric.kcm.bin \
    $(LOCAL_PATH)/configs/fluid-keypad_qwerty.kcm.bin:system/usr/keychars/fluid-keypad_qwerty.kcm.bin \
    $(LOCAL_PATH)/configs/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    $(LOCAL_PATH)/configs/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    $(LOCAL_PATH)/configs/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Vold.fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    


# Wifi
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
#    $(LOCAL_PATH)/wifi/dhd.ko:system/lib/modules/dhd.ko


# Sensor
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/libs/sensors.qcom.so:system/lib/hw/sensors.msm8660.so


# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml 
    
# APN
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Adreno Drivers
PRODUCT_COPY_FILES += \
    device/dell/streakpro/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/dell/streakpro/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/dell/streakpro/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/dell/streakpro/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/dell/streakpro/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y


$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Device ID
PRODUCT_NAME := cm_streakpro
PRODUCT_DEVICE := streakpro
