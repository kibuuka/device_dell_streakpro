#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8660 configs
$(call inherit-product, device/dell/msm8660-common/msm8660.mk)

DEVICE_PACKAGE_OVERLAYS += device/dell/streakpro/overlay

#Trying to make adb working prior to booting into gui
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.adb.enable=1

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# GPS and Light
PRODUCT_PACKAGES += \
    gps.streakpro \
    lights.streakpro
## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

# Wifi Calling
PRODUCT_PACKAGES += \
    GanOptimizer


# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/dell/streakpro/streakpro-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/dell/streakpro/overlay


# Ramdisk files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.streakpro.rc:root/init.streakpro.rc \
    $(LOCAL_PATH)/ramdisk/fstab.streakpro:root/fstab.streakpro \
    $(LOCAL_PATH)/ramdisk/init.streakpro.usb.rc:root/init.streakpro.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.streakpro.rc:root/ueventd.streakpro.rc \
    $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/ramdisk/init.chgonly.rc:root/init.chgonly.rc \
    $(LOCAL_PATH)/ramdisk/default.prop:root/default.prop
# #   $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
# #   $(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
# #   $(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
# #   $(LOCAL_PATH)/ramdisk/init.goldfish.rc:root/init.goldfish.rc \

# Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/surf_keypad_mute.kl:system/usr/keylayout/surf_keypad_mute.kl \
    $(LOCAL_PATH)/configs/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
    $(LOCAL_PATH)/configs/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    $(LOCAL_PATH)/configs/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    $(LOCAL_PATH)/configs/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl \
    $(LOCAL_PATH)/configs/ffa-keypad_numeric.kcm.bin:system/usr/keychars/ffa-keypad_numeric.kcm.bin \
    $(LOCAL_PATH)/configs/ffa-keypad_qwerty.kcm.bin:system/usr/keychars/ffa-keypad_qwerty.kcm.bin \
    $(LOCAL_PATH)/configs/fluid-keypad_numeric.kcm.bin:system/usr/keychars/fluid-keypad_numeric.kcm.bin \
    $(LOCAL_PATH)/configs/fluid-keypad_qwerty.kcm.bin:system/usr/keychars/fluid-keypad_qwerty.kcm.bin \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab 
    


# Wifi
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
#    $(LOCAL_PATH)/wifi/dhd.ko:system/lib/modules/dhd.ko


# Sensor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/libs/sensors.qcom.so:system/lib/hw/sensors.msm8660.so


# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml 
    
# APN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml
       
# Vsync
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/libs/vsync.ko:system/lib/modules/vsync.ko

$(call inherit-product, build/target/product/full.mk)

# Additional (as os msm8660) permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  





PRODUCT_NAME := cm_streakpro
PRODUCT_BRAND := dell
PRODUCT_DEVICE := streakpro
PRODUCT_MODEL := Dell Streak Pro
PRODUCT_MANUFACTURER := DELL
