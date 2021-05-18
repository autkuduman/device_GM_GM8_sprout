#
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, build/target/product/embedded.mk)

ALLOW_MISSING_DEPENDENCIES=true

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.msm8937

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8937 \
    libgptutils \
    libz

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8937
	

# Charger	
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := GM8_sprout
PRODUCT_NAME := omni_GM8_sprout
PRODUCT_BRAND := General Mobile
PRODUCT_MODEL := GM 8
PRODUCT_MANUFACTURER := General Mobile
