#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

dns="$(cat /etc/resolvconf/resolv.conf.d/head)"
echo -e "DNS SERVER = $dns"
echo -e ""
echo -e "${green}MASUKKAN DNS BARU ATAU TEKAN CTL C UTK EXIT${NC}"
echo -e ""
read -p "NEW DNS SERVER: " dns2
if [ -z $dns2 ]; then
echo "Please Input Port"
exit 0
fi
echo -e ""
echo "nameserver $dns2" > /etc/resolv.conf
echo "nameserver $dns2" > /etc/resolvconf/resolv.conf.d/head

systemctl stop resolvconf.service
systemctl enable resolvconf.service
systemctl start resolvconf.service
clear
sleep 2
echo -e "============================================="
echo -e " ${green} PERTUKARAN DNS SERVER SELESAI${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu