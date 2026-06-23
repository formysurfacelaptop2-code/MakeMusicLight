TARGET = iphone:clang:latest:15.0
FINALPACKAGE = 1
INSTALL_TARGET_PROCESSES = com.apple.Music

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MakeMusicLight

MakeMusicLight_FILES = Tweak.x
MakeMusicLight_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
