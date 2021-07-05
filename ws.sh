#!/bin/bash
# Proxy For Edukasi & Imclass
# ==============================

# Getting Proxy Template
wget https://raw.githubusercontent.com/Alamyazid/WS/main/usernew.sh
rm -r /user/bin/usernew
mv usernew.sh /usr/bin/usernew
chmod +x /usr/bin/usernew
wget -q -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/Alamyazid/WS/main/ws.py
chmod +x /usr/local/bin/edu-proxy

# Installing Service
cat > /etc/systemd/system/edu-proxy.service << END
[Unit]
Description=Python Edu Proxy By Gugun Service
Documentation=https://queenssh.me
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-proxy 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-proxy
systemctl restart edu-proxy

clear
