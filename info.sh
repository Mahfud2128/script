#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
cat /root/log-install.txt
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu