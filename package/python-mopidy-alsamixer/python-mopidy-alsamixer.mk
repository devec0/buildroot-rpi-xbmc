################################################################################
#
# python-mopidy-alsamixer
#
################################################################################

PYTHON_MOPIDY_ALSAMIXER_VERSION = 1.0.3
PYTHON_MOPIDY_ALSAMIXER_SOURCE = Mopidy-ALSAMixer-$(PYTHON_MOPIDY_ALSAMIXER_VERSION).tar.gz
PYTHON_MOPIDY_ALSAMIXER_SITE = https://pypi.python.org/packages/source/M/Mopidy-ALSAMixer/
PYTHON_MOPIDY_ALSAMIXER_LICENSE = Apache 2.0
PYTHON_MOPIDY_ALSAMIXER_SETUP_TYPE = setuptools

$(eval $(python-package))
