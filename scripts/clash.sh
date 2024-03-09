#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path: $PWD"

mkdir -p files/etc/openclash && cd files/etc/openclash


CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-amd64.tar.gz"
CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/master/premium\?ref\=core | grep download_url | grep amd64 | awk -F '"' '{print $4}')
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz"

CORE_DEV="https://github.com/SunHHB/ShellCrash/raw/master/bin/clash/clash-linux-amd64.tar.gz"
CORE_TUN="https://github.com/SunHHB/ShellCrash/raw/master/bin/clashpre/clash-linux-amd64.tar.gz"
CORE_MATE="https://github.com/SunHHB/ShellCrash/raw/master/bin/meta/clash-linux-amd64.tar.gz"


GEO_MMDB="https://github.com/alecthw/mmdb_china_ip_list/raw/release/lite/Country.mmdb"
GEO_SITE="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat"
GEO_IP="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat"
GEO_META="https://github.com/MetaCubeX/meta-rules-dat/raw/release/geoip.metadb"
	
 
curl -sfL -o Country.mmdb $GEO_MMDB
curl -sfL -o GeoSite.dat $GEO_SITE
curl -sfL -o GeoIP.dat $GEO_IP
curl -sfL -o GeoIP.metadb $GEO_META


mkdir ./core/ && cd ./core/

curl -sfL -o meta.tar.gz $CORE_MATE && tar -zxf meta.tar.gz && mv -f clash clash_meta
curl -sfL -o tun.tar.gz $CORE_TUN && tar -zxf tun.tar.gz && mv -f clash clash_tun
curl -sfL -o dev.tar.gz $CORE_DEV && tar -zxf dev.tar.gz

chmod +x ./clash* && rm -rf ./*.gz
tun
echo "openclash date has been updated!"

exit 0
