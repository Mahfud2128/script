#!/bin/bash
clear
apt-get -y autoremove;
apt upgrade && apt replace -y

echo -e "${green}START UPDATE${NC}"
sleep 5

wget https://raw.githubusercontent.com/GH-reyz/script/main/kemaskini.sh && chmod +x kemaskini.sh && ./kemaskini.sh

echo -e "${green}UPDATE SELESAI${NC}"
echo " Reboot 5 Sec"
sleep 5
rm -f kemaskini.sh
reboot
