LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
LOCAL_SRC_FILES := init_dpp.cpp
LOCAL_MODULE := libinit_dpp
include $(BUILD_STATIC_LIBRARY)
