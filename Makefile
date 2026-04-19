
PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=Vaporizer2

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/Vaporizer2
JUCE_DIR=$(APP_SRC_DIR)/JUCE

APP_ICON=$(APP_SRC_DIR)/Vaporizer/Resources/logokreisvdalpha.png

APP_SHARED_CODE_LIBS="Source/$(APP_NAME)_artefacts/lib$(APP_NAME)_SharedCode.a"


PATCH_FILE=$(PWD)/aap-juce-support.patch

JUCE_PATCHES= \
	$(AAP_JUCE_DIR)/juce-patches/7.0.6/export-jni-symbols.patch \
	$(AAP_JUCE_DIR)/juce-patches/7.0.11/disable-cgwindowlistcreateimage.patch \
	$(AAP_JUCE_DIR)/juce-patches/7.0.6/support-plugin-ui.patch \
	$(AAP_JUCE_DIR)/juce-patches/7.0.11/juce-component-peer-view-touch.patch

include $(AAP_JUCE_DIR)/Makefile.cmake-common
