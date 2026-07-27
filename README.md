# Linux Infrastructure Automation Suite

<p align="center">
  <img src="https://img.shields.io/badge/Platform-RHEL%209-red?style=for-the-badge">
  <img src="https://img.shields.io/badge/Language-Bash-green?style=for-the-badge">
  <img src="https://img.shields.io/badge/AWS-S3-orange?style=for-the-badge">
  <img src="https://img.shields.io/badge/Docker-Containers-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/RHCSA-Project-success?style=for-the-badge">
</p>

---

# Linux Infrastructure Automation Suite

A menu-driven Linux administration toolkit developed on **Red Hat Enterprise Linux 9 (RHEL 9)** to automate common system administration tasks learned during the **Red Hat Certified System Administrator (RHCSA)** training.

The project provides a centralized command-line interface that enables Linux administrators to perform essential infrastructure management tasks efficiently without repeatedly executing long commands manually.

This project demonstrates practical Linux administration, Bash scripting, automation, storage management, networking, security, monitoring, and AWS integration.

---

# Project Motivation

During my RHCSA training, I learned several Linux administration concepts such as:

- User Administration
- Firewall Configuration
- SELinux
- Network Configuration
- SSH Hardening
- Logical Volume Management (LVM)
- NFS & AutoFS
- Docker Container Deployment
- AWS S3 Backup
- System Monitoring
- Performance Optimization

Instead of practicing these topics individually, I developed this unified automation suite that combines all RHCSA concepts into a single interactive application.

---

# Features

## User Management

- Create users
- Delete users
- Modify users
- Reset passwords
- Lock/Unlock accounts
- Manage groups
- View user information

---

## Firewall Configuration

- Enable Firewalld
- Open ports
- Close ports
- Add permanent firewall rules
- Reload firewall configuration
- View active firewall rules

---

## SELinux Configuration

- Check SELinux status
- Enable SELinux
- Disable SELinux
- Switch between Enforcing, Permissive and Disabled modes
- View SELinux policies

---

## Network Configuration

- Display network interfaces
- Configure static IP
- Configure hostname
- Restart networking
- Verify connectivity
- DNS configuration

---

## SSH Configuration

- Configure SSH server
- Change SSH port
- Enable/Disable Root Login
- Restart SSH service
- Verify SSH configuration

---

## Logical Volume Management (LVM)

- Create Physical Volumes
- Create Volume Groups
- Create Logical Volumes
- Extend Logical Volumes
- Resize Filesystems
- Display Storage Information

---

## NFS & AutoFS

- Configure NFS Server
- Configure NFS Client
- Configure AutoFS
- Mount remote directories automatically
- Verify shared storage

---

## Deploy Dockerized Services

- Install Docker
- Start Docker service
- Deploy containers
- Deploy Docker Compose applications
- View running containers
- Stop containers
- Remove containers

---

## AWS S3 Backup

- Compress directories
- Upload backups to AWS S3
- Verify uploaded backups
- Maintain backup logs

---

## System Monitoring

- CPU Usage
- Memory Usage
- Disk Usage
- Running Processes
- Active Services
- Network Status
- System Logs

---

## Performance Tuning

- Kernel Parameters
- System Optimization
- Memory Optimization
- Swappiness Configuration
- Performance Monitoring

---

# Menu

```
========== Linux Infrastructure Automation Suite ==========

1. User Management
2. Firewall Configuration
3. SELinux Configuration
4. Network Configuration
5. SSH Configuration
6. LVM Setup
7. NFS + AutoFS Setup
8. Deploy Dockerized Services
9. Backup to AWS S3
10. System Monitoring
11. Performance Tuning
12. Exit

===========================================================
```

---

# Project Structure

```
linux-infrastructure-automation-suite/

├── menu.sh
├── user_mgmt.sh
├── firewall_config.sh
├── selinux_config.sh
├── network_config.sh
├── ssh_config.sh
├── lvm_setup.sh
├── nfs_autofs.sh
├── service_installer.sh
├── backup_to_s3.sh
├── monitor.sh
├── system_tuning.sh
├── Dockerfile
├── docker-compose.yml
├── logs/
├── screenshots/
└── README.md
```

---

# Technologies Used

- Red Hat Enterprise Linux 9
- Bash Shell Scripting
- Firewalld
- SELinux
- OpenSSH
- LVM
- XFS
- NFS
- AutoFS
- Docker
- Docker Compose
- AWS CLI
- Amazon S3
- Git
- GitHub

---

# Prerequisites

- RHEL 9
- Root or sudo privileges
- Bash
- Git
- Docker
- AWS CLI (for S3 backup)

---

# Installation

Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/linux-infrastructure-automation-suite.git
```

Navigate into the project

```bash
cd linux-infrastructure-automation-suite
```

Make scripts executable

```bash
chmod +x *.sh
```

Run the application

```bash
./menu.sh
```

---

# Skills Demonstrated

- Linux Administration
- RHCSA Practical Skills
- Bash Scripting
- Infrastructure Automation
- System Security
- Storage Management
- Network Administration
- SSH Hardening
- Container Deployment
- AWS Integration
- Performance Optimization
- Monitoring & Troubleshooting



LinkedIn: https://linkedin.com/in/YOUR_LINKEDIN

---

# License

This project is licensed under the MIT License.
