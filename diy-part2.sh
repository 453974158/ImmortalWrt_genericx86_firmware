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

# 使用immortalwrt的luci-app-smartdns源码
./scripts/feeds uninstall luci-app-smartdns
./scripts/feeds install -p luci luci-app-smartdns
make defconfig
grep '^# CONFIG_PACKAGE_luci-app-smartdns is not set' .config
sed -i 's/^# CONFIG_PACKAGE_luci-app-smartdns is not set$/CONFIG_PACKAGE_luci-app-smartdns=y/' .config
grep '^CONFIG_PACKAGE_luci-app-smartdns=y' .config

# 使用immortalwrt的luci-app-argon-config源码
./scripts/feeds uninstall luci-app-argon-config
./scripts/feeds install -p luci luci-app-argon-config
make defconfig
grep '^# CONFIG_PACKAGE_luci-app-argon-config is not set' .config
sed -i 's/^# CONFIG_PACKAGE_luci-app-argon-config is not set$/CONFIG_PACKAGE_luci-app-argon-config=y/' .config
grep '^CONFIG_PACKAGE_luci-app-argon-config=y' .config

# 使用immortalwrt的luci-ddns-go源码
./scripts/feeds uninstall ddns-go
./scripts/feeds install -p packages ddns-go
make defconfig
grep '^# CONFIG_PACKAGE_ddns-go is not set' .config
sed -i 's/^# CONFIG_PACKAGE_ddns-go is not set$/CONFIG_PACKAGE_ddns-go=y/' .config
grep '^CONFIG_PACKAGE_ddns-go=y' .config
./scripts/feeds uninstall luci-app-ddns-go
./scripts/feeds install -p luci luci-app-ddns-go
make defconfig
grep '^# CONFIG_PACKAGE_luci-app-ddns-go is not set' .config
sed -i 's/^# CONFIG_PACKAGE_luci-app-ddns-go is not set$/CONFIG_PACKAGE_luci-app-ddns-go=y/' .config
grep '^CONFIG_PACKAGE_luci-app-ddns-go=y' .config

# 下载替换的 Makefile
#wget https://raw.githubusercontent.com/openwrt/packages/b780dd263356150cf467e85dc1676feb12bed727/lang/ruby/Makefile -O ruby.Makefile

#替换原有的 Makefile
#cp ruby.Makefile feeds/packages/lang/ruby/Makefile
#mkdir -p package/lang/
#cp -r feeds/packages/lang/ruby/ package/lang/
#cp ruby.Makefile package/lang/ruby/Makefile

# 修改ruby Makefile
# patch -p0 < files/ruby.patch

# 修改rust Makefile
sed -i 's/--set=llvm.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
