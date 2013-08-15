LOCAL_PATH := $(my-dir)
subdir_makefiles := \
	$(LOCAL_PATH)/liblights/Android.mk\
        $(LOCAL_PATH)/libaudio/Android.mk\
	$(LOCAL_PATH)/LiquidParts/Android.mk 
include $(subdir_makefiles)
