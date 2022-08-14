#!/bin/bash


vmess_req() {
    user=$(tr </dev/urandom -dc a-zA-Z0-9 | head -c8)
    read -p "Expired (days): " masaaktif
    exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
    sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /root/config.json
    cat >/root/$user-tls.json <<EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "who.int",
      "port": "443",
      "id": "$(cat /proc/sys/kernel/random/uuid)",
      "aid": "0",
      "net": "ws",
      "path": "wss://who.int/v2ray",
      "type": "none",
      "host": "$(cat /etc/v2ray/domain)",
      "sni": "who.int",
      "tls": "tls"
}
EOF

    vmesslink1="vmess://$(base64 -w 0 /root/$user-tls.json)"
    echo ""
    echo "Config : $vmesslink1"
    echo -e "Expired   : $exp"
    rm -f /root/$user-tls.json
}

vless_req() {
    user=$(tr </dev/urandom -dc a-zA-Z0-9 | head -c8)

    echo ""
    echo "Config : vless://$(cat /proc/sys/kernel/random/uuid)@who.int:443?path=wss://who.int/v2ray&security=tls&encryption=none&type=ws&host=$(cat /etc/v2ray/domain)&sni=who.int#${user}"
}

protocol_req() {
    echo -e "[1] Vmess"
    echo -e "[2] Vless"
    echo -ne "Protocol ? : "
    read proto
    case "$proto" in
    1)
        vmess_req
        ;;
    2)
        vless_req
        ;;
    *)
        protocol_req
        ;;
    esac
}

protocol_req
