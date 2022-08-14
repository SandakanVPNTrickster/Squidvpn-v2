#!/bin/bash

echo -e  " ═══════════════════════════════════════ "
echo -e  " ${green}           MAXIS CONFIG MENU${NC} "
echo -e  " ═══════════════════════════════════════ "
echo -e  " [ 1 ] VMESS WS TLS"
echo -e  " [ 2 ] VLESS WS TLS"
echo -e  "  "
echo -e "\e[1;31m"
read -p  "     Please select an option :  " menu
echo -e "\e[0m"
 case $menu in
   1)
   add-maxws
   ;;
   2)
   add-maxvless
   ;;
   0)
   sleep 0.5
   clear
   menu
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   menu
   ;;
   esac