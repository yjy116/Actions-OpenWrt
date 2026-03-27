#!/bin/bash

# 1. 修改默认 IP 为 192.168.8.1 (符合 GL.iNet 习惯)
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 2. 修改主机名为 Beryl7-LEDE
sed -i 's/OpenWrt/Beryl7-LEDE/g' package/base-files/files/bin/config_generate

# 3. 设置默认主题为 Argon (如果 .config 里选了的话)
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. 移除默认密码 (编译出的固件首次登录无需密码)
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CY6Sv6wSRCosSKqvePqgr0:18856:0:99999:7:::/g' package/base-files/files/etc/shadow
