################################################################################
#
# python-mopidy
#
################################################################################

PYTHON_MOPIDY_VERSION = 0.19.3
PYTHON_MOPIDY_SOURCE = Mopidy-$(PYTHON_MOPIDY_VERSION).tar.gz
PYTHON_MOPIDY_SITE = https://pypi.python.org/packages/source/M/Mopidy
PYTHON_MOPIDY_LICENSE = Apache-2.0
PYTHON_MOPIDY_SETUP_TYPE = setuptools

define PYTHON_MOPIDY_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 644 package/python-mopidy/mopidy.service \
                $(TARGET_DIR)/etc/systemd/system/mopidy.service

        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants

        ln -fs ../mopidy.service \
                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mopidy.service
endef

define PYTHON_MOPIDY_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 644 package/python-mopidy/S70mopidy \
                $(TARGET_DIR)/etc/init.d/S70mopidy
endef


$(eval $(python-package))
