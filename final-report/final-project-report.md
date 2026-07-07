# GreenTech IT Infrastructure Lab - Final Project Report

## 1. Project Overview

The GreenTech IT Infrastructure Lab is a hands-on infrastructure and cybersecurity project designed to simulate a small business IT environment.

The project includes Windows Server, Active Directory, a domain-joined Windows client, Ubuntu Server, Docker, Nginx, file shares, firewall hardening, backup scripting, restore testing, logging, monitoring, and incident response documentation.

The purpose of the project is to demonstrate practical junior IT, infrastructure, system administration, and cybersecurity skills using a realistic lab setup.

---

## 2. Project Objectives

The main objectives of this project were to:

- Build a small business-style IT infrastructure lab.
- Configure a Windows Server domain controller.
- Create an Active Directory domain.
- Manage users, groups, and organizational units.
- Configure department-based shared folders.
- Join a Windows client to the domain.
- Add a Linux server to the lab network.
- Apply basic Linux security hardening.
- Install Docker and deploy an internal web service.
- Create a custom internal GreenTech web page.
- Create and test a backup script.
- Validate backup restore capability.
- Perform basic logging and monitoring checks.
- Create security and incident response documentation.
- Maintain all documentation in GitHub.

---

## 3. Lab Environment

| System | Hostname | Role | IP Address |
|---|---|---|---|
| Windows Server | `GT-DC01` | Domain Controller, DNS, File Server | `192.168.56.10` |
| Windows Client | `GT-CLIENT01` | Domain-joined workstation | `192.168.56.20` |
| Ubuntu Server | `GT-LINUX01` | Linux server, Docker host, backup host | `192.168.56.30` |
| Docker Container | `greentech-nginx` | Internal web service | Port `8080` |
| Domain | `greentech.local` | Active Directory domain | N/A |

The lab was built using Oracle VirtualBox with an isolated internal network called:

```text
greentech-lab
```

---

## 4. Network Architecture

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

The Windows Server and Windows client communicate over the internal network for domain authentication and file share access.

The Ubuntu Server uses the same internal network for lab communication and also has a NAT adapter for package updates, Docker image downloads, and SSH access from the Windows host.

---

## 5. Active Directory Implementation

The Windows Server `GT-DC01` was configured as a domain controller for the domain:

```text
greentech.local
```

Active Directory Domain Services were installed and configured.

Organizational Units were created for:

- Users
- Groups
- Computers
- Service Accounts
- Domain Controllers

Test users were created for different departments:

- `alice.hansen`
- `jonas.berg`
- `sara.nilsen`
- `omar.ali`

Security groups were created using a clear naming structure:

- `GG_IT_Admins`
- `GG_HR_Users`
- `GG_Finance_Users`
- `GG_Sales_Users`

This allowed access to be managed through group membership rather than individual user permissions.

---

## 6. File Share and Permissions

Department shared folders were created on `GT-DC01`.

| Share | Purpose |
|---|---|
| `\\GT-DC01\HR` | HR department files |
| `\\GT-DC01\Finance` | Finance department files |
| `\\GT-DC01\Sales` | Sales department files |
| `\\GT-DC01\IT` | IT administration files |

Permissions were configured using Active Directory security groups and NTFS permissions.

The goal was to apply a basic least privilege model where users only receive access to the folders required for their role.

Access was validated from the domain-joined Windows client.

---

## 7. Windows Client Configuration

A Windows 10 client named `GT-CLIENT01` was installed and configured with the internal IP address:

```text
192.168.56.20
```

The client was joined to the domain:

```text
greentech.local
```

Validation commands included:

```powershell
whoami
hostname
nltest /dsgetdc:greentech.local
Test-Path "\\GT-DC01\HR"
Test-Path "\\GT-DC01\Finance"
Test-Path "\\GT-DC01\Sales"
Test-Path "\\GT-DC01\IT"
```

The client successfully authenticated against the domain controller and accessed the shared folders.

---

## 8. Ubuntu Server Configuration

An Ubuntu Server named `GT-LINUX01` was installed using Ubuntu Server 24.04 LTS.

The server was configured with the internal IP address:

```text
192.168.56.30
```

Network configuration included:

- `enp0s3`: Internal Network, static IP `192.168.56.30/24`
- `enp0s8`: NAT adapter, DHCP enabled

SSH was enabled so the Linux server could be administered from Windows PowerShell.

Validation commands included:

```bash
hostname
whoami
ip a
ping -c 4 192.168.56.10
```

The Linux server successfully communicated with the Windows Server domain controller.

---

## 9. Linux Hardening

Basic Linux hardening was applied to `GT-LINUX01`.

Security actions included:

- Updating package lists
- Upgrading installed packages
- Enabling SSH
- Enabling UFW firewall
- Denying incoming traffic by default
- Allowing OpenSSH
- Allowing port `8080/tcp` for the internal web service

Firewall validation:

```bash
sudo ufw status verbose
```

The firewall was active and allowed only the required inbound services.

---

