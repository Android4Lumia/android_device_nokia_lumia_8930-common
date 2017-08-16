#
# Copyright (C) 2017 The LineageOS Project
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

# Platform
TARGET_BOARD_PLATFORM := msm8960

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Product info
BOARD_VENDOR := nokia
PRODUCT_BRAND := Nokia
PRODUCT_MANUFACTURER := Nokia

# Unified device
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_dpp

# Storage information
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

# CM Hardware
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/cmhw

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Kernel informations
# NOTE: Only merge this if you have the initlogo hacks by r3pwn in the Lumia 720 tree!
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/boot/mkbootimg.mk
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := \
    panic=3 \
    console=ttyHSL0,115200,n8 \
    androidboot.hardware=qcom \
    user_debug=23 \
    msm_rtb.filter=0x3F \
    ehci-hcd.park=3 \
    androidboot.bootdevice=msm_sdcc.1

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/nokia/msm8x27

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := qcom

# Images
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Power HAL
CM_POWERHAL_EXTENSION := qcom
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm sepolicies
include device/qcom/sepolicy/sepolicy.mk

# WiFi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# Device sepolicies
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# TWRP (optional)
ifeq ($(RECOVERY_VARIANT),twrp)
TW_THEME := portrait_mdpi
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
endif
