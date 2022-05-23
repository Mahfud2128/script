#!/bin/bash
clear
direct="$(cat ~/log-install.txt | grep -w "XRAY VLESS XTLS" | cut -d: -f2|sed 's/ //g')"
echo -e "      Change Port $direct"
read -p "New Port XRAY VLESS XTLS: " direct1
if [ -z $direct1 ]; then
echo "Please Input Port"
exit 0
fi

cek=$(netstat -nutlp | grep -w $direct1)
if [[ -z $cek ]]; then
sed -i "s/$direct/$direct1/g" /etc/xray/vless-direct.json
sed -i "s/- XRAY VLESS XTLS         : $direct/- XRAY VLESS XTLS         : $direct1/g" /root/log-install.txt
systemctl stop xray@vless-direct > /dev/null
systemctl enable xray@vless-direct > /dev/null
systemctl start xray@vless-direct > /dev/null

echo -e "\e[032;1mPort $direct1 modified successfully\e[0m"
else
echo "Port $direct1 is used"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu