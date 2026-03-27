#!/bin/bash

# 1. 添加第三方插件源
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 2. 先避免 small / 其他位置已有的 HomeProxy 冲突
rm -rf feeds/small/homeproxy
rm -rf feeds/small/luci-app-homeproxy
rm -rf package/feeds/small/homeproxy
rm -rf package/feeds/small/luci-app-homeproxy
rm -rf package/homeproxy

# 3. 使用 ImmortalWrt 原生 HomeProxy
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/homeproxy
