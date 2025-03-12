# 一键编译脚本

#!/bin/bash

# 初始化配置
chmod +x diy/scripts/*.sh
./diy/scripts/base_config.sh
git apply diy/patches/*.patch

# 合并配置
cat diy/x86-64.config >> .config
make defconfig

# 编译流程
make -j$(nproc) download
make -j$(($(nproc)+1)) V=s
