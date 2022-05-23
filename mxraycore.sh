#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

echo -e "${green}PANEL XRAY CORE${NC}" 
echo -e "=========================================================================="
echo -e "${green}XRAY VMESS${NC}"
echo -e "=========================================================================="
echo -e "[  1 ] CREATE NEW USER"
echo -e "[  2 ] DELETE ACTIVE USER"
echo -e "[  3 ] EXTEND ACTIVE USER"
echo -e "[  4 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}XRAY VLESS${NC}"
echo -e "=========================================================================="
echo -e "[  5 ] CREATE NEW USER"
echo -e "[  6 ] DELETE ACTIVE USER"
echo -e "[  7 ] EXTEND ACTIVE USER"
echo -e "[  8 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}XRAY VLESS XTLS${NC}"
echo -e "=========================================================================="
echo -e "[  9 ] CREATE NEW USER"
echo -e "[ 10 ] DELETE ACTIVE USER"
echo -e "[ 11 ] EXTEND ACTIVE USER"
echo -e "[ 12 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}XRAY VLESS GRPC${NC}"
echo -e "=========================================================================="
echo -e "[ 13 ] CREATE NEW USER"
echo -e "[ 14 ] DELETE ACTIVE USER"
echo -e "[ 15 ] EXTEND ACTIVE USER"
echo -e "[ 16 ] CHECK USER LOGIN"
echo -e "=========================================================================="
echo -e "${green}[  0 ] EXIT TO MENU${NC}"
echo -e "=========================================================================="
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " xraycore
echo -e "\e[0m"
case $xraycore in
    1)
	add-xvmess
	;;
	2)
	del-xvmess
	;;
	3)
	renew-xvmess
	;;
	4)
	cek-xvmess
	;;
	5)
	add-xvless
	;;
	6)
	del-xvless
	;;
	7)
	renew-xvless
	;;
	8)
	cek-xvless
	;;
	9)
	add-xtls
	;;
	10)
	del-xtls
	;;
    11)
    renew-xtls
    ;;
    12)
    cek-xtls
    ;;
    13)
    add-grpc
    ;;
    14)
    del-grpc
    ;;
    15)
    renew-grpc
    ;;
    16)
    cek-grpc
    ;;
	0)
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mxraycore
   ;;
   esac