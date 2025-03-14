#!/bin/bash
# 添加软件源
echo "src-git custom_pkg https://github.com/cdny123/openwrt-package1.git" >> feeds.conf.default

# 添加自定义软件
git clone https://github.com/lq-wq/luci-app-quickstart.git package/luci-app-quickstart
git clone https://github.com/sirpdboy/luci-app-lucky.git package/luci-app-lucky
git clone -b main https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

# 添加主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/guangguangzhu/luci-theme-kucat.git package/luci-theme-kucat
