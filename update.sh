#!/bin/bash
# // Update
#By SQUIDVPN
apt-get -y autoremove;
apt upgrade && apt replace -y

echo "Start Update"
sleep 5

# // Download
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-host.sh"
wget -O add-host "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-host.sh"
wget -O system-menu "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/system-menu.sh"
wget -O autoreboot "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/autoreboot.sh"
wget -O add-ws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-ws.sh"
wget -O add-wg "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-wg.sh"
wget -O add-vless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-vless.sh"
wget -O add-xray "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-xray.sh"
wget -O add-tr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renew-tr.sh"
wget -O certv2ray "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/cert.sh"
wget -O about "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/restart.sh"
wget -O speedtest-cli "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/tendang.sh"
wget -O change-port "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-tr.sh"
wget -O port-squid "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-vless.sh"
wget -O port-xray "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-xray.sh"
wget -O wbmn "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/xp.sh"
wget -O menu-v2ray "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-v2ray.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-ssr.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-trojan.sh"
wget -O menu-wg "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-wg.sh"
wget -O update "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/update.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-ssh.sh"
wget -O running "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/running.sh"
wget -O addgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/addgrpc.sh"
wget -O addtrgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/addtrgrpc.sh"
wget -O delgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/delgrpc.sh"
wget -O deltrgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/deltrgrpc.sh"
wget -O menu-grpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/menu-grpc.sh"
wget -O port-trgprc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-trgrpc.sh"
wget -O port-grpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/port-grpc.sh"
wget -O renewgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renewgrpc.sh"
wget -O renewtrgrpc "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/renewtrgrpc.sh"
wget -O server-info "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/server-info.sh"
wget -O limitspeed "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/limitspeed.sh"
wget -O squid "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/maxis/squid.sh"
wget -O add-maxws "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/maxis/add-maxws.sh"
wget -O add-maxvless "https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/maxis/add-maxvless.sh"
chmod +x add-host
chmod +x system-menu
chmod +x autoreboot
chmod +x add-ws
chmod +x add-maxws
chmod +x add-wg
chmod +x add-vless
chmod +x add-maxvless
chmod +x squid
chmod +x add-xray
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x certv2ray
chmod +x running
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest-cli
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x port-xray
chmod +x wbmn
chmod +x xp
chmod +x menu-v2ray
chmod +x menu-ssr
chmod +x menu-trojan
chmod +x menu-wg
chmod +x update
chmod +x menu-ssh
chmod +x addgrpc
chmod +x addtrgrpc
chmod +x delgrpc
chmod +x deltrgrpc
chmod +x menu-grpc
chmod +x port-grpc
chmod +x port-trgrpc
chmod +x renewgrpc
chmod +x renewtrgrpc
chmod +x server-info
chmod +x limitspeed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix Menu"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
