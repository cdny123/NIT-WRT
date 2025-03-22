#!/bin/bash

# 网络配置， 设置管理IP为192.168.6.1
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 系统标识， 设置主机名为Openwrt-NIT
sed -i 's/OpenWrt/Openwrt-NIT/g' package/base-files/files/bin/config_generate

# ttyd自动登录， 配置ttyd自动登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 内核和系统分区大小:128、1024
sed -i 's/64/128/g' target/linux/x86/image/Makefile
sed -i 's/512/1024/g' target/linux/x86/image/Makefile

# 个性签名：04543473,默认增加年月日[$(TZ=UTC-8 date "+%Y.%m.%d")]
sed -i "s/DISTRIB_REVISION='.*'/DISTRIB_REVISION='04543473 $(TZ=UTC-8 date "+%Y.%m.%d")'/g" package/base-files/files/etc/openwrt_release

# 更换固件内核：6.6
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.6/g' target/linux/x86/Makefile

# 增加AdGuardHome插件和核心（编译固件时自动增加AdGuardHome插件和AdGuardHome插件核心）
echo 'CONFIG_PACKAGE_luci-app-adguardhome=y' >> .config
echo 'CONFIG_PACKAGE_adguardhome=y' >> .config

# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间(根据编译机型变化,自行调整删除名称)
CLEAR_PATH="clear.list"
cat >"$CLEAR_PATH" <<-EOF
packages
config.buildinfo
feeds.buildinfo
sha256sums
version.buildinfo
profiles.json
openwrt-x86-64-generic-kernel.bin
openwrt-x86-64-generic.manifest
openwrt-x86-64-generic-squashfs-rootfs.img.gz
EOF    