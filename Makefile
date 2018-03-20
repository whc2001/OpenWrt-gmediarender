#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmrender-resurrect
EXE_NAME:=gmediarender
PKG_VERSION:=2017-12-11
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/hzeller/gmrender-resurrect.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=704b182cf530b11922484b428c3badd4ae71550c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_FIXUP:=autoreconf
PKG_INSTALL=1
PKG_REMOVE_FILES:=autogen.sh aclocal.m4

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/gmediarender
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:= +gstreamer1 +glib2 +libupnp +gstreamer1-libs
  TITLE:=A Headless UPnP Renderer
endef

define Package/gmediarender/description
  gmediarender implements the server component that provides UPnP
  controllers a means to render media content (audio, video and images)
  from a UPnP media server.
endef

#CONFIGURE_ARGS+= \
#	CFLAGS="-std=c99" \
#	--with-build-cc="$(HOSTCC)" \
#	--prefix="\usr"

define Package/gmediarender/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(EXE_NAME) $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) 		   $(PKG_BUILD_DIR)/scripts/init.d/$(EXE_NAME)er $(1)/etc/init.d/$(EXE_NAME)
endef

$(eval $(call BuildPackage,gmediarender))
