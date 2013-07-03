LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifneq (,$(findstring $(TARGET_BOARD_PLATFORM),qsd8k msm7k))

LOCAL_C_FLAGS        += -O3
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware libui
LOCAL_C_INCLUDES       := frameworks/base/services/ frameworks/base/include
LOCAL_C_INCLUDES       += frameworks/native/services/ frameworks/native/include
LOCAL_C_INCLUDES       += hardware/libhardware/include/ hardware

include $(BUILD_SHARED_LIBRARY)

endif
