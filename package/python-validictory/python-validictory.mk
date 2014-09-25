################################################################################
#
# python-validictory
#
################################################################################

PYTHON_VALIDICTORY_VERSION = 1.0.0a2
PYTHON_VALIDICTORY_SOURCE = validictory-$(PYTHON_VALIDICTORY_VERSION).tar.gz
PYTHON_VALIDICTORY_SITE = https://pypi.python.org/packages/source/v/validictory
PYTHON_VALIDICTORY_LICENSE = MIT
PYTHON_VALIDICTORY_SETUP_TYPE = setuptools

$(eval $(python-package))
