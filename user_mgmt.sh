#!/bin/bash
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
read -p "Choose: " opt

if [ "$opt" -eq 1 ]; then
    read -p "Enter username: " uname
    sudo useradd $uname && echo "User $uname created."
elif [ "$opt" -eq 2 ]; then
    read -p "Enter username: " uname
    sudo userdel -r $uname && echo "User $uname deleted."
elif [ "$opt" -eq 3 ]; then
    cut -d: -f1 /etc/passwd | tail -n 10
else
    echo "Invalid choice"
fi

