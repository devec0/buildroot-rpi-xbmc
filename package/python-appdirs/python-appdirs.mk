################################################################################
#
# python-appdirs
#
################################################################################

PYTHON_APPDIRS_VERSION = 1.4.0
PYTHON_APPDIRS_SOURCE = appdirs-$(PYTHON_APPDIRS_VERSION).tar.gz
PYTHON_APPDIRS_SITE = https://pypi.python.org/packages/source/a/appdirs
PYTHON_APPDIRS_LICENSE = MIT
PYTHON_APPDIRS_SETUP_TYPE = setuptools

$(eval $(python-package))
