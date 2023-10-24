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
#sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 预置openclash内核
mkdir -p files/etc/openclash/core


# Meta内核版本
CLASH_META_URL=$(curl -sL https://api.github.com/repos/MetaCubeX/Clash.Meta/releases/tags/Prerelease-Alpha | grep /clash.meta-linux-arm64-alpha | awk -F '"' '{print $4}' | head -n 1)


# CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/master/core-lateset/meta/clash-linux-${1}.tar.gz"


wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta
# 给内核权限
chmod +x files/etc/openclash/core/clash*

# meta 要GeoIP.dat 和 GeoSite.dat
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# Country.mmdb
COUNTRY_LITE_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/lite/Country.mmdb
# COUNTRY_FULL_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb
wget -qO- $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb
# wget -qO- $COUNTRY_FULL_URL > files/etc/openclash/Country.mmdb

##-----------------预置openclash dev 内核------------------
curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
mv /tmp/clash feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
##-----------------Set golang version down to 1.19.10 for docker building-----------------
#sed -i '/.*GO_VERSION_PATCH:=*/c\GO_VERSION_PATCH:=10' feeds/packages/lang/golang/golang/Makefile
#sed -i '/.*PKG_HASH:=*/c\PKG_HASH:=13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f' feeds/packages/lang/golang/golang/Makefile
