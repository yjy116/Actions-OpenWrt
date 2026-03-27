#!/bin/bash

# 1. 修改默认 IP 为 192.168.8.1 (GL.iNet 用户习惯)
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 2. 修改默认主机名为 Beryl7-LEDE
sed -i 's/OpenWrt/Beryl7-LEDE/g' package/base-files/files/bin/config_generate

# 3. 设置默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. 强制开启硬件加速相关的内核定义 (针对 Filogic 平台)
echo "CONFIG_NET_MEDIATEK_SOC_WED=y" >> .config

# 5. 移除 root 默认密码 (刷机后初次登录无需密码)
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CY6Sv6wSRCosSKqvePqgr0:18856:0:99999:7:::/g' package/base-files/files/etc/shadow

# 6. 修改版本号标识 (可选)
sed -i "s/OpenWrt /Built by YourName $(date +%Y-%m-%d) /g" package/base-files/files/etc/banner
