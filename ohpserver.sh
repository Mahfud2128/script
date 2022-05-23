#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);

# installing ohpserver
if [[ -e /usr/bin/ohpserver  ]]; then
echo -e "OHPSERVER ALREADY INSTALL"
sleep 3;clear
else
echo -e "INSTALLING OHPSERVER"
sleep 3;clear
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
unzip ohpserver-linux32.zip
rm *.zip
mv ohpserver /usr/bin/
chmod +x /usr/bin/ohpserver
fi

# adding ohp for ohpserver
if [[ -e /usr/bin/ohp  ]]; then
echo -e "OHP FOR OHPSERVER EXIST BUT WILL BE UPDATE"
sleep 3;clear
rm /usr/bin/ohp
cat> /usr/bin/ohp << END
#!/bin/bash
screen -dmS dropbear ohpserver -port 8090 -proxy $MYIP:3128 -tunnel $MYIP:143
screen -dmS openvpn ohpserver -port 8089 -proxy $MYIP:3128 -tunnel $MYIP:1194
END
chmod +x /usr/bin/ohp
else
echo -e "ADDING OHP FOR OHPSERVER"
sleep 3;clear
cat> /usr/bin/ohp << END
#!/bin/bash
screen -dmS dropbear ohpserver -port 8090 -proxy $MYIP:3128 -tunnel $MYIP:143
screen -dmS openvpn ohpserver -port 8089 -proxy $MYIP:3128 -tunnel $MYIP:1194
END
chmod +x /usr/bin/ohp
fi

# adding ohp service for running
if [[ -e /etc/systemd/system/ohp.service  ]]; then
echo -e "OHP SERVICE ALREADY ADDING"
sleep 3;clear
else
echo -e "ADDING OHP SERVICE FOR RUNNING"
sleep 3;clear
cat> /etc/systemd/system/ohp.service << END
[Unit]
Description=OHP by jinggo
[Service]
Type=forking
ExecStart=/usr/bin/ohp
[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
service ohp start
systemctl enable ohp
fi

echo -e "INSTALLATION OHP HAVE BEEN COMPLETE!!"
echo ""
echo ""
echo "DROPBEAR OHP : 8090" | tee -a log-ohp.txt
echo "OPENVPN OHP : 8089" | tee -a log-ohp.txt
sleep 3;clear

