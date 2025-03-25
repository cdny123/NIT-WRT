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

# 添加APP插件
# git clone https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
# git clone https://github.com/lq-wq/luci-app-quickstart.git package/luci-app-quickstart
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加alist插件
# 需要 golang 1.22.x 或最新版本 (修复了 OpenWrt 旧分支的 build)
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
# 获取 Luci-app-alist 源码
# git clone https://github.com/sbwml/luci-app-alist package/alist    
