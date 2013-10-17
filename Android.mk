LOCAL_PATH := $(my-dir)
subdir_makefiles := \
	$(LOCAL_PATH)/liblights/Android.mk\
        $(LOCAL_PATH)/libaudio/Android.mk\
	$(LOCAL_PATH)/libcamera-qsd8k/Android.mk\
	$(LOCAL_PATH)/LiquidPartsChecker/Android.mk 
include $(subdir_makefiles)
