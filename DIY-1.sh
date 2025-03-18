#!/bin/bash
# 添加软件源到 feeds.conf.default 文件
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 

#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i 'src-git infinityfreedomng https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' feeds.conf.default
# echo "src-git custom_pkg https://github.com/cdny123/openwrt-package1.git" >> feeds.conf.default
# echo "src-git cdny123 https://github.com/cdny123/openwrt-package1.git" >> openwrt/feeds.conf.default

# 在 DIY 脚本中调整依赖
sed -i 's/dnsmasq/dnsmasq-full/g' package/feeds/luci/luci-app-dhcp/Makefile

# 添加自定义软件
git clone https://github.com/lq-wq/luci-app-quickstart.git package/luci-app-quickstart
git clone https://github.com/sirpdboy/luci-app-lucky.git package/luci-app-lucky
git clone -b main https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki
git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp       # 一键自动格式化分区、扩容、自动挂载插件
# git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
