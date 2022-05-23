#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

MYIP=$(wget -qO- icanhazip.com);
echo "Checking Vps"
sleep 2
clear

#Welcome Note
echo -e "============================================="
echo -e " ${green} WELCOME TO REYZ-V4 SCRIPT VERSION 1${NC}"
echo -e "============================================="
sleep 2

#Install Update
echo -e "============================================="
echo -e " ${green} UPDATE && UPGRADE PROCESS${NC}"
echo -e "============================================="
apt -y update 
apt install -y bzip2 gzip coreutils screen curl
sleep 2
clear

# Disable IPv6
echo -e "============================================="
echo -e " ${green} DISABLE IPV6${NC}"
echo -e "============================================="
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
echo -e "net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sleep 2
clear

# Script Access 
MYIP=$(wget -qO- icanhazip.com);

echo -e "${green}CHECKING SCRIPT ACCESS${NC}"
sleep 2
IZIN=$(curl https://raw.githubusercontent.com/jinGGo007/PRIVATE/main/IP/REGIP | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
    echo -e ""
    echo -e "${green}ACCESS GRANTED...${NC}"
    sleep 2
else
	echo -e ""
    echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER${NC}"
    sleep 2
    rm -f setup.sh
    exit 1
fi
clear

# Subdomain Settings
echo -e "============================================="
echo -e "${green}   DOMAIN INPUT${NC} "
echo -e "============================================="
sleep 2
mkdir /etc/xray
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
clear
echo -e ""
echo -e "${green}MASUKKAN DOMAIN ANDA YANG TELAH DI POINT KE IP ANDA${NC}"
read -rp "    Enter your Domain/Host: " -e host
ip=$(wget -qO- ipv4.icanhazip.com)
host_ip=$(ping "${host}" -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
if [[ ${host_ip} == "${ip}" ]]; then
	echo -e ""
	echo -e "${green}HOST/DOMAIN MATCHED..INSTALLATION WILL CONTINUE${NC}"
	echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
    echo "$host" >> /etc/v2ray/domain
    echo "$host" >> /etc/xray/domain
    echo "$host" > /root/domain
	sleep 2
	clear
else
	echo -e "${green}HOST/DOMAIN NOT MATCHED..INSTALLATION WILL TERMINATED${NC}"
	echo -e ""
    rm -f setup.sh
    exit 1
fi
sleep 1

# Install BBR+FQ
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p

#install ssh ovpn
echo -e "============================================="
echo -e " ${green} INSTALLING SSH && OVPN && WS ${NC}"
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
sleep 2
clear

#install ssr
echo -e "============================================="
echo -e " ${green} INSTALLING SHADOWSOCKS R${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/main/SSR/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
sleep 2
clear

#install ss
echo -e "============================================="
echo -e " ${green} INSTALLING SHADOWSOCKS OBFS${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/SS/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
sleep 2
clear

#install wg
echo -e "============================================="
echo -e " ${green} INSTALLING WIREGUARD${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/WG/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
sleep 2
clear

#install v2ray
echo -e "============================================="
echo -e " ${green}  INSTALLING V2RAY${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/V2RAY/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
sleep 2
clear

#install Xray
echo -e "============================================="
echo -e " ${green} INSTALLING XRAY${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/V1/install-xray.sh && chmod +x install-xray.sh && screen -S v2ray ./install-xray.sh
sleep 2
clear

#install ohp
echo -e "============================================="
echo -e " ${green}  INSTALLING OHP${NC} "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/GH-reyz/script/OHP/ohp.sh && chmod +x ohp.sh && ./ohp.sh
sleep 2
clear

rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ohp.sh

#install resolv
apt install resolvconf
systemctl start resolvconf.service
systemctl enable resolvconf.service
echo 'nameserver 8.8.8.8' > /etc/resolvconf/resolv.conf.d/head
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
systemctl restart resolvconf.service

clear
echo " "
echo "Installation Completed!!"
echo " "
echo "========================= REYZ-V4 AUTOSCRIPT VERSION 1 ====================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - SSH WS/OVPN WS          : 2082, 2095"  | tee -a log-install.txt
echo "   - DROPBEAR OHP            : 8010"  | tee -a log-install.txt
echo "   - OPENVPN OHP             : 8000"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 5443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 6443"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 7443"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8443"  | tee -a log-install.txt
echo "   - Trojan                  : 9443"  | tee -a log-install.txt
echo "   - XRAY VMESS TLS          : 2929"  | tee -a log-install.txt
echo "   - XRAY VMESS NON TLS      : 3939"  | tee -a log-install.txt
echo "   - XRAY VLESS TLS          : 4949"  | tee -a log-install.txt
echo "   - XRAY VLESS NON TLS      : 5959"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS         : 6769"  | tee -a log-install.txt
echo "   - XRAY VLESS GRPC         : 6969"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/MALAYSIA (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +8" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Horas/MD"  | tee -a log-install.txt
echo "   - Modded by               : JINGGO007"  | tee -a log-install.txt
echo "   - Telegram                : t.me/jinggo007"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=========================== SCRIPT BY JINGGO007 =========================" | tee -a log-install.txt
echo ""
sleep 1
rm -f setup.sh
read -n 1 -r -s -p $'Press any key to reboot...\n';reboot