## 10. Docker and Internal Web Service

Docker was installed on `GT-LINUX01`.

Docker was validated using:

```bash
sudo docker run hello-world
```

An Nginx container was then deployed:

```bash
docker run -d --name greentech-nginx -p 8080:80 nginx
```

The default Nginx page was tested using:

```bash
curl http://localhost:8080
```

After that, a custom internal GreenTech web page was created and mounted into the container.

The final container used:

```bash
docker run -d --name greentech-nginx -p 8080:80 -v ~/greentech-web:/usr/share/nginx/html:ro nginx
```

The custom page was called:

```text
GreenTech Internal IT Portal
```

This showed that Docker could be used to host a lightweight internal web service.

---

## 11. Backup Script

A Bash backup script was created on `GT-LINUX01` to back up the GreenTech web files.

Backup source:

```text
~/greentech-web
```

Backup destination:

```text
~/backups
```

Backup script location:

```text
~/scripts/backup-greentech-web.sh
```

The script creates timestamped `.tar.gz` archive files.

The backup was validated using:

```bash
~/scripts/backup-greentech-web.sh
ls -lh ~/backups
tar -tzf ~/backups/*.tar.gz | head
```

---

## 12. Restore Validation

A restore test was performed to confirm that the backup could actually be used.

The latest backup was extracted into a test restore directory:

```bash
mkdir -p ~/restore-test
LATEST_BACKUP=$(ls -t ~/backups/greentech-web-backup-*.tar.gz | head -1)
tar -xzf "$LATEST_BACKUP" -C ~/restore-test
```

The restored file was compared against the original:

```bash
diff ~/greentech-web/index.html ~/restore-test/home/garus/greentech-web/index.html
```

The validation result confirmed that the restored file matched the original file.

This confirmed that the backup process was not only created, but also tested.

---

## 13. Logging and Monitoring

Basic logging and monitoring checks were performed on `GT-LINUX01`.

Commands used included:

```bash
hostname
uptime
df -h
free -h
sudo journalctl -u ssh --no-pager | tail -20
docker logs greentech-nginx --tail 20
sudo ufw status verbose
```

These checks provided visibility into:

- Server uptime
- Disk usage
- Memory usage
- SSH activity
- Docker container logs
- Firewall status

---

## 14. Security Checklist

A security hardening checklist was created to summarize the controls applied across the lab.

The checklist covered:

- Windows Server and Active Directory
- File share permissions
- Windows client configuration
- Ubuntu Server hardening
- Docker security
- Backup and recovery
- Logging and monitoring
- Future improvements

This provides a clear summary of what was secured and what could be improved later.

---

## 15. Incident Response and Recovery Plan

An incident response and recovery plan was created for the lab.

The plan covered scenarios such as:

- Web service failure
- Firewall blocking access
- Linux server issues
- Backup restore requirements
- Domain user access issues
- Suspicious SSH activity

The plan included investigation commands, containment steps, recovery steps, and documentation requirements.

---

## 16. Validation Evidence

Screenshots were captured throughout the project and stored in the `screenshots/` folder.

Validation evidence includes:

- Active Directory OU structure
- Domain users and groups
- Windows client domain validation
- Shared folder testing
- Linux network validation
- UFW firewall status
- Docker installation
- Nginx container validation
- Custom web page validation
- Backup script validation
- Backup restore validation

---

## 17. Skills Demonstrated

This project demonstrates practical skills in:

- Windows Server administration
- Active Directory setup
- Domain user and group management
- NTFS and SMB permissions
- Windows client domain joining
- PowerShell validation
- Linux server administration
- SSH administration
- Linux firewall configuration
- Docker installation and container management
- Nginx web hosting
- Bash scripting
- Backup and restore testing
- Logging and monitoring
- Incident response planning
- Git and GitHub documentation

---

## 18. Challenges and Lessons Learned

Several realistic troubleshooting situations were encountered during the project.

Examples included:

- Configuring VirtualBox internal networking
- Correcting Linux Netplan YAML indentation
- Solving SSH connectivity and port forwarding issues
- Understanding the difference between Windows PowerShell and Linux SSH sessions
- Testing Docker access without `sudo`
- Validating that backups could actually be restored

These issues made the lab more realistic and improved the practical learning value of the project.

---

## 19. Future Improvements

Future improvements could include:

- Docker Compose for repeatable container deployment
- Scheduled backups using cron
- Group Policy Objects for Windows security settings
- Password policy configuration in Active Directory
- Centralized logging
- Vulnerability scanning
- Additional Linux hardening
- Automated deployment scripts
- A visual network diagram
- A LinkedIn/CV-ready project summary

---

## 20. Conclusion

The GreenTech IT Infrastructure Lab successfully demonstrates a small business-style IT infrastructure environment.

The lab includes identity management, file sharing, Linux administration, Docker hosting, firewall hardening, backup and restore validation, monitoring, and incident response planning.

This project provides practical evidence of junior IT, infrastructure, system administration, and cybersecurity skills.