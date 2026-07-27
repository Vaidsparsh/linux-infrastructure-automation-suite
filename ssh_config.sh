#!/bin/bash
echo "---- SSH Configuration ----"
read -p "Enter username for SSH setup: " user
sudo mkdir -p /home/$user/.ssh
sudo chmod 700 /home/$user/.ssh
sudo touch /home/$user/.ssh/authorized_keys
sudo chmod 600 /home/$user/.ssh/authorized_keys
echo "SSH directory structure created for $user."

# Optional security hardening
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "Root login disabled and SSH reloaded."

