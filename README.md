# AUTOSCRIPT VPN BY SQUIDVPN : VERSION 2.0

 <h2 align="center">AutoScript Install VPN By SQUIDVPN <img src="https://img.shields.io/badge/Version-1-blue.svg"></h2>


<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p>
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=red"></p>

<p align="center"><img src="https://img.shields.io/badge/Service-OpenSSH-success.svg">  <img src="https://img.shields.io/badge/Service-Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-Privoxy-green.svg">   <img
src="https://img.shields.io/badge/Service-Xray-success.svg">  <img src= "https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan-success.svg">

## Commands : <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=powershell&label=Shell&message=Bash%20Script&color=lightgray">


## Installation

  ```html
  sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl wget tcpdump dsniff grepcidr dnsutils && wget https://raw.githubusercontent.com/SandakanVPNTrickster/Squidvpn-v2/main/setup.sh && chmod +x setup.sh && ./setup.sh

  ```

## Credit :

*   Script by    t.me/SandakanVPNTrickster
```

### Fix Wireguard Not Running
```
 ```
systemctl stop wg-quick@wg0
```
```
apt install sudo lsb-release -y
```
```
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
```
```
sudo apt update -y
```
```
sudo apt -y --no-install-recommends install net-tools iproute2 openresolv dnsutils linux-headers-$(uname -r)
```
```
sudo apt --no-install-recommends install wireguard-tools wireguard-dkms
```
```
systemctl start wg-quick@wg0
```
```
systemctl enable wg-quick@wg0
```
```
### Check Status Wireguards
```
 ```
systemctl status wg-quick@wg0
```
