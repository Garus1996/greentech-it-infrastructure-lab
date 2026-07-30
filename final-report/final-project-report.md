# GreenTech IT Infrastructure Lab – Final Project Report

## Executive Summary

The GreenTech IT Infrastructure Lab is a practical portfolio project designed to simulate a small business IT environment.

The project includes Windows Server, Active Directory, a domain-joined Windows client, Ubuntu Server, Docker, networking services, file storage, backup, monitoring, security controls, incident response, and automation.

The environment was designed, configured, tested, secured, and documented as a complete infrastructure lab.

---

## Project Objectives

The main objectives were to:

- Build a functional Windows domain environment
- Configure essential infrastructure services
- Integrate Windows and Linux systems
- Implement access control and security policies
- Configure backup and restore processes
- Deploy internal web services
- Monitor system health and security events
- Automate administrative tasks
- Produce professional technical documentation

---

## Lab Environment

| System | Hostname | Role | IP Address |
|---|---|---|---|
| Windows Server | GT-DC01 | Domain Controller, DNS, DHCP, File Server | 192.168.56.10 |
| Windows Client | GT-CLIENT01 | Domain-joined workstation | 192.168.56.20 |
| Ubuntu Server | GT-LINUX01 | Linux server, Docker host, backup host | 192.168.56.30 |
| Docker Container | greentech-nginx | Internal web service | Port 8080 |

Domain:

```text
greentech.local
```

---

## Windows Infrastructure

The Windows environment included:

- Windows Server 2022
- Active Directory Domain Services
- DNS
- DHCP
- Group Policy
- File services
- NTFS and SMB permissions
- File Server Resource Manager
- Windows Server Backup
- IIS
- WSUS
- Active Directory Certificate Services
- Windows Security Auditing
- Event Viewer monitoring
- Microsoft Defender review
- Windows Firewall administration

---

## Linux and Container Infrastructure

The Linux environment included:

- Ubuntu Server 24.04 LTS
- Static IP configuration
- SSH administration
- System updates
- UFW firewall
- Docker
- Nginx
- Bash scripting
- Backup and restore testing

---

## Automation

PowerShell automation was used to:

- Collect system information
- Retrieve Active Directory users
- Review services
- Export CSV reports
- Monitor disk usage
- Restart services
- Query event logs
- Export security logs
- Generate an HTML server health dashboard

Bash automation was used to create timestamped backups and validate restoration.

---

## Security

Security activities included:

- Password policies
- Account lockout policies
- Group-based access control
- Least-privilege permission configuration
- Windows Firewall review
- Linux firewall configuration
- Windows Security Auditing
- Logon event analysis
- Failed authentication investigation
- Microsoft Defender review
- Server hardening
- Certificate services
- Event log evidence export
- Incident response reporting

---

## Monitoring and Incident Response

Monitoring activities included:

- Windows Application, System, and Security logs
- Event ID filtering
- Failed logon investigation
- Recent system error analysis
- Service monitoring
- Disk and memory monitoring
- Windows update review
- Firewall profile monitoring
- HTML health reporting

A basic incident response workflow was completed by reviewing Defender, investigating authentication events, exporting logs, and documenting findings.

---

## Challenges

Several challenges were encountered during the project:

- Managing networking between isolated and NAT adapters
- Troubleshooting Windows roles and dependencies
- Configuring permissions correctly across SMB and NTFS
- Working with services that behave differently on a Domain Controller
- Handling WSUS initialization and IIS dependencies
- Transferring PowerShell scripts between the host and virtual server
- Filtering large Windows event logs
- Maintaining consistent documentation and screenshots

---

## Lessons Learned

The project improved practical understanding of:

- How Windows infrastructure services depend on each other
- How Active Directory supports identity and access management
- How DNS and DHCP support domain environments
- How permissions should be assigned through security groups
- How monitoring supports troubleshooting and incident response
- How automation improves consistency and efficiency
- How Linux and Windows can operate in the same environment
- How technical documentation supports maintainability and handover

---

## Skills Demonstrated

- Windows Server administration
- Active Directory administration
- DNS and DHCP administration
- Group Policy management
- File server administration
- NTFS and SMB permissions
- PKI and certificate services
- WSUS administration
- IIS administration
- Windows Backup
- Windows security auditing
- Incident response
- Windows Server hardening
- Linux administration
- Docker administration
- Firewall configuration
- PowerShell scripting
- Bash scripting
- Monitoring and reporting
- Git and GitHub
- Technical documentation

---

## Project Outcome

The final environment demonstrates how a small business infrastructure can be designed, deployed, secured, monitored, automated, and documented.

The project provides practical evidence of junior-level skills relevant to:

- IT support
- Infrastructure operations
- Windows administration
- Systems administration
- Cybersecurity operations
- Junior SOC roles
- Cloud and platform support

---

## Future Improvements

Potential future improvements include:

- Centralized logging using Wazuh, Splunk, or Microsoft Sentinel
- Vulnerability scanning
- Docker Compose
- Automated scheduled backups
- Additional Windows clients
- Separate member servers
- Network segmentation
- Microsoft Azure integration
- Microsoft 365 and Intune integration