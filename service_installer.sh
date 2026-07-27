#!/bin/bash
echo "===== Service Installer ====="
echo "1. Deploy Apache Web Server"
echo "2. Deploy MariaDB Database"
echo "3. Stop All Services"
echo "4. Remove All Services"
read -p "Choose: " opt

if [ "$opt" -eq 1 ]; then
    docker run -d --name webserver -p 80:80 httpd
    echo "Apache Web Server deployed on port 80."
elif [ "$opt" -eq 2 ]; then
    docker run -d --name dbserver -e MYSQL_ROOT_PASSWORD=redhat -p 3306:3306 mariadb
    echo "MariaDB deployed on port 3306."
elif [ "$opt" -eq 3 ]; then
    docker stop webserver dbserver
    echo "Services stopped."
elif [ "$opt" -eq 4 ]; then
    docker rm -f webserver dbserver
    echo "Services removed."
else
    echo "Invalid choice."
fi

