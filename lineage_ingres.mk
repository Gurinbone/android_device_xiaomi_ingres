#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from ingres device
$(call inherit-product, device/xiaomi/ingres/device.mk)

# Inherit from common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_ingres
PRODUCT_DEVICE := ingres
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 21121210G

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="ingres-user 14 UKQ1.240624.001 OS2.0.5.0.ULJCNXM release-keys" \
    BuildFingerprint=Redmi/ingres/ingres:14/UKQ1.240624.001/OS2.0.5.0.ULJCNXM:user/release-keys \
    DeviceProduct=ingres \
    SystemName=ingres

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
PRODUCT_PROPERTY_OVERRIDES += ro.usb.uvc.enabled=true

TARGET_ENABLE_BLUR := true
# Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 64,8,2
AXION_CAMERA_FRONT_INFO := 20

# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := Anuan

# Processor name (underscores become spaces)
AXION_PROCESSOR := Snapdragon_8_Gen_1

PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.perf.scroll_opt=true \
    persist.sys.perf.scroll_opt.heavy_app=2

TARGET_SUPPORTED_REFRESH_RATES := 60,120
TARGET_IS_LOW_RAM := false

BYPASS_CHARGE_SUPPORTED = true
BYPASS_CHARGE_TOGGLE_PATH = /sys/class/qcom-battery/night_charging

# Axion Kernel Manager
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/kernel/ax_kernel_manager_taro.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/ax_kernel_manager.xml \
    $(LOCAL_PATH)/rootdir/etc/ax_init_taro.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/ax_init_taro.rc

TARGET_NEEDS_VULKAN_MEDIA_FIX := true
