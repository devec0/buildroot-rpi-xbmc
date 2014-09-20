################################################################################
#
# python-gmusicapi
#
################################################################################

PYTHON_GMUSICAPI_VERSION = 4.0.0
PYTHON_GMUSICAPI_SOURCE = gmusicapi-$(PYTHON_GMUSICAPI_VERSION).tar.gz
PYTHON_GMUSICAPI_SITE = https://pypi.python.org/packages/source/g/gmusicapi
PYTHON_GMUSICAPI_LICENSE = BSD
PYTHON_GMUSICAPI_SETUP_TYPE = setuptools

$(eval $(python-package))
