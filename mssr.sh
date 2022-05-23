#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -e ""
echo -e " ═════════════════════════════════════════"
echo -e "          ${green}SHADOWSOCKS R${NC}     " 
echo -e " ═════════════════════════════════════════"
echo -e " " 
echo -e "   [ 1 ]  CREATE NEW USER"
echo -e "   [ 2 ]  DELETE ACTIVE USER"
echo -e "   [ 3 ]  EXTEND ACTIVE USER"
echo -e "   [ 4 ]  CHANGE SSR USER INFORMATION"
echo -e " ═════════════════════════════════════════" 
echo -e "   ${green}[ 0 ]  EXIT TO MENU${NC} " 
echo -e " ═════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please Input Number  :  "  ssr
echo -e "\e[0m"
case $ssr in
1)
add-ssr
;;
2)
del-ssr
;;
3)
renew-ssr
;;
4)
ssr
;;
0)
menu
;;
*)
echo -e "Please enter an correct number"
sleep 1
clear
mssr
;;
esac
