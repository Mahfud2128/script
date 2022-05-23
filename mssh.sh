#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

echo -e ""
echo -e  "  ════════════════════════════════════════════════════════════ " 
echo -e  "               ${green}SSH & OPENVPN MENU${NC}                     " 
echo -e  "  ════════════════════════════════════════════════════════════ " 
echo -e  "  " 
echo -e  "    [  1 ] CREATE NEW USER "
echo -e  "    [  2 ] GENERATE TRIAL USER "
echo -e  "    [  3 ] EXTEND ACCOUNT ACTIVE"
echo -e  "    [  4 ] DELETE ACTIVE USER"
echo -e  "    [  5 ] CHECK USER LOGIN"
echo -e  "    [  6 ] LIST USER INFORMATION"
echo -e  "    [  7 ] DELETE USER EXPIRED"
echo -e  "    [  8 ] SET AUTO KILL LOGIN"
echo -e  "    [  9 ] DISPLAY USER MULTILOGIN"
echo -e  "    [ 10 ] RESTART SERVICE"
echo -e  "  " 
echo -e  "  ════════════════════════════════════════════════════════════ " 
echo -e  "    ${green}[  0 ] EXIT TO MENU${NC} "
echo -e  "  ════════════════════════════════════════════════════════════ " 
echo -e "\e[1;31m"
read -p "            Please Input Number :  " ssh
echo -e "\e[0m"
case $ssh in
	1)
	usernew
	;;
	2)
	trial
	;;
	3)
	renew
	;;
	4)
	hapus
	;;
	5)
	cek
	;;
	6)
	member
	;;
	7)
	delete
	;;
	8)
	autokill
	;;
	9)
	ceklim
	;;
	10)
	restart
	;;
	0)
    menu
    ;;
	*)
	echo -e "Please enter an correct number"
	sleep 1
	clear
	mssh
	;;
	esac
