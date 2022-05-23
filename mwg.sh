#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'


echo -e ""
echo -e " ══════════════════════════════════════════════" 
echo -e "            ${green}WIREGUARD${NC}                  " 
echo -e " ══════════════════════════════════════════════" 
echo -e " " 
echo -e "   [ 1 ] CREATE NEW USER"
echo -e "   [ 2 ] DELETE ACTIVE USER"
echo -e "   [ 3 ] CHECK USER LOGIN"
echo -e "   [ 4 ] EXTEND ACTIVE USER"
echo -e " ══════════════════════════════════════════════" 
echo -e "   ${green}[ 0 ] EXIT TO MENU${NC} " 
echo -e " ══════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please select an option :  "  wg
echo -e "\e[0m"
case $wg in
    1)
    add-wg
    ;;
    2)
    del-wg
    ;;
    3)
    cek-wg
    ;;
    4)
    renew-wg
    ;;
    0)
    menu
    ;;   
    *)
    echo -e "Please enter an correct number"
    sleep 1
    clear
    mwg
    ;;
    esac
