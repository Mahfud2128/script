#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

echo -e ""
echo ""
echo -e " ═════════════════════════════════════════════" 
echo -e "             ${green}XRAY VLESS DIRECT${NC}                     "   
echo -e " ═════════════════════════════════════════════" 
echo -e " " 
echo -e "   [ 1 ] CREATE NEW USER"
echo -e "   [ 2 ] DELETE ACTIVE USER"
echo -e "   [ 3 ] EXTEND ACTIVE USER"
echo -e "   [ 4 ] CHECK USER LOGIN"
echo -e " ═════════════════════════════════════════════" 
echo -e "   [ 0 ] EXIT TO MENU"
echo -e " ═════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please select an option :  "  xray
echo -e "\e[0m"
case $xray in
      1)
      add-xtls
      ;;
      2)
      del-xtls
      ;;
      3)
      renew-xtls
      ;;
      4)
      cek-xtls
      ;;
      0)
      menu
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 1
      clear
      mxtls
      ;;
      esac
