#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 尝试使用openwrt的ruby源码
./scripts/feeds uninstall ruby
rm -rf feeds/packages/lang/ruby  # 确保删除现有的 ImmortalWrt ruby 包
git clone https://github.com/openwrt/packages --depth 1 op-packages
mkdir -p feeds/openwrtpackages/lang/
cp -r op-packages/lang/ruby feeds/op-packages/lang/
./scripts/feeds install -p openwrtpackages ruby

# find feeds/openwrtpackages/ -mindepth 1 -type d ! -path "feeds/openwrtpackages/lang" ! -path "feeds/openwrtpackages/lang/*" -print
# find feeds/openwrtpackages/ -mindepth 1 -type d ! -path "feeds/openwrtpackages/lang" ! -path "feeds/openwrtpackages/lang/*" -exec rm -rf {} +
# find feeds/openwrtpackages/lang/ -mindepth 1 -type d ! -path "feeds/openwrtpackages/lang/ruby" ! -path "feeds/openwrtpackages/lang/ruby/*" -print
# find feeds/openwrtpackages/lang/ -mindepth 1 -type d ! -path "feeds/openwrtpackages/lang/ruby" ! -path "feeds/openwrtpackages/lang/ruby/*" -exec rm -rf {} +

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
