#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -n > /tmp/other.txt
data=( `cat /etc/xray/vless-direct.json | grep '^###' | cut -d ' ' -f 2`);
echo -e "-------------------------------";
echo -e "${green}XRAY VLESS XTLS USER LOGIN${NC}";
echo -e "-------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipxtls.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/vless-direct-login.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipxtls.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipxtls.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipxtls.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipxtls.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "-------------------------------"
fi
rm -rf /tmp/ipxtls.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "other";
echo "$oth";
echo "-------------------------------"
rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu