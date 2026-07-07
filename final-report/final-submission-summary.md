# GreenTech IT Infrastructure Lab - Final Submission Summary

## Project Title

**GreenTech IT Infrastructure Lab**

## Project Summary

The GreenTech IT Infrastructure Lab is a hands-on portfolio project that simulates a small business IT environment.

The lab demonstrates practical skills in Windows Server administration, Active Directory, Windows client domain joining, Linux server administration, Docker, Nginx, firewall configuration, backup and restore testing, monitoring, incident response, and GitHub documentation.

---

## Systems Built

| System | Hostname | Role |
|---|---|---|
| Windows Server | `GT-DC01` | Domain Controller, DNS, File Server |
| Windows Client | `GT-CLIENT01` | Domain-joined workstation |
| Ubuntu Server | `GT-LINUX01` | Linux server, Docker host, backup host |
| Docker Container | `greentech-nginx` | Internal web service |

---

## Main Features Completed

- Windows Server installed and configured
- Active Directory domain created: `greentech.local`
- Organizational Units created
- Domain users and groups created
- Department file shares configured
- Group-based permissions applied
- Windows 10 client joined to the domain
- Domain login and shared folder access tested
- Ubuntu Server installed and configured
- Static Linux networking configured
- SSH access enabled
- Linux firewall hardening applied using UFW
- Docker installed and tested
- Nginx container deployed
- Custom GreenTech internal web page created
- Backup script created
- Backup restore process tested
- Logging and monitoring checks documented
- Security hardening checklist created
- Incident response and recovery plan created
- Architecture overview created
- Final report created
- CV and LinkedIn project summary created
- Screenshots added as validation evidence

---

## Key Technologies Used

- Windows Server 2022
- Active Directory Domain Services
- Windows 10
- Ubuntu Server 24.04 LTS
- PowerShell
- Bash
- Docker
- Nginx
- UFW Firewall
- VirtualBox
- Git
- GitHub

---

## Security Controls Demonstrated

- Active Directory-based identity management
- Group-based access control
- NTFS and SMB permissions
- Domain authentication
- Linux firewall hardening
- SSH administration
- Docker container deployment
- Read-only bind mount for web content
- Backup and restore validation
- Basic logging and monitoring
- Incident response planning

---

## Validation Evidence

The project includes screenshots showing:

- Active Directory OU structure
- Domain users and groups
- Windows client domain validation
- Shared folder access testing
- Server and client IP configuration
- Linux network validation
- UFW firewall status
- Docker installation validation
- Nginx container validation
- Custom GreenTech web page validation
- Backup script validation
- Backup restore validation
- Logging and monitoring validation

Screenshots are stored in:

```text
screenshots/
```

---

## Documentation Included

| Document | Purpose |
|---|---|
| `README.md` | Main project overview |
| `architecture/architecture-overview.md` | Lab architecture and network diagram |
| `active-directory/` | AD, users, groups, and file share documentation |
| `linux-server/` | Ubuntu setup and hardening |
| `docker-stack/docker-compose-notes.md` | Docker and Nginx documentation |
| `backup-logging/backup-plan.md` | Backup, restore, logging, and monitoring |
| `security-hardening/hardening-checklist.md` | Security controls summary |
| `security-hardening/incident-response-plan.md` | Incident response and recovery plan |
| `final-report/final-project-report.md` | Full final report |
| `final-report/cv-linkedin-summary.md` | CV and LinkedIn summary |
| `final-report/project-review-checklist.md` | Employer-style review checklist |

---

## Final Status

The GreenTech IT Infrastructure Lab is complete as a portfolio project.

The project demonstrates practical hands-on ability across:

- Infrastructure setup
- Windows Server and Active Directory
- Linux administration
- Networking
- Docker
- Firewall hardening
- Backup and restore
- Monitoring
- Incident response
- Technical documentation

---

## Suggested Interview Explanation

This project shows that I can build and document a realistic small business IT environment from scratch.

I configured Windows Server and Active Directory, created users and groups, applied permissions to department file shares, joined a Windows client to the domain, and validated access.

I also configured an Ubuntu Server, enabled SSH, applied firewall hardening, installed Docker, deployed an Nginx container, created a custom internal web page, built a backup script, tested restore, and documented monitoring and incident response procedures.

The project gave me practical experience with troubleshooting, documentation, infrastructure security, and system administration.