#############################################################
#
# rpi-userland
#
#############################################################

RPI_USERLAND_VERSION = master
RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
RPI_USERLAND_LICENSE = BSD-3c
RPI_USERLAND_LICENSE_FILES = LICENCE
RPI_USERLAND_INSTALL_STAGING = YES
RPI_USERLAND_INSTALL_TARGET = YES

RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg

$(eval $(cmake-package))
