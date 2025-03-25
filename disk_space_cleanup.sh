#!/bin/bash
#chmod +x disk_space_cleanup.sh
#./disk_space_cleanup.sh

# 清理 apt 缓存
echo "开始清理 apt 缓存..."
sudo apt-get clean
if [ $? -ne 0 ]; then
    echo "清理 apt 缓存时出现错误！"
    exit 1
fi
echo "apt 缓存清理完成。"

# 清理 Docker 未使用的资源
echo "开始清理 Docker 未使用的资源..."
docker system prune -a -f
if [ $? -ne 0 ]; then
    echo "清理 Docker 资源时出现错误！"
    exit 1
fi
echo "Docker 资源清理完成。"

# 删除 Docker 数据目录（此操作会删除所有 Docker 数据，请谨慎使用）
echo "开始删除 Docker 数据目录..."
sudo rm -rf /var/lib/docker
if [ $? -ne 0 ]; then
    echo "删除 Docker 数据目录时出现错误！"
    exit 1
fi
echo "Docker 数据目录删除完成。"

# 清空日志文件
echo "开始清空日志文件..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;
if [ $? -ne 0 ]; then
    echo "清空日志文件时出现错误！"
    exit 1
fi
echo "日志文件清空完成。"

# 清理临时文件
echo "开始清理 /tmp 目录..."
sudo rm -rf /tmp/*
if [ $? -ne 0 ]; then
    echo "清理 /tmp 目录时出现错误！"
    exit 1
fi
echo "/tmp 目录清理完成。"

echo "开始清理 /var/tmp 目录..."
sudo rm -rf /var/tmp/*
if [ $? -ne 0 ]; then
    echo "清理 /var/tmp 目录时出现错误！"
    exit 1
fi
echo "/var/tmp 目录清理完成。"

# 显示磁盘使用情况
echo "清理完成，当前磁盘使用情况如下："
df -h    
