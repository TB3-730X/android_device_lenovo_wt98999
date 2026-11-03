# Copyright (C) 2016 The CyanogenMod Project
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

$(call inherit-product, device/lenovo/wt98999/full_wt98999.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)


PRODUCT_NAME := lineage_wt98999
BOARD_VENDOR := lenovo
PRODUCT_DEVICE := wt98999

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

PRODUCT_MANUFACTURER := lenovo
PRODUCT_MODEL := wt98999

PRODUCT_BRAND := Lenovo
TARGET_VENDOR := lenovo
TARGET_VENDOR_PRODUCT_NAME := wt98999
TARGET_VENDOR_DEVICE_NAME := wt98999