TARGET = iphone:clang:latest:15.0

ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME = rootless

FINALPACKAGE = 1
INSTALL_TARGET_PROCESSES = com.apple.Music

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MakeMusicLight

MakeMusicLight_FILES = Tweak.x
MakeMusicLight_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
