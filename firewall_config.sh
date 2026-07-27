#!/bin/bash
echo "1. Allow HTTP (port 80)"
echo "2. Allow SSH"
echo "3. Block HTTP"
read -p "Choose: " opt

if [ "$opt" -eq 1 ]; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload
    echo "HTTP allowed."
elif [ "$opt" -eq 2 ]; then
    sudo firewall-cmd --permanent --add-service=ssh
    sudo firewall-cmd --reload
    echo "SSH allowed."
elif [ "$opt" -eq 3 ]; then
    sudo firewall-cmd --permanent --remove-service=http
    sudo firewall-cmd --reload
    echo "HTTP blocked."
else
    echo "Invalid choice."
fi

