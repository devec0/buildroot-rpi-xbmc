################################################################################
#
# python-mopidy-gmusic
#
################################################################################

PYTHON_MOPIDY_GMUSIC_VERSION = 0.3.0
PYTHON_MOPIDY_GMUSIC_SOURCE = Mopidy-GMusic-$(PYTHON_MOPIDY_GMUSIC_VERSION).tar.gz
PYTHON_MOPIDY_GMUSIC_SITE = https://pypi.python.org/packages/source/M/Mopidy-GMusic/
PYTHON_MOPIDY_GMUSIC_LICENSE = MIT
PYTHON_MOPIDY_GMUSIC_SETUP_TYPE = setuptools

$(eval $(python-package))
