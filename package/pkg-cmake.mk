################################################################################
# CMake package infrastructure
#
# This file implements an infrastructure that eases development of
# package .mk files for CMake packages. It should be used for all
# packages that use CMake as their build system.
#
# See the Buildroot documentation for details on the usage of this
# infrastructure
#
# In terms of implementation, this CMake infrastructure requires
# the .mk file to only specify metadata information about the
# package: name, version, download URL, etc.
#
# We still allow the package .mk file to override what the different
# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
# already defined, it is used as the list of commands to perform to
# build the package, instead of the default CMake behaviour. The
# package can also define some post operation hooks.
#
################################################################################

################################################################################
# inner-cmake-package -- defines how the configuration, compilation and
# installation of a CMake package should be done, implements a few hooks to
# tune the build process and calls the generic package infrastructure to
# generate the necessary make targets
#
#  argument 1 is the lowercase package name
#  argument 2 is the uppercase package name, including a HOST_ prefix
#             for host packages
#  argument 3 is the uppercase package name, without the HOST_ prefix
#             for host packages
#  argument 4 is the type (target or host)
################################################################################

define inner-cmake-package

$(2)_CONF_ENV			?=
$(2)_CONF_OPT			?=
$(2)_MAKE			?= $$(MAKE)
$(2)_MAKE_ENV			?=
$(2)_MAKE_OPT			?=
$(2)_INSTALL_HOST_OPT		?= install
$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install

$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
$(2)_BUILDDIR			= $$($(2)_SRCDIR)

#
# Configure step. Only define it if not already defined by the package
# .mk file. And take care of the differences between host and target
# packages.
#
ifndef $(2)_CONFIGURE_CMDS
ifeq ($(4),target)

# Configure package for target
define $(2)_CONFIGURE_CMDS
	(cd $$($$(PKG)_BUILDDIR) && \
	rm -f CMakeCache.txt && \
	PATH=$$(BR_PATH) \
	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_COLOR_MAKEFILE=OFF \
		-DBUILD_TESTING=OFF \
		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
		$$($$(PKG)_CONF_OPT) \
	)
endef
else

# Configure package for host
define $(2)_CONFIGURE_CMDS
	(cd $$($$(PKG)_BUILDDIR) && \
	rm -f CMakeCache.txt && \
	PATH=$$(BR_PATH) \
	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
		-DCMAKE_INSTALL_SO_NO_EXE=0 \
		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
		-DBUILD_TESTING=OFF \
		$$($$(PKG)_CONF_OPT) \
	)
endef
endif
endif

# This must be repeated from inner-generic-package, otherwise we only get
# host-cmake in _DEPENDENCIES because of the following line
ifeq ($(4),host)
$(2)_DEPENDENCIES ?= $$(filter-out host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
endif

$(2)_DEPENDENCIES += host-cmake

#
# Build step. Only define it if not already defined by the package .mk
# file.
#
ifndef $(2)_BUILD_CMDS
ifeq ($(4),target)
define $(2)_BUILD_CMDS
	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
endef
else
define $(2)_BUILD_CMDS
	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
endef
endif
endif

#
# Host installation step. Only define it if not already defined by the
# package .mk file.
#
ifndef $(2)_INSTALL_CMDS
define $(2)_INSTALL_CMDS
	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
endef
endif

#
# Staging installation step. Only define it if not already defined by
# the package .mk file.
#
ifndef $(2)_INSTALL_STAGING_CMDS
define $(2)_INSTALL_STAGING_CMDS
	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
endef
endif

#
# Target installation step. Only define it if not already defined by
# the package .mk file.
#
ifndef $(2)_INSTALL_TARGET_CMDS
define $(2)_INSTALL_TARGET_CMDS
	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
endef
endif

# Call the generic package infrastructure to generate the necessary
# make targets
$(call inner-generic-package,$(1),$(2),$(3),$(4))

endef

################################################################################
# cmake-package -- the target generator macro for CMake packages
################################################################################

cmake-package = $(call inner-cmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)

################################################################################
# Generation of the CMake toolchain file
################################################################################

# In order to allow the toolchain to be relocated, we calculate the HOST_DIR
# based on the toolchainfile.cmake file's location: $(HOST_DIR)/usr/share/buildroot
# In all the other variables, HOST_DIR will be replaced by RELOCATED_HOST_DIR,
# so we have to strip "$(HOST_DIR)/" from the paths that contain it.
$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
	@mkdir -p $(@D)
	sed \
		-e 's:@@STAGING_SUBDIR@@:$(call qstrip,$(STAGING_SUBDIR)):' \
		-e 's:@@TARGET_CFLAGS@@:$(call qstrip,$(TARGET_CFLAGS)):' \
		-e 's:@@TARGET_CXXFLAGS@@:$(call qstrip,$(TARGET_CXXFLAGS)):' \
		-e 's:@@TARGET_CC_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CC_NOCCACHE))):' \
		-e 's:@@TARGET_CXX_NOCCACHE@@:$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_CXX_NOCCACHE))):' \
		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
		> $@
