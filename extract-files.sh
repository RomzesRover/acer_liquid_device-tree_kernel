#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=salsa
MANUFACTURER=acer

mkdir -p ../../../device/$MANUFACTURER/$DEVICE/proprietary

adb pull /system/usr/keychars/avr.kcm.bin ../../../device/$MANUFACTURER/$DEVICE/proprietary/avr.kcm.bin
adb pull /system/usr/keychars/acer-hs-butt.kcm.bin ../../../device/$MANUFACTURER/$DEVICE/proprietary/acer-hs-butt.kcm.bin
adb pull /system/usr/keychars/a1-keypad.kcm.bin ../../../device/$MANUFACTURER/$DEVICE/proprietary/a1-keypad.kcm.bin
adb pull /system/usr/keylayout/AVRCP.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/AVRCP.kl
adb pull /system/usr/keylayout/8k_handset.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/8k_handset.kl
adb pull /system/usr/keylayout/8k_ffa_keypad.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/8k_ffa_keypad.kl
adb pull /system/usr/keylayout/acer-hs-butt.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/acer-hs-butt.kl
adb pull /system/usr/keylayout/a1-keypad.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/a1-keypad.kl
adb pull /system/usr/keylayout/h2w_headset.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/h2w_headset.kl
adb pull /system/usr/keylayout/qwerty.kl ../../../device/$MANUFACTURER/$DEVICE/proprietary/qwerty.kl
#adb pull /system/etc/dhcpcd/dhcpcd.conf ../../../device/$MANUFACTURER/$DEVICE/proprietary/
#adb pull /system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf ../../../device/$MANUFACTURER/$DEVICE/proprietary/20-dns.conf
#adb pull /system/etc/dhcpcd/dhcpcd-hooks/01-test ../../../device/$MANUFACTURER/$DEVICE/proprietary/01-test
#adb pull /system/etc/dhcpcd/dhcpcd-hooks/95-configured ../../../device/$MANUFACTURER/$DEVICE/proprietary/95-configured
#adb pull /system/etc/dhcpcd/dhcpcd-run-hooks ../../../device/$MANUFACTURER/$DEVICE/proprietary/dhcpcd-run-hooks
adb pull /system/etc/firmware/BCM4325.hcd ../../../device/$MANUFACTURER/$DEVICE/proprietary/BCM4325.hcd
adb pull /system/etc/firmware/yamato_pm4.fw ../../../device/$MANUFACTURER/$DEVICE/proprietary/yamato_pm4.fw
adb pull /system/etc/firmware/BCM4325.bin ../../../device/$MANUFACTURER/$DEVICE/proprietary/
adb pull /system/etc/firmware/BCM4325_apsta.bin ../../../device/$MANUFACTURER/$DEVICE/proprietary/BCM4325_apsta.bin
adb pull /system/etc/firmware/yamato_pfp.fw ../../../device/$MANUFACTURER/$DEVICE/proprietary/yamato_pfp.fw
adb pull /system/etc/wifi/nvram.txt ../../../device/$MANUFACTURER/$DEVICE/proprietary/nvram.txt
#adb pull /system/lib/libOmxAacDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAacDec.so
#adb pull /system/lib/libomx_amrenc_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_amrenc_sharedlibrary.so
adb pull /system/lib/libcm.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libcm.so
#adb pull /system/lib/libOmxMp3Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxMp3Dec.so
adb pull /system/lib/libsensor_yamaha.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libsensor_yamaha.so
adb pull /system/lib/libwms.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libwms.so
adb pull /system/lib/libpbmlib.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libpbmlib.so
adb pull /system/lib/libril-acerril-hook-oem.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libril-acerril-hook-oem.so
#adb pull /system/lib/libOmxQcelp13Enc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelp13Enc.so
#adb pull /system/lib/libbluedroid.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libbluedroid.so
#adb pull /system/lib/libOmxAmrRtpDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAmrRtpDec.so
adb pull /system/lib/libril.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libril.so
adb pull /system/lib/libcommondefs.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libcommondefs.so
adb pull /system/lib/libncurses.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libncurses.so
#adb pull /system/lib/libOmxEvrcEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxEvrcEnc.so
adb pull /system/lib/libqueue.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libqueue.so
adb pull /system/lib/libwmsts.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libwmsts.so
#adb pull /system/lib/libOmxAmrEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAmrEnc.so
#adb pull /system/lib/libOmxQcelpDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelpDec.so
#adb pull /system/lib/libomx_m4vdec_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_m4vdec_sharedlibrary.so
adb pull /system/lib/libmmgsdilib.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libmmgsdilib.so
adb pull /system/lib/libmmipl.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libmmipl.so
#adb pull /system/lib/libOmxWmvDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxWmvDec.so
#adb pull /system/lib/libOmxVdec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxVdec.so
#adb pull /system/lib/libomx_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_sharedlibrary.so
#adb pull /system/lib/libomx_aacdec_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_aacdec_sharedlibrary.so
#adb pull /system/lib/libOmxAmrDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAmrDec.so
#adb pull /system/lib/libOmxVenc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxVenc.so
adb pull /system/lib/liboncrpc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/liboncrpc.so
adb pull /system/lib/libdll.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libdll.so
adb pull /system/lib/libdsm.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libdsm.so
#adb pull /system/lib/libomx_avcdec_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_avcdec_sharedlibrary.so
adb pull /system/lib/libms3c_yamaha.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libms3c_yamaha.so
adb pull /system/lib/libnv.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libnv.so
#adb pull /system/lib/libOmxAmrwbDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAmrwbDec.so
adb pull /system/lib/liboemcamera.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/liboemcamera.so
#adb pull /system/lib/libOmxQcelp13Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelp13Dec.so
#adb pull /system/lib/libOmxWmaDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxWmaDec.so
adb pull /system/lib/libmmjpeg.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libmmjpeg.so
adb pull /system/lib/libgsl.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libgsl.so
adb pull /system/lib/libril-acer-1.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libril-acer-1.so
adb pull /system/lib/libreference-ril.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libreference-ril.so
#adb pull /system/lib/libOmxAdpcmDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAdpcmDec.so
adb pull /system/lib/libgsdi_exp.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libgsdi_exp.so
adb pull /system/lib/libauth.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libauth.so
#adb pull /system/lib/libOmxAacEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAacEnc.so
adb pull /system/lib/libloc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libloc.so
adb pull /system/lib/libdiag.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libdiag.so
adb pull /system/lib/egl/libEGL_adreno200.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libEGL_adreno200.so
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libGLESv2_adreno200.so
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libGLESv1_CM_adreno200.so
adb pull /system/lib/egl/egl.cfg ../../../device/$MANUFACTURER/$DEVICE/proprietary/egl.cfg
adb pull /system/lib/egl/libGLES_android.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libGLES_android.so
adb pull /system/lib/egl/libq3dtools_adreno200.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libq3dtools_adreno200.so
adb pull /system/lib/libdss.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libdss.so
#adb pull /system/lib/libomx_amrdec_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_amrdec_sharedlibrary.so
adb pull /system/lib/hw/sensors.salsa.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/sensors.salsa.so
adb pull /system/lib/libaudiopolicy.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libaudiopolicy.so
#adb pull /system/lib/libOmxEvrcDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxEvrcDec.so
#adb pull /system/lib/libOmxH264Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxH264Dec.so
#adb pull /system/lib/libomx_mp3dec_sharedlibrary.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libomx_mp3dec_sharedlibrary.so
#adb pull /system/lib/libOmxVidEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxVidEnc.so
#adb pull /system/lib/libOmxCore.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxCore.so
#adb pull /system/lib/libOmxMpeg4Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxMpeg4Dec.so
adb pull /system/lib/libqmi.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libqmi.so
adb pull /system/lib/libaudioflinger.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libaudioflinger.so
adb pull /system/lib/libaudio.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libaudio.so
#adb pull /system/lib/libcamera.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libcamera.so
adb pull /system/lib/libgstk_exp.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libgstk_exp.so
adb pull /system/lib/libloc-rpc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libloc-rpc.so
adb pull /system/lib/libsurfaceflinger.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libsurfaceflinger.so
adb pull /system/bin/qmuxd ../../../device/$MANUFACTURER/$DEVICE/proprietary/qmuxd
adb pull /system/bin/brcm_patchram_plus ../../../device/$MANUFACTURER/$DEVICE/proprietary/brcm_patchram_plus
adb pull /system/bin/sensorcalibutil_yamaha ../../../device/$MANUFACTURER/$DEVICE/proprietary/sensorcalibutil_yamaha
adb pull /system/bin/sensorserver_yamaha ../../../device/$MANUFACTURER/$DEVICE/proprietary/sensorserver_yamaha
adb pull /system/bin/sensorstatutil_yamaha ../../../device/$MANUFACTURER/$DEVICE/proprietary/sensorstatutil_yamaha
adb pull /system/lib/libOmxAacDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAacDec.so
adb pull /system/lib/libOmxAacEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAacEnc.so
adb pull /system/lib/libOmxAmrEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxAmrEnc.so
adb pull /system/lib/libOmxCore.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxCore.so
adb pull /system/lib/libOmxEvrcDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxEvrcDec.so
adb pull /system/lib/libOmxEvrcEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxEvrcEnc.so
adb pull /system/lib/libOmxH264Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxH264Dec.so
adb pull /system/lib/libOmxMp3Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxMp3Dec.so
adb pull /system/lib/libOmxMpeg4Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxMpeg4Dec.so
adb pull /system/lib/libOmxQcelp13Dec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelp13Dec.so
adb pull /system/lib/libOmxQcelp13Enc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelp13Enc.so
adb pull /system/lib/libOmxQcelpDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxQcelpDec.so
adb pull /system/lib/libOmxVdec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxVdec.so
adb pull /system/lib/libOmxVidEnc.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxVidEnc.so
adb pull /system/lib/libOmxWmaDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxWmaDec.so
adb pull /system/lib/libOmxWmvDec.so ../../../device/$MANUFACTURER/$DEVICE/proprietary/libOmxWmvDec.so



