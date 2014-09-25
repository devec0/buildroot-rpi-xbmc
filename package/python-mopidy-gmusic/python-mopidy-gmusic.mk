################################################################################
#
# python-mopidy-gmusic
#
################################################################################

PYTHON_MOPIDY_GMUSIC_VERSION = develop
PYTHON_MOPIDY_GMUSIC_SITE = https://github.com/hechtus/mopidy-gmusic.git
PYTHON_MOPIDY_GMUSIC_SITE_METHOD = git
PYTHON_MOPIDY_GMUSIC_LICENSE = MIT
PYTHON_MOPIDY_GMUSIC_SETUP_TYPE = setuptools

$(eval $(python-package))
