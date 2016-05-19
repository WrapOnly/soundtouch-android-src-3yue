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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := soundtouch
LOCAL_SRC_FILES := soundtouch/AAFilter.cpp  soundtouch/FIFOSampleBuffer.cpp \
                soundtouch/FIRFilter.cpp soundtouch/cpu_detect_x86.cpp \
                soundtouch/sse_optimized.cpp soundstretch/WavFile.cpp \
                soundtouch/RateTransposer.cpp soundtouch/SoundTouch.cpp \
                soundtouch/InterpolateCubic.cpp soundtouch/InterpolateLinear.cpp \
                soundtouch/InterpolateShannon.cpp soundtouch/TDStretch.cpp \
                soundtouch/BPMDetect.cpp soundtouch/PeakFinder.cpp 

# for native audio
LOCAL_SHARED_LIBRARIES += -lgcc 
# for logging
LOCAL_LDLIBS    += -llog
# for native asset manager
#LOCAL_LDLIBS    += -landroid

# Custom Flags: 
# -fvisibility=hidden : don't export all symbols
LOCAL_CFLAGS += -fvisibility=hidden -I include -fdata-sections -ffunction-sections

# OpenMP mode : enable these flags to enable using OpenMP for parallel computation 
#LOCAL_CFLAGS += -fopenmp
#LOCAL_LDFLAGS += -fopenmp

# Use ARM instruction set instead of Thumb for improved calculation performance in ARM CPUs	
LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
