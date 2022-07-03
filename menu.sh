#!/bin/bash
Yellow='\e[0;33m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
ORANGE='\033[0;36m'
cyan='\e[36m'
NC='\e[0m'
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
echo -e ""
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
name=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | grep $IPVPS | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | grep $IPVPS | awk '{print $3}')
clear
echo -e "${BGBLUE}|P|R|E|M|I|U|M| |V|P|N| |C|O|N|F|I|G| |B|Y| |S|Q|U|I|D|V|P|N|${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$green System Uptime        :$CYAN $uptime $DF( From VPS Booting )"$NC
echo -e "$green ISP NAME             :$CYAN $ISP"$NC
echo -e "$green IP VPS               :$CYAN $IPVPS"$NC
echo -e "$green DOMAIN               :$CYAN $domain"$NC
echo -e "$green City                 :$CYAN $CITY"$NC
echo -e "$green SERVER               :$CYAN $ISP"$NC
echo -e "$green Client Name          :$CYAN $name${NC}"
echo -e "$green Expired Date         :$CYAN $exp${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ MAIN MENU ]                          ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•1) $NC PANEL SSH & OPENVPN         $green (•7) $NC SYSTEM MENU "
echo -e "$green (•2) $NC PANEL WIREGUARDS            $green (•8) $NC SERVER INFORMATION "
echo -e "$green (•3) $NC PANEL VMESS & VLESS         $green (•9) $NC LOG CREATED CONFIG "
echo -e "$green (•4) $NC PANEL TROJAN                $green (10) $NC CHECK USAGE "
echo -e "$green (•5) $NC PANEL SS & SSR              $green (11) $NC REBOOT VPS "
echo -e "$green (•6) $NC PANEL GRPC                  $green (12) $NC CHECK RUNNING SC "
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$cyan Traffic        Today      Yesterday     Month"
echo -e "$cyan Download      $NC $dtoday    $NC $dyest      $NC $dmon"
echo -e "$cyan Upload        $NC $utoday    $NC $uyest      $NC $umon"
echo -e "$cyan Total        $ttoday    $tyest        $tmon"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "                  Premium VPS by @SandakanVPN"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e "[Ctrl + C] For exit from main menu"
echo -e   ""
read -p "Select From Options [1-12 or x] :  " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-v2ray
;;
4)
menu-trojan
;;
5)
menu-ssr
;;
6)
menu-grpc
;;
7)
system-menu
;;
8)
server-info
;;
9)
clear
       cat /etc/log-create-user.log
       read -n 1 -s -r -p "Press any key to back on menu"
       menu
;;
10)
ram
;;
11)
reboot
;;
12)
running
;;
x)
clear
exit
;;
*)
echo " Tolong masukkan nombor yang betul!!"
sleep 2 
menu
;;
esac
