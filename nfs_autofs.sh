#!/bin/bash
echo "---- NFS + AutoFS Configuration ----"
read -p "Enter NFS server IP: " srv
read -p "Enter export path (e.g. /mnt/share): " exp
read -p "Enter mount point (e.g. /mnt/nfs): " mnt

sudo yum install -y nfs-utils autofs
sudo mkdir -p $mnt

echo "/- /etc/auto.direct" | sudo tee /etc/auto.master.d/direct.autofs
echo "$mnt -rw,sync $srv:$exp" | sudo tee /etc/auto.direct
sudo systemctl enable --now autofs

echo "AutoFS mounted NFS share at $mnt"

