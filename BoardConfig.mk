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

BOARD_USES_GENERIC_AUDIO := false
 
# Neon stuff
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A_BUG := true
ARCH_ARM_HAVE_NEON := true
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

# Legacy
TARGET_USES_MDP3 := true
TARGET_USES_PMEM := true
TARGET_QCOM_AUDIO_VARIANT := legacy
TARGET_QCOM_GPS_VARIANT := legacy

#WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/BCM4325.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/BCM4325_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/etc/wifi/BCM4325.bin nvram_path=/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"
 
#BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#Fm radio
BOARD_HAVE_FM_RADIO := false

#GPS
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
#BOARD_USES_QCOM_HARDWARE := true
# to enable the GPS HAL
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := salsa
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
TARGET_PROVIDES_LIBAUDIO := true

#Qcom
TARGET_HAVE_BYPASS      := false
#TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_GENLOCK := true
TARGET_GRALLOC_USES_ASHMEM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX -DBINDER_COMPAT -DANCIENT_GL
#COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_NEEDS_MEMORYHEAPPMEM := true

#GPU (Graphics)
BOARD_EGL_CFG := device/acer/salsa/proprietary/system/lib/egl/egl.cfg
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_ADRENO_AVOID_EXTERNAL_TEXTURE := true
BOARD_USES_LEGACY_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_NO_HW_VSYNC := true
TARGET_NO_HW_OVERLAY := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_USES_ION := false
BOARD_HAVE_HDMI_SUPPORT := false
COMMON_GLOBAL_CFLAGS += -DTARGET_8x50
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK -DUSES_LEGACY_EGL

#WEBkit
TARGET_FORCE_CPU_UPLOAD := true
ENABLE_WEBGL := true

# Try to get radio working (Legacy ril) RomzesRover
# Enable gsm and network search
COMMON_GLOBAL_CFLAGS += -DFORCE_RILD_AS_ROOT # Not sure if this is needed
BOARD_FORCE_RILD_AS_ROOT := true
BOARD_USES_LEGACY_RIL := true
 
#sensors
TARGET_USES_OLD_LIBSENSORS_HAL := true

#kernel
TARGET_KERNEL_SOURCE := device/acer/salsa/kernel
TARGET_KERNEL_CONFIG := cyanogenmod_salsa_defconfig
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_PAGESIZE := 4096
KERNEL_TOOLCHAIN_PREFIX:=/home/romzesrover/sources/arm-2009q3/bin/arm-none-linux-gnueabi-

#recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/acer/salsa/recoverySpecialKernel
BOARD_SDCARD_INTERNAL_DEVICE := /dev/block/mmcblk0p1
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
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

#fs
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
#System setup to 250mb
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0xFA00000
#UserData setup to 150Mb
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x9600000 
BOARD_FLASH_BLOCK_SIZE := 4096

