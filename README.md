# GreenTech IT Infrastructure Lab

## Project Overview

This project is a hands-on IT infrastructure and cybersecurity lab designed to simulate a small business environment.

The lab includes Windows Server, Active Directory, a domain-joined Windows client, Ubuntu Server, Docker, file shares, firewall hardening, backup scripting, restore testing, and basic monitoring.

The goal of the project is to demonstrate practical junior IT, infrastructure, system administration, and cybersecurity skills in a realistic lab environment.

---

## Lab Environment

| System | Hostname | Role | IP Address |
|---|---|---|---|
| Windows Server | `GT-DC01` | Domain Controller, DNS, File Server | `192.168.56.10` |
| Windows Client | `GT-CLIENT01` | Domain-joined workstation | `192.168.56.20` |
| Ubuntu Server | `GT-LINUX01` | Linux server, Docker host, backup host | `192.168.56.30` |
| Docker Container | `greentech-nginx` | Internal web service | Port `8080` |
| Domain | `greentech.local` | Active Directory domain | N/A |

---

## Technologies Used

- Windows Server 2022
- Active Directory Domain Services
- DNS
- Windows 10 Client
- Ubuntu Server 24.04 LTS
- PowerShell
- Bash
- Docker
- Nginx
- UFW Firewall
- Git and GitHub
- VirtualBox

---

## What Was Built

### 1. Windows Server and Active Directory

- Installed and configured `GT-DC01`
- Created the domain `greentech.local`
- Configured Active Directory Domain Services
- Created organizational units for:
  - Users
  - Groups
  - Computers
  - Service Accounts
  - Domain Controllers
- Created test users and security groups
- Joined `GT-CLIENT01` to the domain
- Validated domain login from the Windows client

### 2. File Shares and Permissions

Department file shares were created on `GT-DC01`:

- `\\GT-DC01\HR`
- `\\GT-DC01\Finance`
- `\\GT-DC01\Sales`
- `\\GT-DC01\IT`

Access was controlled using Active Directory security groups and NTFS permissions.

### 3. Ubuntu Server

- Installed Ubuntu Server 24.04 LTS as `GT-LINUX01`
- Configured static internal IP address `192.168.56.30`
- Enabled SSH access
- Added NAT networking for updates and Docker image downloads
- Applied basic Linux hardening

### 4. Linux Hardening

Basic Linux security hardening included:

- System updates using `apt`
- SSH validation
- UFW firewall activation
- Default deny incoming firewall policy
- Allowed OpenSSH
- Allowed port `8080/tcp` for the internal web service

### 5. Docker and Nginx

- Installed Docker on `GT-LINUX01`
- Tested Docker using the `hello-world` container
- Deployed an Nginx container named `greentech-nginx`
- Hosted a custom internal web page:
  - `GreenTech Internal IT Portal`
- Exposed the web service on port `8080`

### 6. Backup and Restore

- Created a Bash backup script for the GreenTech web files
- Stored backups as timestamped `.tar.gz` archives
- Tested restoring from backup
- Verified restored files using `diff`

### 7. Logging and Monitoring

Basic monitoring checks included:

- System uptime
- Disk usage
- Memory usage
- SSH logs
- Docker logs
- Firewall status

---

## Architecture Overview

```text
                           Physical Windows Host
                                      |
                              VirtualBox Lab
                                      |
        --------------------------------------------------------
        |                                                      |
 Internal Network: greentech-lab                         NAT Adapter
        |                                                      |
  ------------------      --------------------      --------------------
  |    GT-DC01      |      |   GT-CLIENT01    |      |   GT-LINUX01     |
  | Windows Server  |      | Windows 10       |      | Ubuntu Server    |
  | 192.168.56.10   |      | 192.168.56.20    |      | 192.168.56.30    |
  | AD DS / DNS     |<---->| Domain Client    |      | Docker Host      |
  | File Shares     |      | Share Testing    |<---->| Nginx / Backup   |
  ------------------      --------------------      --------------------
```

---

## Project Structure

```text
greentech-it-infrastructure-lab/
│
├── active-directory/
│   ├── ad-setup.md
│   ├── users-and-groups.md
│   └── shared-folder-permissions.md
│
├── architecture/
│   └── architecture-overview.md
│
├── backup-logging/
│   └── backup-plan.md
│
├── docker-stack/
│   └── docker-compose-notes.md
│
├── linux-server/
│   ├── ubuntu-server-setup.md
│   └── linux-hardening.md
│
├── security-hardening/
│   ├── hardening-checklist.md
│   └── incident-response-plan.md
│
├── screenshots/
│   ├── active-directory/
│   ├── client-tests/
│   └── networking/
│
└── README.md
```

---

## Key Validation Commands

### Windows / Active Directory

```powershell
whoami
hostname
nltest /dsgetdc:greentech.local
Test-Path "\\GT-DC01\HR"
Test-Path "\\GT-DC01\Finance"
Test-Path "\\GT-DC01\Sales"
Test-Path "\\GT-DC01\IT"
```

