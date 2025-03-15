#!/bin/bash
# 设置默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' .config
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config

# 启用插件
plugins=(
    "luci-app-dockerman"
    "luci-app-AdGuardHome"
    "luci-app-oaf"
    "luci-app-ddnsto"
    "luci-app-mosdns"
    "luci-app-openclash"
    "luci-app-lucky"
    "luci-app-ddns"
    "luci-app-smartdns"
    "luci-app-alist"
    "luci-app-ksmbd"
    "luci-app-ttyd"
    "luci-app-upnp"
    "luci-app-nikki"
    "luci-app-quickstart"
    "luci-app-diskman"
    "luci-app-poweroff"
    "luci-app-partexp"
    "luci-app-netdata"
    "luci-app-store"
    "luci-app-HomeAssistant"
)

for pkg in "${plugins[@]}"; do
    echo "CONFIG_PACKAGE_${pkg}=y" >> .config
done

# 网络优化配置
echo "CONFIG_PACKAGE_kmod-tcp-bbr=y" >> .config
echo "CONFIG_PACKAGE_kmod-fs-antfs=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb3=y" >> .config
