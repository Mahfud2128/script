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
systemctl stop xray-mini.service
systemctl stop xray-mini-gprc.service
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
systemctl start xray-mini.service
systemctl start xray-mini-gprc.service
echo Done
sleep 0.5
clear
echo -e "============================================="
echo -e " ${green} RECERT DOMAIN SELESAI${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu