#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
echo -e "============================================="
echo -e " ${green} RECERT V2RAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
domain=$(cat /etc/v2ray/domain)
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop trojan
systemctl stop nginx
sudo kill -9 $(sudo lsof -t -i:80)
~/.acme.sh/acme.sh --renew -d $domain --standalone -k ec-256 --force --ecc
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
echo Done
sleep 0.5

echo -e "============================================="
echo -e " ${green} RECERT XRAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls
systemctl stop xray@vless-tls
systemctl stop xray@vless-grpc
systemctl stop xray@vless-direct
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.ke --ecc
systemctl start xray@v2ray-tls
systemctl start xray@v2ray-nontls
systemctl start xray@vless-tls
systemctl start xray@vless-grpc
systemctl start xray@vless-direct
systemctl start nginx
echo Done
sleep 0.5
clear
echo -e "============================================="
echo -e " ${green} RECERT DOMAIN SELESAI${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu