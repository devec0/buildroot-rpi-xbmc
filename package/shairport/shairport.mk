################################################################################
#
# Shairport
#
################################################################################

SHAIRPORT_VERSION = master
SHAIRPORT_SITE = $(call github,abrasive,shairport,$(SHAIRPORT_VERSION))
SHAIRPORT_LICENSE = GPLv2
SHAIRPORT_DEPENDENCIES = openssl

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
SHAIRPORT_DEPENDENCIES += pulseaudio
endif

ifeq ($(BR2_PACKAGE_LIBAO),y)
SHAIRPORT_DEPENDENCIES += libao
endif

ifeq ($(BR2_PACKAGE_AVAHI),y)
SHAIRPORT_DEPENDENCIES += avahi
endif

define SHAIRPORT_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/shairport/S60shairport \
		$(TARGET_DIR)/etc/init.d/S60shairport
endef

define SHAIRPORT_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/shairport/shairport.service \
		$(TARGET_DIR)/etc/systemd/system/shairport.service

	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants

	ln -fs ../shairport.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/shairport.service
endef

define SHAIRPORT_BUILD_CMDS
	cd $(@D) && ./configure
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define SHAIRPORT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/shairport $(TARGET_DIR)/usr/bin/shairport
endef

$(eval $(generic-package))
