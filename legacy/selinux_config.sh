#!/bin/bash
STATUS=$(getenforce)
echo "Current SELinux mode: $STATUS"
echo "1. Enforcing"
echo "2. Permissive"
echo "3. Disabled"
read -p "Choose new mode: " opt

case $opt in
  1) sudo setenforce 1; echo "SELinux set to Enforcing";;
  2) sudo setenforce 0; echo "SELinux set to Permissive";;
  3)
    sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
    echo "SELinux will be disabled on next reboot."
    ;;
  *) echo "Invalid option" ;;
esac

