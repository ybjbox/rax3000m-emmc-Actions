#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

rm -rf feeds/kiddin9/{rtl*,fullconenat-nft} package/feeds/luci/rpcd-mod-luci toolchain/musl package/feeds/packages/gptfdisk package/utils/f2fs-tools package/utils/e2fsprogs package/libs/libselinux package/feeds/packages/acl package/feeds/packages/libevdev

rm -rf devices/common/patches/{fix.patch,iptables.patch,kernel-defaults.patch,targets.patch}

#sed -i "/KernelPackage,sound-soc-core/d" package/kernel/linux/modules/sound.mk
#sed -i "/KernelPackage,multimedia-input/d" package/kernel/linux/modules/video.mk

svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/toolchain/musl toolchain/musl
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/utils/e2fsprogs package/utils/e2fsprogs
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/utils/ucode package/utils/ucode
svn co https://github.com/openwrt/openwrt/branches/openwrt-23.05/package/libs/libselinux package/libs/libselinux
#ln -sf $(pwd)/feeds/luci/modules/luci-base package/feeds/kiddin9/

sed -i "s/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2099-12-06/" package/network/config/netifd/Makefile

sed -i "s/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += luci-app-mtk mii_mgr wifi-profile mtkhqos_util wireless-regdb switch regs kmod-warp kmod-mt_wifi kmod-mediatek_hnat kmod-conninfra datconf-lua/" target/linux/mediatek/Makefile


##-----------------Set golang version down to 1.19.10 for docker building-----------------
#sed -i '/.*GO_VERSION_PATCH:=*/c\GO_VERSION_PATCH:=10' feeds/packages/lang/golang/golang/Makefile
#sed -i '/.*PKG_HASH:=*/c\PKG_HASH:=13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f' feeds/packages/lang/golang/golang/Makefile
