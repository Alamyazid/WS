# !/bin/bash
# Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====Informasi SSH Account===="
echo -e "Host: $IP"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "Port SSL: 443"
echo -e "Port Dropbear: 80,143"
echo -e "Port SSH: 22"
echo -e "Port Websocket : 8880"
echo -e "Port Squid: 8000,8080"
echo -e "Host Squid: 55,77,236,132"
echo -e "Config OpenVPN (UDP 1194): http://$IP:81/client.ovpn"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "============================="
echo -e "Payload Websocket : GET / HTTP/1.1[crlf]Host: tunnel.kalimantan-rev.my$echo -e ""
echo -e ""