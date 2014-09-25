################################################################################
#
# python-proboscis
#
################################################################################

PYTHON_PROBOSCIS_VERSION = 1.2.6.0
PYTHON_PROBOSCIS_SOURCE = proboscis-$(PYTHON_PROBOSCIS_VERSION).tar.gz
PYTHON_PROBOSCIS_SITE = https://pypi.python.org/packages/source/p/proboscis
PYTHON_PROBOSCIS_LICENSE = MIT
PYTHON_PROBOSCIS_SETUP_TYPE = setuptools

$(eval $(python-package))
