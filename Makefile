TARGET := iphone:clang:latest:13.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PodsGrant

PodsGrant_FILES = Tweak.c Sharing_Tweak.x general.c os_log_handler.c
PodsGrant_CFLAGS = -fobjc-arc -O2

ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	PodsGrant_CFLAGS += -DIS_ROOTLESS=1
endif

include $(THEOS_MAKE_PATH)/tweak.mk

ifneq ($(THEOS_PACKAGE_SCHEME),rootless)
	SUBPROJECTS += podsgrantadaptivetransparency
endif
SUBPROJECTS += podsgrantsettings

include $(THEOS_MAKE_PATH)/aggregate.mk