### Linux

```bash
hostname
whoami
ip a
ping -c 4 192.168.56.10
sudo ufw status verbose
```

### Docker

```bash
docker --version
docker ps
curl http://localhost:8080
docker logs greentech-nginx
```

### Backup and Restore

```bash
~/scripts/backup-greentech-web.sh
ls -lh ~/backups
tar -tzf ~/backups/*.tar.gz | head
diff ~/greentech-web/index.html ~/restore-test/home/garus/greentech-web/index.html
```

---

## Documentation

Detailed documentation is available in the following folders:

- [Active Directory setup](active-directory/ad-setup.md)
- [Users and groups](active-directory/users-and-groups.md)
- [Group Policy hardening](active-directory/group-policy-hardening.md)
- [Account lockout testing](active-directory/account-lockout-testing.md)
- [GPO mapped drives](active-directory/gpo-mapped-drives.md)
- [Windows security GPO](active-directory/windows-security-gpo.md)
- [File Server Resource Manager](storage/fsrm-file-screening.md)
- [Windows Server Backup](backup/windows-server-backup.md)
- [Shared folder permissions](active-directory/shared-folder-permissions.md)
- [DNS Management](networking/dns-management.md)
- [Architecture overview](architecture/architecture-overview.md)
- [Ubuntu Server setup](linux-server/ubuntu-server-setup.md)
- [Linux hardening](linux-server/linux-hardening.md)
- [Docker notes](docker-stack/docker-compose-notes.md)
- [Backup and logging](backup-logging/backup-plan.md)
- [Security hardening checklist](security-hardening/hardening-checklist.md)
- [Incident response plan](security-hardening/incident-response-plan.md)
- [CV and LinkedIn summary](final-report/cv-linkedin-summary.md)
- [Final submission summary](final-report/final-submission-summary.md)
---

## Screenshots

Validation screenshots are stored in the `screenshots/` folder.

### Active Directory

The following screenshots show the Active Directory structure, users, and security groups.

![Active Directory OU Structure](screenshots/active-directory/ad-ou-structure.png)

![Active Directory Users](screenshots/active-directory/ad-users.png)

![Active Directory Groups](screenshots/active-directory/ad-groups.png)

### Windows Client and Domain Validation

The following screenshots show the Windows client joined to the domain and validating access to domain resources.

![Client Domain Validation](screenshots/client-tests/client-domain-validation.png)

![Client Shared Folders](screenshots/client-tests/client-shared-folders.png)

![Client Share Access Test](screenshots/client-tests/client-domain-join-share-test.png)

### Linux, Docker, Firewall and Backup

The following screenshots show Linux networking, firewall hardening, Docker validation, Nginx, custom web page, backup, and restore testing.

![Linux Network Validation](screenshots/networking/linux-network-validation.png)

![Linux UFW Firewall Status](screenshots/networking/linux-ufw-firewall-status.png)

![Docker Installation Validation](screenshots/networking/linux-docker-install-validation.png)

![Nginx Container Validation](screenshots/networking/linux-nginx-container-validation.png)

![Custom GreenTech Web Page Validation](screenshots/networking/linux-custom-nginx-webpage-validation.png)

![Linux Backup Script Validation](screenshots/networking/linux-backup-script-validation.png)

![Linux Backup Restore Validation](screenshots/networking/linux-backup-restore-validation.png)

---

## Skills Demonstrated

This project demonstrates practical experience with:

- Windows Server administration
- Active Directory configuration
- Domain user and group management
- File share permissions
- Windows client domain joining
- Linux server administration
- SSH administration
- Firewall configuration
- Docker container deployment
- Nginx web hosting
- Backup scripting
- Restore testing
- Basic logging and monitoring
- Incident response planning
- Git and GitHub documentation

---

## Current Project Status

Completed:

- Windows Server and Active Directory
- Domain-joined Windows client
- Department file shares and permissions
- Ubuntu Server setup
- Linux hardening
- Docker installation
- Nginx internal web service
- Custom internal web page
- Backup script
- Restore validation
- Logging and monitoring checks
- Security hardening checklist
- Incident response plan
- Architecture overview
- Password policy configuration
- Group Policy hardening
- Account lockout testing
- GPO mapped drives
- Windows Security Baseline
- File Server Resource Manager (FSRM)
- Windows Server Backup
- DNS management
- A Record creation
- CNAME alias configuration
- DNS client validation

Planned future improvements:

- Docker Compose
- Automated backups using cron
- Group Policy Objects
- Password policy configuration
- Centralized logging
- Vulnerability scanning

---

## Summary

The GreenTech IT Infrastructure Lab is a practical portfolio project showing how a small business IT environment can be designed, configured, secured, documented, and validated.

The project combines infrastructure, system administration, cybersecurity basics, Linux, Docker, backup, monitoring, and incident response into one complete lab.
