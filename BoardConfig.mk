#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Security patch level
VENDOR_SECURITY_PATCH := 2025-04-01

DEVICE_PATH := device/xiaomi/ingres
KERNEL_PREBUILT_DIR := $(DEVICE_PATH)-kernel

# Inherit from xiaomi sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

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
