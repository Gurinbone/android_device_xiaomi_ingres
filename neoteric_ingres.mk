#
# Copyright (C) 2025 The LineageOS Project
# Copyright (C) 2026 Neoteric OS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from ingres device
$(call inherit-product, device/xiaomi/ingres/device.mk)

# Inherit from the Neoteric configuration
$(call inherit-product, vendor/neoteric/target/product/neoteric-target.mk)

# Exclude AOSPA prebuilt kernel_headers, unused CLO NXP snxxx HAL
# (ingres uses hardware/nxp/nfc), and duplicate qcril-database host tool
# (provided by device/xiaomi/sm8450-common) from Soong scan
PRODUCT_SOURCE_ROOT_DIRS += \
    -device/xiaomi/ingres-kernel \
    -vendor/nxp/opensource/halimpl \
    -vendor/nxp/opensource/libnfc_halimpl_extn \
    -device/qcom/common/qcril-database

PRODUCT_NAME := neoteric_ingres
PRODUCT_DEVICE := ingres
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 21121210G

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="ingres-user 14 UKQ1.240624.001 OS2.0.5.0.ULJCNXM release-keys" \
    BuildFingerprint=Redmi/ingres/ingres:14/UKQ1.240624.001/OS2.0.5.0.ULJCNXM:user/release-keys \
    DeviceName=ingres \
    DeviceProduct=ingres \
    SystemDevice=ingres \
    SystemName=ingres

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Boot animation resolution
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_USES_BLUR := true
