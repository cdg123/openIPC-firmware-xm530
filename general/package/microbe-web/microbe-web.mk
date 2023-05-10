################################################################################
#
# microbe-web
#
################################################################################

#replacing these to build in my web updates for ptz
#MICROBE_WEB_VERSION = $(shell git ls-remote https://github.com/OpenIPC/microbe-web/ master | awk '{ print $$1 }')
# Key for dev site
MICROBE_WEB_VERSION = 48a73f54c896c9315b8f4782b34670dc3da92f17
MICROBE_WEB_SITE = $(call github,cdg123,OpenIPC-microbe-web,$(MICROBE_WEB_VERSION))
MICROBE_WEB_LICENSE = MIT
MICROBE_WEB_LICENSE_FILES = LICENSE

define MICROBE_WEB_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	cp $(MICROBE_WEB_PKGDIR)/files/httpd.conf $(TARGET_DIR)/etc

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	cp $(MICROBE_WEB_PKGDIR)/files/S50httpd $(TARGET_DIR)/etc/init.d
	cp -rv $(@D)/files/etc/init.d/* $(TARGET_DIR)/etc/init.d

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr
	cp -rv $(@D)/files/usr/sbin $(TARGET_DIR)/usr

	$(INSTALL) -m 755 -d $(TARGET_DIR)/var
	cp -rv $(@D)/files/var/www $(TARGET_DIR)/var
endef

$(eval $(generic-package))
