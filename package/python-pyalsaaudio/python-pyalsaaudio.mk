################################################################################
#
# python-pyalsaaudio
#
################################################################################

PYTHON_PYALSAAUDIO_VERSION = 0.7
PYTHON_PYALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_PYALSAAUDIO_VERSION).tar.gz
PYTHON_PYALSAAUDIO_SITE = https://pypi.python.org/packages/source/p/pyalsaaudio
PYTHON_PYALSAAUDIO_LICENSE = PSF
PYTHON_PYALSAAUDIO_SETUP_TYPE = setuptools

$(eval $(python-package))