(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../device/acer/$DEVICE/$DEVICE-vendor-blobs.mk
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

# This file is generated by ../../../device/liquid/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/liboemcamera.so:obj/lib/liboemcamera.so

# Copy RIL libraries
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/libril-acer-1.so:system/lib/libril-acer-1.so \\
vendor/acer/__DEVICE__/proprietary/libril-acerril-hook-oem.so:system/lib/libril-acerril-hook-oem.so \\
vendor/acer/__DEVICE__/proprietary/libril.so:obj/lib/libril.so \\
vendor/acer/__DEVICE__/proprietary/libril.so:system/lib/libril.so \\
vendor/acer/__DEVICE__/proprietary/libreference-ril.so:system/lib/libreference-ril.so \\
vendor/acer/__DEVICE__/proprietary/libauth.so:system/lib/libauth.so \\
vendor/acer/__DEVICE__/proprietary/libcm.so:system/lib/libcm.so \\
vendor/acer/__DEVICE__/proprietary/libcommondefs.so:system/lib/libcommondefs.so \\
vendor/acer/__DEVICE__/proprietary/libdiag.so:system/lib/libdiag.so \\
vendor/acer/__DEVICE__/proprietary/libdll.so:system/lib/libdll.so \\
vendor/acer/__DEVICE__/proprietary/libdsm.so:system/lib/libdsm.so \\
vendor/acer/__DEVICE__/proprietary/libdss.so:system/lib/libdss.so \\
vendor/acer/__DEVICE__/proprietary/libgsdi_exp.so:system/lib/libgsdi_exp.so \\
vendor/acer/__DEVICE__/proprietary/libgstk_exp.so:system/lib/libgstk_exp.so \\
vendor/acer/__DEVICE__/proprietary/libloc-rpc.so:system/lib/libloc-rpc.so \\
vendor/acer/__DEVICE__/proprietary/libloc.so:system/lib/libloc.so \\
vendor/acer/__DEVICE__/proprietary/libmmgsdilib.so:system/lib/libmmgsdilib.so \\
vendor/acer/__DEVICE__/proprietary/libnv.so:system/lib/libnv.so \\
vendor/acer/__DEVICE__/proprietary/liboncrpc.so:system/lib/liboncrpc.so \\
vendor/acer/__DEVICE__/proprietary/libpbmlib.so:system/lib/libpbmlib.so \\
vendor/acer/__DEVICE__/proprietary/libqmi.so:system/lib/libqmi.so \\
vendor/acer/__DEVICE__/proprietary/libqueue.so:system/lib/libqueue.so \\
vendor/acer/__DEVICE__/proprietary/libwms.so:system/lib/libwms.so \\
vendor/acer/__DEVICE__/proprietary/libwmsts.so:system/lib/libwmsts.so \\
vendor/acer/__DEVICE__/proprietary/libncurses.so:system/lib/libncurses.so \\
vendor/acer/__DEVICE__/proprietary/qmuxd:system/bin/qmuxd

# Copy EGL libraries
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
vendor/acer/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
vendor/acer/__DEVICE__/proprietary/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
vendor/acer/__DEVICE__/proprietary/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \\
vendor/acer/__DEVICE__/proprietary/libgsl.so:system/lib/libgsl.so

#Copy camera libraries
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/liboemcamera.so:system/lib/liboemcamera.so \\
vendor/acer/__DEVICE__/proprietary/libmmipl.so:system/lib/libmmipl.so \\
vendor/acer/__DEVICE__/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so
#vendor/acer/__DEVICE__/proprietary/libcamera.so:system/lib/libcamera.so \

# Copy CodeAurora's prebuilt QSD8K libaudio
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/libaudio.so:system/lib/libaudio.so \\
vendor/acer/__DEVICE__/proprietary/libaudio.so:obj/lib/libaudio.so \\
vendor/acer/__DEVICE__/proprietary/libaudiopolicy.so:system/lib/libaudiopolicy.so \\
vendor/acer/__DEVICE__/proprietary/libaudiopolicy.so:obj/lib/libaudiopolicy.so \\
#vendor/acer/__DEVICE__/proprietary/libaudioflinger.so:system/lib/libaudioflinger.so

# Copy Bluetooth stuff
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/brcm_patchram_plus:system/bin/brcm_patchram_plus

# Copy WiFi firmware and config
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/BCM4325.hcd:system/etc/firmware/BCM4325.hcd \
vendor/acer/__DEVICE__/proprietary/BCM4325.bin:system/etc/wifi/BCM4325.bin \
vendor/acer/__DEVICE__/proprietary/BCM4325_apsta.bin:system/etc/wifi/BCM4325_apsta.bin \
vendor/acer/__DEVICE__/proprietary/nvram.txt:system/etc/wifi/nvram.txt

# Copy sensor library, binary and configuration (need to chmod ms3c_yamaha.cfg upon flashing for yamaha sensor to function properly)
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
vendor/acer/__DEVICE__/proprietary/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \\
vendor/acer/__DEVICE__/proprietary/sensors.salsa.so:system/lib/hw/sensors.salsa.so \\
vendor/acer/__DEVICE__/proprietary/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \\
vendor/acer/__DEVICE__/proprietary/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \\
vendor/acer/__DEVICE__/proprietary/sensorserver_yamaha:system/bin/sensorserver_yamaha \\
vendor/acer/__DEVICE__/proprietary/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha \\
vendor/acer/__DEVICE__/proprietary/libms3c_yamaha.so:system/lib/libms3c_yamaha.so

# Copy Acer keylayout and headset driver & firmware
PRODUCT_COPY_FILES += \
vendor/acer/__DEVICE__/proprietary/8k_handset.kl:system/usr/keylayout/8k_handset.kl \\
vendor/acer/__DEVICE__/proprietary/8k_ffa_keypad.kl:system/usr/keylayout/8k_ffa_keypad.kl \\
vendor/acer/__DEVICE__/proprietary/a1-keypad.kl:system/usr/keylayout/a1-keypad.kl \\
vendor/acer/__DEVICE__/proprietary/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \\
vendor/acer/__DEVICE__/proprietary/acer-hs-butt.kl:system/usr/keylayout/acer-hs-butt.kl \\
vendor/acer/__DEVICE__/proprietary/AVRCP.kl:system/usr/keylayout/AVRCP.kl \\
vendor/acer/__DEVICE__/proprietary/qwerty.kl:system/usr/keylayout/qwerty.kl \\
vendor/acer/__DEVICE__/proprietary/a1-keypad.kcm.bin:system/usr/keychars/a1-keypad.kcm.bin \\
vendor/acer/__DEVICE__/proprietary/acer-hs-butt.kcm.bin:system/usr/keychars/acer-hs-butt.kcm.bin \\
vendor/acer/__DEVICE__/proprietary/avr.kcm.bin:system/usr/keychars/avr.kcm.bin

# Copy proprietary Omx* V/A Liquid encoders and decoders
#PRODUCT_COPY_FILES += \
#vendor/acer/__DEVICE__/proprietary/libOmxVdec.so:system/lib/libOmxVdec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAacDec.so:system/lib/libOmxAacDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxCore.so:system/lib/libOmxCore.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVdec.so:system/lib/libOmxVdec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# Copy proprietary Omx* V/A METAL encoders and decoders
#PRODUCT_COPY_FILES += \
#vendor/acer/__DEVICE__/proprietary/libOmxAacDec.so:system/lib/libOmxAacDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxCore.so:system/lib/libOmxCore.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVdec.so:system/lib/libOmxVdec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVenc.so:system/lib/libOmxVenc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \\
#vendor/acer/__DEVICE__/proprietary/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \\
#vendor/acer/__DEVICE__/proprietary/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so 
EOF

