#!/bin/bash


vmess_req() {
    user=$(tr </dev/urandom -dc a-zA-Z0-9 | head -c8)
    read -p "Domain : " $(cat /etc/v2ray/domain)
    read -p "Uuid   : " $(cat /proc/sys/kernel/random/uuid)
    read -p "path   : " path

    cat >/root/$user-tls.json <<EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "who.int",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "wss://who.int${path}",
      "type": "none",
      "host": "${domain}",
      "sni": "who.int",
      "tls": "tls"
}
EOF

    vmesslink1="vmess://$(base64 -w 0 /root/$user-tls.json)"
    echo ""
    echo "Config : $vmesslink1"
    rm -f /root/$user-tls.json
}

vless_req() {
    user=$(tr </dev/urandom -dc a-zA-Z0-9 | head -c8)
    read -p "Domain : " $(cat /etc/v2ray/domain)
    read -p "Uuid   : " $(cat /proc/sys/kernel/random/uuid)
    read -p "path   : " path

    echo ""
    echo "Config : vless://${uuid}@who.int:443?path=wss://who.int${path}&security=tls&encryption=none&type=ws&host=${domain}&sni=who.int#${user}"
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
