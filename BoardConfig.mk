#
# Copyright (C) 2017 The LineageOS Project
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

DEVICE_PATH := device/lenovo/wt98999

TARGET_BOARD_PLATFORM := mt6735	
#TARGET_BOOTLOADER_BOARD_NAME := XT1706_S135_161 #TBD

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# Common properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# FSTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6735

# Assert
TARGET_OTA_ASSERT_DEVICE := wt98999,wt98999_row

# Audio
# USE_CUSTOM_AUDIO_POLICY := 1
BOARD_USES_MTK_AUDIO := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/lenovo/mt6735
TARGET_KERNEL_CONFIG := lineageos_wt98999_defconfig
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
#BOARD_KERNEL_CMDLINE += bootopt=64S3,32N2,32N2 #TBD
ifeq ($(WITH_PERMISSIVE), true)
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
endif
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Partition info
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # (16384 * 1024 | mmcblk0p7)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # (16384 * 1024 | mmcblk0p8)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # (1572864 * 1024 | mmcblk0p23)
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400 # (409600 * 1024 | mmcblk0p24)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13304856576 # (12993024 * 1024 | mmcblk0p25)
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_CONNECTIVITY_MODULE := conn_soc

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
		WITH_DEXPREOPT ?= true
  endif
endif

# Display
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# libc with GCC
TARGET_NEEDS_GCC_LIBC := true

# Mediatek support
BOARD_USES_MTK_HARDWARE := true

# GPS
ifeq ($(MTK_GPS_SUPPORT), yes)
    BOARD_GPS_LIBRARIES := true
else
    BOARD_GPS_LIBRARIES := false
endif

# RIL
BOARD_RIL_CLASS := ../../../device/lenovo/wt98999/ril

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Symbols for Mediatek
LINKER_FORCED_SHIM_LIBS := /system/lib/libmedia.so|libshims_audio.so:/system/lib/libc.so|libshims_bionic.so:/system/lib/libgui.so|libshims_gui.so:/system/lib/libui.so|libshims_ui.so:/system/lib/liblog.so|libshims_xlog.so

# TWRP
ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp
TW_THEME := portrait_hdpi
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
endif

# Wireless
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt6735
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt6735
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Misc
EXTENDED_FONT_FOOTPRINT := true

