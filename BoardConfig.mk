# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8660
-include device/dell/msm8660-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := streakpro

# Kernel [Settings]
CCI_TARGET_KLOG_COLLECTOR := false
BOARD_KERNEL_BASE := 0x40200000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=streakpro no_console_suspend=1 androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom
# In fact, this ^^^ seem to be unneeded for kernel to start (checked against linux-2.6.35.14-perf) successfully. Rest (commented variant below) of kernel boot params seem to be
# substituted/set by aboot/lk
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.emmc=true androidboot.hw_id=5 androidboot.serialno=305da7 androidboot.baseband=msm
#TARGET_PREBUILT_KERNEL := device/dell/streakpro/kernel
#TARGET_PREBUILT_RECOVERY_KERNEL := device/dell/streakpro/recovery_kernel

# Kernel [Build]
TARGET_KERNEL_CONFIG := da80_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro-arm-cortex-a8
TARGET_KERNEL_CUSTOM_TOOLCHAIN_SUFFIX := arm-cortex_a8-linux-gnueabi
BUILD_KERNEL := true

# Bluetooth/Wifi
#-include device/dell/msm8660-common/bcmdhd.mk
-include device/dell/msm8660-common/bcm4329.mk

# Qcom GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := streakpro

# RIL
BOARD_USES_LEGACY_RIL := true

# Recovery
TARGET_RECOVERY_FSTAB = device/dell/streakpro/ramdisk/fstab.streakpro
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_FSTAB_VERSION := 2

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_UNCOMPRESSED_KERNEL := false
TARGET_USES_LAUNCHER_V1 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 402653184
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073725440
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_CACHEIMAGE_PARTITION_SIZE := 4096000
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
