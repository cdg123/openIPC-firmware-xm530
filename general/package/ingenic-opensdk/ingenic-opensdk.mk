################################################################################
#
# ingenic-opensdk
#
################################################################################

INGENIC_OPENSDK_LICENSE = GPL-3.0
INGENIC_OPENSDK_LICENSE_FILES = LICENSE

define INGENIC_OPENSDK_EXTRACT_CMDS
	cp $(INGENIC_OPENSDK_PKGDIR)/src/kernel/* $(@D)/
endef

INGENIC_OPENSDK_MODULE_MAKE_OPTS = \
	CONFIG_GPIO=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
