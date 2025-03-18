#!/bin/bash
# 设置默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' .config
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config
echo "CONFIG_PACKAGE_luci-theme-infinityfreedom-ng=y" >> .config

# 启用插件
plugins=(
    "luci-app-dockerman"
    "luci-app-adguardhome"
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
    "luci-app-homeassistant"
)

for pkg in "${plugins[@]}"; do
    echo "CONFIG_PACKAGE_${pkg}=y" >> .config
done

# 更换固件内核为 6.6
echo "CONFIG_LINUX_6_6=y" >> .config
echo "CONFIG_LINUX_6_6_USE_LATEST=y" >> .config
echo "CONFIG_DEFAULT_LINUX_6_6=y" >> .config

# 个性签名,默认增加年月日[$(TZ=UTC-8 date "+%Y.%m.%d")]
export Customized_Information="04543473 $(TZ=UTC-8 date "+%Y.%m.%d")"
echo "CONFIG_CUSTOMIZED_INFORMATION=\"$Customized_Information\"" >> .config

# 网络优化配置
echo "CONFIG_PACKAGE_kmod-tcp-bbr=y" >> .config
echo "CONFIG_PACKAGE_kmod-fs-antfs=y" >> .config
echo "CONFIG_PACKAGE_kmod-usb3=y" >> .config
