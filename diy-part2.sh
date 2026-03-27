#!/bin/bash

# 1. 修改默认 IP
sed -i 's/192.168.1.1/192.168.18.1/g' package/base-files/files/bin/config_generate

# 2. 修改主机名
sed -i 's/OpenWrt/Beryl7-Immortal/g' package/base-files/files/bin/config_generate

# 3. 设置默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. 首次启动时重新生成无线配置
mkdir -p package/base-files/files/etc/uci-defaults/
cat <<'EOF' > package/base-files/files/etc/uci-defaults/99-init-settings
#!/bin/sh

sleep 5

# 强制重新生成无线配置，避免旧配置或探测异常
rm -f /etc/config/wireless
wifi config

# 先只做最基本的启用和区域设置
uci set wireless.radio0.disabled='0'
uci set wireless.radio1.disabled='0'
uci set wireless.radio0.country='US'
uci set wireless.radio1.country='US'

# 不要在这里写 bandwidth，OpenWrt 常用的是 htmode
# 160MHz 建议等确认哪个 radio 是 5G 后再定向设置

uci commit wireless
exit 0
EOF

chmod +x package/base-files/files/etc/uci-defaults/99-init-settings
