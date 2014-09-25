################################################################################
#
# python-decorator
#
################################################################################

PYTHON_DECORATOR_VERSION = 3.4.0
PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/source/d/decorator
PYTHON_DECORATOR_LICENSE = MIT
PYTHON_DECORATOR_SETUP_TYPE = setuptools

$(eval $(python-package))
