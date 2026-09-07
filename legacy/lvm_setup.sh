#!/bin/bash
echo "---- LVM Setup ----"
read -p "Enter physical volume (e.g. /dev/xvdb): " pv
read -p "Enter volume group name: " vg
read -p "Enter logical volume name: " lv
read -p "Enter size (e.g. 2G): " size
read -p "Enter mount point: " mnt

sudo pvcreate $pv
sudo vgcreate $vg $pv
sudo lvcreate -L $size -n $lv $vg
sudo mkfs.xfs /dev/$vg/$lv
sudo mkdir -p $mnt
echo "/dev/$vg/$lv $mnt xfs defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
df -h | grep $mnt

