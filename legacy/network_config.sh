#!/bin/bash
echo "---- Network Configuration ----"
echo "1. View current config"
echo "2. Set hostname"
echo "3. Set static IP"
read -p "Choose: " opt

case $opt in
  1) nmcli device show ;;
  2) read -p "Enter hostname: " h; sudo hostnamectl set-hostname $h; echo "Hostname set to $h" ;;
  3)
    read -p "Enter interface (e.g. eth0): " iface
    read -p "Enter IP (e.g. 192.168.1.50/24): " ip
    read -p "Enter gateway: " gw
    sudo nmcli con mod $iface ipv4.addresses $ip ipv4.gateway $gw ipv4.method manual
    sudo nmcli con up $iface
    echo "Static IP configured for $iface"
    ;;
  *) echo "Invalid option" ;;
esac

