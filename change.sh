#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -e ""
echo -e "======================================"
echo -e "               ${green}CHANGE PORT${NC} "
echo -e "======================================"
echo -e ""
echo -e "     [  1 ]  CHANGE PORT STUNNEL4"
echo -e "     [  2 ]  CHANGE PORT OPENVPN"
echo -e "     [  3 ]  CHANGE PORT SQUID"
echo -e "     [  4 ]  CHANGE PORT WIREGUARD"
echo -e "     [  5 ]  CHANGE PORT V2RAY VMESS"
echo -e "     [  6 ]  CHANGE PORT V2RAY VLESS"
echo -e "     [  7 ]  CHANGE PORT TROJAN GFW"
echo -e "     [  8 ]  CHANGE PORT XRAY VMESS"
echo -e "     [  9 ]  CHANGE PORT XRAY VLESS"
echo -e "     [ 10 ]  CHANGE PORT XRAY XTLS"
echo -e "     [ 11 ]  CHANGE PORT XRAY GRPC"
echo -e "======================================"
echo -e "     ${green}[  0 ]  EXIT TO MENU${NC}"
echo -e "======================================"
echo -e "\e[1;31m"
read -p "     Select From Options [1-8 or 0] :  " port
echo -e "\e[0m"
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-squid
;;
4)
port-wg
;;
5)
port-ws
;;
6)
port-vless
;;
7)
port-tr
;;
8)
port-xvmess
;;
9)
port-xvless
;;
10)
port-xtls
;;
11)
port-grpc
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
clear
change
;;
esac
