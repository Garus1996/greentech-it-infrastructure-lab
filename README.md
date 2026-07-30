# GreenTech IT Infrastructure Lab

## Project Overview

A hands-on infrastructure and cybersecurity portfolio project simulating the design, deployment, administration, security, monitoring, and documentation of a small business IT environment.

The lab combines Windows Server, Active Directory, Windows client administration, Ubuntu Server, Docker, networking, backup, monitoring, incident response, and PowerShell automation.

## Key Features

- Windows Server 2022 domain environment
- Active Directory users, groups, organizational units, and policies
- DNS and DHCP infrastructure
- Domain-joined Windows client
- Department file shares with group-based access control
- Windows Server Backup and restore validation
- IIS internal web server
- WSUS update management
- Active Directory Certificate Services and PKI
- Windows security auditing and event monitoring
- Windows Server hardening
- Incident response investigation
- Ubuntu Server with SSH and UFW
- Docker and Nginx container deployment
- Bash backup automation
- PowerShell administration and HTML health reporting

## Architecture

The environment was deployed in VirtualBox using an isolated internal network.

```text
                         Physical Windows Host
                                  |
                             VirtualBox
                                  |
                       greentech-lab Network
                                  |
          ------------------------------------------------
          |                      |                       |
      GT-DC01               GT-CLIENT01              GT-LINUX01
 Windows Server 2022         Windows 10          Ubuntu Server 24.04
 192.168.56.10              192.168.56.20        192.168.56.30
          |                      |                       |
 AD DS / DNS / DHCP       Domain Client          Docker / Nginx
 File Server / IIS        Share Testing          Backup / SSH / UFW
 WSUS / AD CS

---

## Lab Environment

| System | Hostname | Role | IP Address |
|---|---|---|---|
| Windows Server | `GT-DC01` | Domain Controller, DNS, DHCP, File Server | `192.168.56.10` |
| Windows Client | `GT-CLIENT01` | Domain-joined workstation | `192.168.56.20` |
| Ubuntu Server | `GT-LINUX01` | Linux server, Docker host, backup host | `192.168.56.30` |
| Docker Container | `greentech-nginx` | Internal web service | Port `8080` |
| Domain | `greentech.local` | Active Directory domain | N/A |

---

## Technologies Used

### Windows Infrastructure

- Windows Server 2022
- Active Directory Domain Services (AD DS)
- DNS
- DHCP
- Group Policy
- Windows File Services
- File Server Resource Manager (FSRM)
- Windows Server Backup
- Internet Information Services (IIS)
- Windows Security Auditing
- Windows Server Update Services
- Windows Internal Database
- Active Directory Certificate Services (AD CS)
- Public Key Infrastructure (PKI)
- Group Policy Management
- Group Policy Objects (GPO)
- Password Policies
- Account Lockout Policies
- Windows File Server
- SMB Shares
- NTFS Permissions
- Share Permissions
- Active Directory Security Groups
- Group-Based Access Control
- PowerShell Administration
- PowerShell Automation
- Active Directory PowerShell
- Windows Service Management
- CSV Report Generation

### Linux Services

- Ubuntu Server 24.04 LTS
- Docker
- Nginx
- UFW Firewall

### Administration & Automation

- Windows 10 Client
- PowerShell
- Bash
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

### 2. Automation and Monitoring

PowerShell and Bash were used to automate administrative and operational tasks.

Key automation activities included:

- Retrieving system information
- Listing Active Directory users
- Reviewing Windows services
- Exporting CSV system reports
- Monitoring disk usage
- Restarting services
- Querying Windows Event Logs
- Exporting Security logs
- Generating an HTML Server Health Dashboard
- Creating timestamped Linux backups
- Testing backup restoration

### 3. Security Implementation

Security controls implemented and reviewed during the project included:

- Password and account lockout policies
- Group-based access control
- NTFS and SMB permissions
- Windows Firewall configuration
- UFW firewall configuration
- Windows Security Auditing
- Successful and failed logon monitoring
- Microsoft Defender status and configuration review
- Server hardening checks
- PKI and certificate services
- Event log export for evidence preservation
- Basic incident response documentation
- Linux system hardening

### 4. File Shares and Permissions

Department file shares were created on `GT-DC01`:

- `\\GT-DC01\HR`
- `\\GT-DC01\Finance`
- `\\GT-DC01\Sales`
- `\\GT-DC01\IT`

Access was controlled using Active Directory security groups and NTFS permissions.

### 5. DHCP Server

- Installed the DHCP Server role
- Created an IPv4 scope for the internal lab network
- Configured address exclusions
- Configured DNS and domain options
- Authorized the DHCP server in Active Directory
- Validated DHCP functionality using PowerShell

### 6. Ubuntu Server

- Installed Ubuntu Server 24.04 LTS as `GT-LINUX01`
- Configured static internal IP address `192.168.56.30`
- Enabled SSH access
- Added NAT networking for updates and Docker image downloads
- Applied basic Linux hardening

### 7. Linux Hardening

Basic Linux security hardening included:

- System updates using `apt`
- SSH validation
- UFW firewall activation
- Default deny incoming firewall policy
- Allowed OpenSSH
- Allowed port `8080/tcp` for the internal web service

### 8. Docker and Nginx

- Installed Docker on `GT-LINUX01`
- Tested Docker using the `hello-world` container
- Deployed an Nginx container named `greentech-nginx`
- Hosted a custom internal web page:
  - `GreenTech Internal IT Portal`
- Exposed the web service on port `8080`

### 9. File Server Resource Manager (FSRM)

- Installed File Server Resource Manager (FSRM)
- Configured storage quotas
- Created file screening rules
- Blocked prohibited file types
- Validated quota and file screening functionality

### 10. Windows Server Backup

- Installed Windows Server Backup
- Added a dedicated backup disk
- Configured scheduled backups
- Performed a successful backup
- Verified backup completion

### 11. IIS Internal Web Server

- Installed Internet Information Services (IIS)
- Created a custom internal web page
- Configured the internal DNS name `intranet.greentech.local`
- Mapped the DNS record to `192.168.56.10`
- Validated website access from a domain-joined Windows client

### 12. Backup and Restore

- Created a Bash backup script for the GreenTech web files
- Stored backups as timestamped `.tar.gz` archives
- Tested restoring from backup
- Verified restored files using `diff`



### 13. Logging and Monitoring

Basic monitoring checks included:

- System uptime
- Disk usage
- Memory usage
- SSH logs
- Docker logs
- Firewall status

---



---

## Project Structure

```text
greentech-it-infrastructure-lab/
│
├── active-directory/
├── architecture/
├── backup/
├── backup-logging/
├── docker/
├── final-report/
├── linux/
├── networking/
├── security/
├── storage/
├── screenshots/
│   ├── active-directory/
│   ├── backup/
│   ├── client-tests/
│   ├── dhcp/
│   ├── dns/
│   ├── linux/
│   ├── networking/
│   └── storage/
│
└── README.md
```
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

### Backup

```bash
~/scripts/backup-greentech-web.sh
ls -lh ~/backups
tar -tzf ~/backups/*.tar.gz | head
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
- [DHCP Server](networking/dhcp-server.md)
- [Architecture overview](architecture/architecture-overview.md)
- [Ubuntu Server setup](linux/ubuntu-server-setup.md)
- [Linux hardening](linux/linux-hardening.md)
- [Docker notes](docker/docker-compose-notes.md)
- [Backup and logging](backup-logging/backup-plan.md)
- [Security hardening checklist](security/hardening-checklist.md)
- [Incident response plan](security/incident-response-plan.md)
- [CV and LinkedIn summary](final-report/cv-linkedin-summary.md)
- [Final submission summary](final-report/final-submission-summary.md)
- [IIS Internal Web Server](windows-services/iis-internal-web-server.md)
- [Windows Auditing and Event Logs](security/windows-auditing-event-logs.md)
- [Windows Server Update Services](windows-services/wsus-server.md)
- [Active Directory Certificate Services](windows-services/ad-certificate-services.md)
- [Group Policy Management](windows-services/group-policy-management.md)
- [Windows File Server and SMB Shares](windows-services/file-server.md)
- [PowerShell Administration and Automation](windows-services/powershell-administration.md)
- [Windows Event Logs and Monitoring](windows-services/windows-event-monitoring.md)
- [Windows Server Hardening](windows-services/windows-server-hardening.md)
- [Windows Defender and Incident Response](windows-services/incident-response.md)
- [Server Health Dashboard](windows-services/server-health-dashboard.md)
- [Final Project Report](final-report/final-project-report.md)
- [Lessons Learned](final-report/lessons-learned.md)
---

## Screenshots

Validation screenshots for each lab module are available in the `screenshots/` directory.

Each documentation page contains the relevant screenshots demonstrating the completed configuration, validation, and testing steps.



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
- DHCP administration
- DNS administration
- Group Policy management
- File Server Resource Manager (FSRM)
- Windows Server Backup
- NTFS permission management
- IIS installation and configuration
- Internal web server administration
- Internal DNS web service mapping
- Windows Event Logging
- Security Auditing
- Event Viewer
- PowerShell Log Analysis
- Centralized Windows update management
- WSUS administration
- Windows Internal Database troubleshooting
- IIS service validation
- PowerShell network testing
- Security Policy Administration
- Password Policy Configuration
- Account Lockout Configuration
- GPO Deployment
- Group Policy Troubleshooting
- Windows Event Monitoring
- Event Log Analysis
- PowerShell Event Logs
- Windows Monitoring
- Windows Server Hardening
- Windows Firewall Administration
- Microsoft Defender
- Windows Update Verification
- Windows Service Hardening
- Windows Incident Response
- Authentication Investigation
- Security Event Analysis
- Evidence Collection
- Server Health Monitoring
- HTML Dashboard Generation
- Operational Reporting
- Infrastructure Monitoring
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
- DHCP Scope Configuration
- DHCP Authorization
- DHCP Client Validation
- Storage Quotas
- File Screening
- IIS Internal Web Server
- Internal DNS website record
- Client web access validation
- Windows Security Auditing
- Event Log Monitoring
- Failed Logon Validation
- WSUS role installation
- WSUS database initialization
- WSUS IIS configuration
- WSUS service and port validation
- Active Directory Certificate Services

## Future Improvements

- Centralized logging with Wazuh, Splunk, or Microsoft Sentinel
- Vulnerability scanning
- Docker Compose
- Scheduled backup automation
- Additional Windows member server
- Network segmentation
- Azure integration
- Microsoft 365 and Intune

## Project Outcomes

During this project, I designed, deployed, secured, monitored, automated, and documented a complete small business IT environment.

The project demonstrates practical experience across Windows Server, Active Directory, Linux, Docker, networking, security, backup, monitoring, incident response, and PowerShell automation.

---

## Summary

The GreenTech IT Infrastructure Lab is a practical portfolio project showing how a small business IT environment can be designed, configured, secured, documented, and validated.

The project combines infrastructure, system administration, cybersecurity basics, Linux, Docker, backup, monitoring, and incident response into one complete lab.
