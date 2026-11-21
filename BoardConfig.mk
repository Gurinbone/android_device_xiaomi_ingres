#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Security patch level
VENDOR_SECURITY_PATCH := 2025-04-01

DEVICE_PATH := device/xiaomi/ingres
KERNEL_PREBUILT_DIR := $(DEVICE_PATH)-kernel

# SELinux (declare Android 17 QCOM types before sm8450-common sepolicy)
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Inherit from xiaomi sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Prebuilt Kernel (Neoteric uses Lineage-style kernel.mk instead of AOSPA KERNEL_PREBUILT_DIR)
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8450
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/waipio_GKI.config \
    vendor/xiaomi_GKI.config \
    vendor/ingres_GKI.config \
    vendor/debugfs.config
TARGET_PREBUILT_KERNEL := $(KERNEL_PREBUILT_DIR)/Image
TARGET_BOARD_KERNEL_HEADERS := $(KERNEL_PREBUILT_DIR)/kernel-headers
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PREBUILT_DIR)/dtbs/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PREBUILT_DIR)/dtbs
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PREBUILT_DIR)/vendor_dlkm/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/vendor_dlkm/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_PREBUILT_DIR)/vendor_dlkm/modules.blocklist
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/modules.blocklist

# Inherit from the proprietary version
include vendor/xiaomi/ingres/BoardConfigVendor.mk

# Audio
AUDIO_FEATURE_ENABLED_CIRRUS_CALIBRATION_RESISTANCE := true
AUDIO_FEATURE_ENABLED_ULTRASOUND_PROXIMITY := true

$(call soong_config_set,qtiaudio,cirrus_calibration_resistance,true)
$(call soong_config_set,qtiaudio,ultrasound_proximity,true)

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Screen density
TARGET_SCREEN_DENSITY := 395
