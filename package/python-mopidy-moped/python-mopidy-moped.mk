################################################################################
#
# python-mopidy-moped
#
################################################################################

PYTHON_MOPIDY_MOPED_VERSION = 0.3.0
PYTHON_MOPIDY_MOPED_SOURCE = Mopidy-Moped-$(PYTHON_MOPIDY_MOPED_VERSION).tar.gz
PYTHON_MOPIDY_MOPED_SITE = https://pypi.python.org/packages/source/M/Mopidy-Moped/
PYTHON_MOPIDY_MOPED_LICENSE = MIT
PYTHON_MOPIDY_MOPED_SETUP_TYPE = setuptools

$(eval $(python-package))
