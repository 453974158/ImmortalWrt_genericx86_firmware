#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
printf '\nsrc-git smartdns https://github.com/pymumu/openwrt-smartdns\n' >> feeds.conf.default
printf '\nsrc-git luci-app-smartdns https://github.com/pymumu/luci-app-smartdns\n' >> feeds.conf.default

#luci-app-temp-status 温度显示
git clone https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status
