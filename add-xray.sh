#!/bin/bash
BGGREEN='\e[1;42'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
BGRED='\e[1;41m'
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
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

# // Vless
vless1="$( cat /etc/xray-mini/vless-direct.json | grep -w port | awk '{print $2}' | sed 's/,//g' )"
vless2="$( cat /etc/xray-mini/vless-splice.json | grep -w port | awk '{print $2}' | sed 's/,//g' )"
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${BGBLUE}                     ┃ XRAYS/VLESS ┃                              ${NC}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray-mini/vless-direct.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "SNI (BUG)     : " sni
read -p "Bug Address (Example: www.google.com) : " sub
dom=$sub.$domain
hariini=`date -d "0 days" +"%d-%m-%Y"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input To Server
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray-mini/vless-direct.json
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-splice","email": "'""$user""'"' /etc/xray-mini/vless-splice.json

vless_direct="vless://${uuid}@${dom}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
vless_splice="vless://${uuid}@${dom}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"

# // Restarting Service
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice
systemctl disable xray-mini@vless-direct
systemctl disable xray-mini@vless-splice
systemctl enable xray-mini@vless-direct
systemctl enable xray-mini@vless-splice
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
systemctl restart xray-mini@vless-direct
systemctl restart xray-mini@vless-splice

clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e " ${BGBLUE}                     ┃ XRAYS/VLESS ┃                              ${NC}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Remarks        : ${user}" | tee -a /etc/log-create-user.log
echo -e "IP Server      : $MYIP" | tee -a /etc/log-create-user.log
echo -e "Domain         : ${domain}" | tee -a /etc/log-create-user.log
echo -e "Subdomain      : ${dom}" | tee -a /etc/log-create-user.log
echo -e "Port Direct    : $vless1" | tee -a /etc/log-create-user.log
echo -e "Port Splice    : $vless1" | tee -a /etc/log-create-user.log
echo -e "id             : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "path           : /xray" | tee -a /etc/log-create-user.log
echo -e "SNI            : $sni" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link Direct    : ${vless_direct}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "LInk Splice    : ${vless_splice}" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Created   : $hariini" | tee -a /etc/log-create-user.log
echo -e "Expired   : $exp" | tee -a /etc/log-create-user.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "[1]  Tambah User Xray Vless"
echo -e "[2]  Xray Vless Menu"
echo -e "[3]  Menu Utama" 
echo -e "[x]  Keluar" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Pilihan :" menu
case $menu in
1) clear ; add-xray ;;
2) clear ; menu-v2ray ;;
3) clear ; menu ;;
x) exit ;;
*) echo  "Pilihan Salah" ;;
esac
echo -e "Script By SQUIDVPN"