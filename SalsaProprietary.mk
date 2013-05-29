# Copyright (C) 2010 The Android Open Source Project
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

# Prebuilt libraries that are needed to build open-source libraries

## (1) Copy Configuration files
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/vold.fstab:system/etc/vold.fstab \
    device/acer/salsa/proprietary/media_profiles.xml:system/etc/media_profiles.xml \
    device/acer/salsa/proprietary/sysctl.conf:system/etc/sysctl.conf \
    device/acer/salsa/proprietary/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/acer/salsa/proprietary/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 
#    device/acer/salsa/proprietary/GooManager.apk:system/app/GooManager.apk

## (2) Keypad and Touchscreen
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/a1-keypad.kcm:system/usr/keychars/a1-keypad.kcm \
    device/acer/salsa/proprietary/a1-keypad.kl:system/usr/keylayout/a1-keypad.kl \
    device/acer/salsa/proprietary/avr.kl:system/usr/keylayout/avr.kl \
    device/acer/salsa/proprietary/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/acer/salsa/proprietary/auo-touch.idc:system/usr/idc/auo-touch.idc

## (3) Ramdisk
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/init.salsa.rc:root/init.salsa.rc \
    device/acer/salsa/proprietary/init.salsa.usb.rc:root/init.salsa.usb.rc \
    device/acer/salsa/proprietary/ueventd.salsa.rc:root/ueventd.salsa.rc \
    device/acer/salsa/proprietary/initlogo.rle:root/initlogo.rle

## (4) Init scripts
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/01sysctl:system/etc/init.d/01sysctl \
    device/acer/salsa/proprietary/03swaps:system/etc/init.d/03swaps \
    device/acer/salsa/proprietary/05mountext:system/etc/init.d/05mountext \
    device/acer/salsa/proprietary/10apps2sd-redux:system/etc/init.d/10apps2sd

## (5) App2sd
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/profile:system/etc/profile \
    device/acer/salsa/proprietary/a2sd:system/bin/a2sd \
    device/acer/salsa/proprietary/fix_permissions:system/bin/fix_permissions \
    device/acer/salsa/proprietary/zipalign:system/xbin/zipalign

## (6) Compcache
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/rzscontrol:/system/xbin/rzscontrol 

## (7) FILES from vendor folder, I think(ROMZESROVER) we can do it W/O using vendor folder I do it to get compileable cm10.1 and bootable (ye, ye) device salsa 
PRODUCT_COPY_FILES += \
    device/acer/salsa/proprietary/BCM4325.hcd:system/etc/firmware/BCM4325.hcd \
    device/acer/salsa/proprietary/BCM4325.bin:system/etc/wifi/BCM4325.bin \
    device/acer/salsa/proprietary/BCM4325_apsta.bin:system/etc/wifi/BCM4325_apsta.bin \
    device/acer/salsa/proprietary/BCM4325Fac.bin:system/etc/wifi/BCM4325Fac.bin \
    device/acer/salsa/proprietary/nvram.txt:system/etc/wifi/nvram.txt \
    device/acer/salsa/proprietary/qmuxd:system/bin/qmuxd \
    device/acer/salsa/proprietary/brcm_patchram_plus:system/bin/brcm_patchram_plus \
    device/acer/salsa/proprietary/libril-acer-1.so:system/lib/libril-acer-1.so \
    device/acer/salsa/proprietary/libril-acerril-hook-oem.so:system/lib/libril-acerril-hook-oem.so \
    device/acer/salsa/proprietary/libdiag.so:system/lib/libdiag.so \
    device/acer/salsa/proprietary/liboncrpc.so:system/lib/liboncrpc.so \
    device/acer/salsa/proprietary/libqmi.so:system/lib/libqmi.so \
    device/acer/salsa/proprietary/libdsm.so:system/lib/libdsm.so \
    device/acer/salsa/proprietary/libqueue.so:system/lib/libqueue.so \
    device/acer/salsa/proprietary/libdll.so:system/lib/libdll.so \
    device/acer/salsa/proprietary/libcm.so:system/lib/libcm.so \
    device/acer/salsa/proprietary/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/acer/salsa/proprietary/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    device/acer/salsa/proprietary/libgstk_exp.so:system/lib/libgstk_exp.so \
    device/acer/salsa/proprietary/libwms.so:system/lib/libwms.so \
    device/acer/salsa/proprietary/libnv.so:system/lib/libnv.so \
    device/acer/salsa/proprietary/libwmsts.so:system/lib/libwmsts.so \
    device/acer/salsa/proprietary/libpbmlib.so:system/lib/libpbmlib.so \
    device/acer/salsa/proprietary/libdss.so:system/lib/libdss.so \
    device/acer/salsa/proprietary/libauth.so:system/lib/libauth.so \
    device/acer/salsa/proprietary/liboemcamera.so:system/lib/liboemcamera.so \
    device/acer/salsa/proprietary/liboemcamera.so:obj/lib/liboemcamera.so \
    device/acer/salsa/proprietary/libcamera.so:system/lib/libcamera.so \
    device/acer/salsa/proprietary/libcamera.so:obj/lib/libcamera.so \
    device/acer/salsa/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/acer/salsa/proprietary/libmmipl.so:system/lib/libmmipl.so \
    device/acer/salsa/proprietary/libmmparser_divxdrmlib.so:system/lib/libmmparser_divxdrmlib.so \
    device/acer/salsa/proprietary/libmmosal.so:system/lib/libmmosal.so \
    device/acer/salsa/proprietary/libmmparser.so:system/lib/libmmparser.so \
    device/acer/salsa/proprietary/libloc.so:system/lib/libloc.so \
    device/acer/salsa/proprietary/libloc.so:obj/lib/libloc.so \
    device/acer/salsa/proprietary/libloc-rpc.so:system/lib/libloc-rpc.so \
    device/acer/salsa/proprietary/libcommondefs.so:system/lib/libcommondefs.so \
    device/acer/salsa/proprietary/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \
    device/acer/salsa/proprietary/sensorserver_yamaha:system/bin/sensorserver_yamaha \
    device/acer/salsa/proprietary/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha \
    device/acer/salsa/proprietary/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
    device/acer/salsa/proprietary/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
    device/acer/salsa/proprietary/sensors.salsa.so:system/lib/hw/sensors.salsa.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/libgsl.so:system/lib/libgsl.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/libC2D2.so:system/lib/libC2D2.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/libc2d2_z180.so:system/lib/libc2d2_z180.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/libGLESv2S3D_adreno200.so:system/lib/egl/libGLESv2S3D_adreno200.so \
    device/acer/salsa/proprietary/adreno_jb/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/acer/salsa/proprietary/adreno_jb/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/acer/salsa/proprietary/adreno_jb/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw   
