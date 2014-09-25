################################################################################
#
# python-requests
#
################################################################################

PYTHON_REQUESTS_VERSION = 2.1.0
PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/source/r/requests
PYTHON_REQUESTS_LICENSE = MIT
PYTHON_REQUESTS_SETUP_TYPE = setuptools

$(eval $(python-package))
