#!/bin/bash
# Ohp Script
# ==========================================
MYIP=$(wget -qO- https://icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

#Update Repository VPS
clear
apt update 
apt-get -y upgrade

#Masukkan port ohp
OHPSSH=8010
OHPOVPN=8000
#Masukkan port proxy
PROXYPORT=3128
#Masukkan port dropbear dan ovpn
SSHPORT=143
OVPNPORT=1194

# Download File Ohp
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
unzip ohpserver-linux32.zip
chmod +x ohpserver
cp ohpserver /usr/local/bin/ohpserver
/bin/rm -rf ohpserver*

#Buat File OpenVPN TCP OHP
cat > /etc/openvpn/client-tcp-ohp.ovpn <<END
# WELCOME TO JINGGO SCIPT

client
dev tun
proto tcp
setenv FRIENDLY_NAME "JINGGO VPN"
remote bug 1194
http-proxy xxxxxxxxx 8000
resolv-retry infinite
route-method exe
auth-user-pass
auth-nocache
nobind
persist-key
persist-tun
cipher none
ncp-disable
auth none
comp-lzo
verb 3

END

sed -i $MYIP2 /etc/openvpn/client-tcp-ohp.ovpn;

# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/client-tcp-ohp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-ohp.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ohp.ovpn
cp /etc/openvpn/client-tcp-ohp.ovpn /home/vps/public_html/client-tcp-ohp.ovpn
clear
cd

# Installing Service
# Dropbear OHP 
cat > /etc/systemd/system/dropbear-ohp.service << END
[Unit]]
Description=Dropbear OHP Service by jinggo007
Documentation=https://t.me/jinggo007
After=network.target nss-lookup.target

[Service]
ExecStart=/usr/local/bin/ohpserver -port $OHPSSH -proxy $MYIP:$PROXYPORT -tunnel $MYIP:$SSHPORT
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# OpenVPN OHP 
cat > /etc/systemd/system/openvpn-ohp.service << END
[Unit]]
Description=OpenVPN OHP Service by jinggo007
Documentation=https://t.me/jinggo007
After=network.target nss-lookup.target

[Service]
ExecStart=/usr/local/bin/ohpserver -port $OHPOVPN -proxy $MYIP:$PROXYPORT -tunnel $MYIP:$OVPNPORT 
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable dropbear-ohp.service
systemctl start dropbear-ohp.service
systemctl restart dropbear-ohp.service
systemctl enable openvpn-ohp.service
systemctl start openvpn-ohp.service
systemctl restart openvpn-ohp.service
sleep 2
clear
echo -e "INSTALLATION OHP HAVE BEEN COMPLETE!!"
echo ""
echo ""
echo "DROPBEAR OHP : $OHPSSH" 
echo "OPENVPN OHP : $OHPOVPN" 
sleep 2
cd
rm -f /root/ohp.sh
