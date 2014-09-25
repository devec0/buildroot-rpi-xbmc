################################################################################
#
# python-oauth2client
#
################################################################################

PYTHON_OAUTH2CLIENT_VERSION = 1.2
PYTHON_OAUTH2CLIENT_SOURCE = oauth2client-$(PYTHON_OAUTH2CLIENT_VERSION).tar.gz
PYTHON_OAUTH2CLIENT_SITE = https://pypi.python.org/packages/source/o/oauth2client
PYTHON_OAUTH2CLIENT_LICENSE = MIT
PYTHON_OAUTH2CLIENT_SETUP_TYPE = setuptools

$(eval $(python-package))
