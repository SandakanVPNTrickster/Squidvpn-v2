#!/bin/bash
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
echo -e "MASUKKAN DOMAIN BARU ATAU TEKAN CTL C UTK EXIT"
echo -e ""
read -p "HOSTANME/DOMAIN: " host
rm -f /var/lib/premium-script/ipvps.conf
rm -f /etc/v2ray/domain
rm -f /etc/xray/domain
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /etc/xray/domain
clear
#recert
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\e[0m'
sleep 1
echo -e "${ORANGE}=============================================${NC}"
echo -e "${BGBLUE} RECERT V2RAY                            ${NC}"
echo -e "${ORANGE}=============================================${NC}"
sleep 1
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop trojan
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice

~/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
echo Done
sleep 0.5
clear
echo -e "${ORANGE}=============================================${NC}"
echo -e "${BGBLUE} PERTUKARAN DOMAIN SELESAI                 ${NC}"
echo -e "${ORANGE}=============================================${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu