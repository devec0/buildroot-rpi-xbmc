################################################################################
#
# python-mutagen
#
################################################################################

PYTHON_MUTAGEN_VERSION = 1.24
PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
PYTHON_MUTAGEN_SITE = https://pypi.python.org/packages/source/m/mutagen
PYTHON_MUTAGEN_LICENSE = MIT
PYTHON_MUTAGEN_SETUP_TYPE = setuptools

$(eval $(python-package))
