################################################################################
#
# python-dateutil
#
################################################################################

PYTHON_DATEUTIL_VERSION = 2.2
PYTHON_DATEUTIL_SOURCE = python-dateutil-$(PYTHON_DATEUTIL_VERSION).tar.gz
PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/source/p/python-dateutil
PYTHON_DATEUTIL_LICENSE = Apache-2.0
PYTHON_DATEUTIL_SETUP_TYPE = setuptools

$(eval $(python-package))
