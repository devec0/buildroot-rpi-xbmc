################################################################################
#
# python-mock
#
################################################################################

PYTHON_MOCK_VERSION = 1.0.1
PYTHON_MOCK_SOURCE = mock-$(PYTHON_MOCK_VERSION).tar.gz
PYTHON_MOCK_SITE = https://pypi.python.org/packages/source/m/mock
PYTHON_MOCK_LICENSE = MIT
PYTHON_MOCK_SETUP_TYPE = setuptools

$(eval $(python-package))
