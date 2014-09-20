################################################################################
#
# gst-python
#
################################################################################

GST_PYTHON_VERSION = 0.10.13
GST_PYTHON_SOURCE = gst-python-$(GST_PYTHON_VERSION).tar.bz2
GST_PYTHON_SITE = http://gstreamer.freedesktop.org/src/gst-python
GST_PYTHON_INSTALL_STAGING = YES
GST_PYTHON_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base host-python python python-pygobject

GST_PYTHON_CONF_EXTRA_OPT = \
		--cross-prefix=$(TARGET_CROSS) \
		--target-os=linux

GST_PYTHON_CONF_ENV += \
        PYTHON_INCLUDES="-I${STAGING_DIR}/usr/include/python$(PYTHON_VERSION_MAJOR)"


$(eval $(autotools-package))
