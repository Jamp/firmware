################################################################################
#
# divinus
#
################################################################################

DIVINUS_SITE = $(call github,Jamp,divinus,$(DIVINUS_VERSION))
DIVINUS_VERSION = 77aaff54edab0e367c3e545fed2d870e9c867c5e
DIVINUS_LICENSE = MIT
DIVINUS_LICENSE_FILES = LICENSE

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
	DIVINUS_OPTIONS = "-rdynamic -s -Os -lm"
else
	DIVINUS_OPTIONS = "-rdynamic -s -Os"
endif

define DIVINUS_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) OPT=$(DIVINUS_OPTIONS) -C $(@D)/src
endef

define DIVINUS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(@D)/divinus.yaml

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/divinus
endef

$(eval $(generic-package))
