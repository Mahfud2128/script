#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

echo -e "${green}PANEL V2RAY CORE${NC}"
echo -e "=========================================================================="
echo -e "${green}V2RAY VMESS${NC}"
echo -e "=========================================================================="
echo -e "[ 1 ] CREATE NEW USER"
echo -e "[ 2 ] DELETE ACTIVE USER"
echo -e "[ 3 ] EXTEND ACTIVE USER"
echo -e "[ 4 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}V2RAY VLESS${NC}"
echo -e "=========================================================================="
echo -e "[ 5 ] CREATE NEW USER"
echo -e "[ 6 ] DELETE ACTIVE USER"
echo -e "[ 7 ] EXTEND ACTIVE USER"
echo -e "[ 8 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}[ 0 ] EXIT TO MENU${NC}"
echo -e "=========================================================================="
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " v2raycore
echo -e "\e[0m"
case $v2raycore in
    1)
    add-ws
    ;;
    2)
    del-ws
    ;;
    3)
    renew-ws
    ;;
    4)
    cek-ws
    ;;
    5)
    add-vless
    ;;
    6)
    del-vless
    ;;
    7)
    renew-vless
    ;;
    8)
    cek-vless
    ;;
	0)
    sleep 0.5
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mv2raycore
   ;;
   esac