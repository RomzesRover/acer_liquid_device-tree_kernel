# Copyright (c) 2009, Code Aurora Forum.
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
# config.mk
#
# Product-specific compile-time definitions.
#
#######   for use when building CyanogenMod
USE_CAMERA_STUB := false
#######
 
# Call headers from msm-3.0: needed to build libs in hardware/qcom/display
TARGET_SPECIFIC_HEADER_PATH := device/acer/salsa/include
 
TARGET_BOOTLOADER_BOARD_NAME := salsa
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
 
# QSD8250
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
 
# Neon stuff
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A_BUG := true
ARCH_ARM_HAVE_NEON := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/etc/firmware/BCM4325.bin"
WIFI_DRIVER_FW_PATH_AP      := "/etc/firmware/BCM4325_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/etc/wifi/BCM4325.bin nvram_path=/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

BOARD_USES_GENERIC_AUDIO := false
 
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_FM_RADIO := false
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_HARDWARE := true

# We only have 2 buffers (Added by RomzesRover to fix jumping screen #---# not help)
#TARGET_DISABLE_TRIPLE_BUFFERING := true
#BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

#Qcom added by RomzesRover
#TARGET_QCOM_DISPLAY_VARIANT := legacy
#TARGET_QCOM_AUDIO_VARIANT := legacy
#TARGET_QCOM_GPS_VARIANT := legacy
 
USE_OPENGL_RENDERER := true
#TARGET_USE_OVERLAY      := false
TARGET_HAVE_BYPASS      := false
#TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_GENLOCK := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_FORCE_CPU_UPLOAD := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DBINDER_COMPAT -DANCIENT_GL
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
#TARGET_NO_BYPASS_CROPPING := true

BOARD_EGL_CFG := device/acer/salsa/proprietary/adreno_jb/system/lib/egl/egl.cfg
# Added by RomzesRover to get bootable cm10_1 (GPU)
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_NO_HW_VSYNC := true
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK -DUSES_LEGACY_EGL
# Added by RomzesRover to get bootable cm10_1 (webkit)
ENABLE_WEBGL := true
 
# to enable the GPS HAL
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := salsa
 
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
TARGET_PROVIDES_LIBAUDIO := true
 
#sensors
TARGET_USES_OLD_LIBSENSORS_HAL := true

#kernel
TARGET_KERNEL_CONFIG := cyanogenmod_salsa_defconfig
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_PAGESIZE := 4096

#mmc
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p1
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

#recovery
#BOARD_HAS_NO_MISC_PARTITION := true
#BOARD_USES_RECOVERY_CHARGEMODE := false
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/acer/salsa/recovery/recovery_keys.c
#TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
#TARGET_RECOVERY_INITRC := device/acer/salsa/recovery.rc
#TARGET_PREBUILT_RECOVERY_KERNEL := device/acer/salsa/recovery_kernel
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun"

#twrp recovery
TARGET_RECOVERY_INITRC := device/acer/salsa/recovery.rc
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
DEVICE_RESOLUTION := 480x800
TW_FLASH_FROM_STORAGE := true

#Added by RomzesRover to get compileable cm10-1 (4.2.2)
#TARGET_ARCH := arm   ARCH DO NEED FOT CM10 (4.1.2)
TARGET_KERNEL_SOURCE := device/acer/salsa/kernel
#Added by RomzesRover to get compileable cm10 & flashable device salsa & also edited kernel recovery and kernel for cm by [ray
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
#System setup to 260mb
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x10400000
#UserData setup to 140Mb
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x08C00000 
BOARD_FLASH_BLOCK_SIZE := 4096

