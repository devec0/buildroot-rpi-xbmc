################################################################################
#
# python-pykka
#
################################################################################

PYTHON_PYKKA_VERSION = 1.2.0
PYTHON_PYKKA_SOURCE = Pykka-$(PYTHON_PYKKA_VERSION).tar.gz
PYTHON_PYKKA_SITE = https://pypi.python.org/packages/source/P/Pykka
PYTHON_PYKKA_LICENSE = Apache-2.0
PYTHON_PYKKA_SETUP_TYPE = setuptools

$(eval $(python-package))
