#!/bin/bash
while true; do
  clear
  echo "========= Linux Infrastructure Automation Suite ========="
  echo "1. User Management"
  echo "2. Firewall Configuration"
  echo "3. SELinux Configuration"
  echo "4. Network Configuration"
  echo "5. SSH Configuration"
  echo "6. LVM Setup"
  echo "7. NFS + AutoFS Setup"
  echo "8. Deploy Dockerized Services"
  echo "9. Backup to AWS S3"
  echo "10. System Monitoring"
  echo "11. Performance Tuning"
  echo "12. Exit"
  echo "========================================================="
  read -p "Enter your choice: " opt

  clear
  case $opt in
    1) bash user_mgmt.sh ;;
    2) bash firewall_config.sh ;;
    3) bash selinux_config.sh ;;
    4) bash network_config.sh ;;
    5) bash ssh_config.sh ;;
    6) bash lvm_setup.sh ;;
    7) bash nfs_autofs.sh ;;
    8) bash service_installer.sh ;;
    9) bash backup_to_s3.sh ;;
    10) bash monitor.sh ;;
    11) bash system_tuning.sh ;;
    12) echo "Exiting..."; sleep 1; break ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
  echo
  read -p "Press Enter to return to menu..." pause
done

