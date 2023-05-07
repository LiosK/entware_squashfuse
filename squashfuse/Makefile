include $(TOPDIR)/rules.mk

PKG_NAME:=squashfuse
PKG_VERSION:=0.1.105
PKG_RELEASE:=1

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=LiosK <contact@mail.liosk.net>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/vasi/squashfuse/tar.gz/refs/tags/${PKG_VERSION}?
PKG_HASH:=3f776892ab2044ecca417be348e482fee2839db75e35d165b53737cb8153ab1e

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/squashfuse
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  TITLE:=FUSE filesystem to mount squashfs archives
  URL:=https://github.com/vasi/squashfuse
  DEPENDS:=+fuse-utils +fuse3-utils +mount-utils \
	+zlib \
	+SQUASHFUSE_LZO_SUPPORT:liblzo \
	+SQUASHFUSE_LZ4_SUPPORT:liblz4 \
	+SQUASHFUSE_XZ_SUPPORT:liblzma \
	+SQUASHFUSE_ZSTD_SUPPORT:libzstd
endef

define Package/squashfuse/description
  FUSE filesystem to mount squashfs archives
endef

define Package/squashfuse/config
  config SQUASHFUSE_LZO_SUPPORT
	depends on PACKAGE_squashfuse
	bool "Enable LZO support"
	default n

  config SQUASHFUSE_LZ4_SUPPORT
	depends on PACKAGE_squashfuse
	bool "Enable LZ4 support"
	default n

  config SQUASHFUSE_XZ_SUPPORT
	depends on PACKAGE_squashfuse
	bool "Enable XZ support"
	default y

  config SQUASHFUSE_ZSTD_SUPPORT
	depends on PACKAGE_squashfuse
	bool "Enable ZSTD support"
	default y
endef

define Package/squashfuse/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/bin/squashfuse{,_ll} $(1)/opt/bin/
endef

$(eval $(call BuildPackage,squashfuse))
