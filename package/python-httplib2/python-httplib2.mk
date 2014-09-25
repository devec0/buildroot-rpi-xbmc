################################################################################
#
# python-httplib2
#
################################################################################

PYTHON_HTTPLIB2_VERSION = 0.9
PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
PYTHON_HTTPLIB2_SITE = https://pypi.python.org/packages/source/h/httplib2
PYTHON_HTTPLIB2_LICENSE = MIT
PYTHON_HTTPLIB2_SETUP_TYPE = setuptools

$(eval $(python-package))
