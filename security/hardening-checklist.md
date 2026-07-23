## GreenTech Lab Security Hardening Checklist

This checklist summarizes the security hardening measures applied across the GreenTech IT Infrastructure Lab.

The purpose of this checklist is to show how basic security controls were applied to the Windows Server, Active Directory, Windows client, Ubuntu Server, Docker service, firewall, and backup process.

---

## 1. Windows Server and Active Directory

| Control | Status | Notes |
|---|---|---|
| Windows Server installed as dedicated domain controller | Completed | `GT-DC01` was configured as the main domain controller. |
| Active Directory domain created | Completed | Domain: `greentech.local`. |
| Organizational Units created | Completed | OUs created for Users, Groups, Computers, Service Accounts, and Domain Controllers. |
| Domain users created | Completed | Test users were created for IT, HR, Finance, and Sales. |
| Security groups created | Completed | Groups created using the `GG_` naming format. |
| Group-based access control used | Completed | Shared folder access was controlled using AD groups. |
| Domain client joined | Completed | `GT-CLIENT01` was joined to the domain. |
| Domain login tested | Completed | Domain user login was validated from the Windows 10 client. |

---

## 2. File Share Security

| Control | Status | Notes |
|---|---|---|
| Department folders created | Completed | HR, Finance, Sales, and IT folders were created. |
| SMB shares created | Completed | Shares were created on `GT-DC01`. |
| NTFS permissions configured | Completed | Folder permissions were assigned using AD security groups. |
| Least privilege access model used | Completed | Users only receive access through their group membership. |
| Share access tested from client | Completed | Access was tested from `GT-CLIENT01`. |

---

## 3. Windows Client Security

| Control | Status | Notes |
|---|---|---|
| Windows client installed | Completed | `GT-CLIENT01` was installed as a domain client. |
| Static IP configured | Completed | Client IP: `192.168.56.20`. |
| Domain DNS configured | Completed | DNS points to `GT-DC01` at `192.168.56.10`. |
| Domain connectivity validated | Completed | `nltest` and shared folder access were tested. |
| Domain user access tested | Completed | `greentech\alice.hansen` was used for validation. |

---

## 4. Ubuntu Server Security

| Control | Status | Notes |
|---|---|---|
| Ubuntu Server installed | Completed | `GT-LINUX01` was installed using Ubuntu Server 24.04 LTS. |
| Static internal IP configured | Completed | Internal IP: `192.168.56.30`. |
| NAT adapter configured | Completed | NAT adapter was added for updates and SSH access. |
| SSH enabled | Completed | SSH was enabled for remote administration. |
| System packages updated | Completed | `apt update` and `apt upgrade` were performed. |
| UFW firewall enabled | Completed | Firewall was enabled on the Linux server. |
| Default incoming traffic denied | Completed | UFW default policy denies incoming traffic. |
| SSH allowed through firewall | Completed | OpenSSH was allowed through UFW. |
| Web service port allowed | Completed | Port `8080/tcp` was allowed for the Nginx container. |

---

## 5. Docker Security

| Control | Status | Notes |
|---|---|---|
| Docker installed | Completed | Docker was installed on `GT-LINUX01`. |
| Docker service enabled | Completed | Docker was enabled and started with systemd. |
| Docker tested with hello-world | Completed | The `hello-world` container was used for validation. |
| Nginx container deployed | Completed | `greentech-nginx` was created using the `nginx` image. |
| Custom web content mounted read-only | Completed | The web folder was mounted using `:ro`. |
| Container port mapping documented | Completed | Host port `8080` maps to container port `80`. |
| Container management commands documented | Completed | Start, stop, restart, logs, and remove commands were documented. |

---

## 6. Backup and Recovery

| Control | Status | Notes |
|---|---|---|
| Backup script created | Completed | A shell script was created to back up the GreenTech web files. |
| Timestamped backup archive created | Completed | Backup files are saved as `.tar.gz` archives. |
| Backup folder created | Completed | Backups are stored in `~/backups`. |
| Restore test performed | Completed | Backup archive was extracted to a restore test folder. |
| Restored file compared with original | Completed | `diff` confirmed that the restored file matched the original. |
| Recovery process documented | Completed | Backup and restore validation were documented. |

---

## 7. Logging and Monitoring

| Control | Status | Notes |
|---|---|---|
| System uptime checked | Completed | `uptime` was used to check server runtime. |
| Disk usage checked | Completed | `df -h` was used to check disk usage. |
| Memory usage checked | Completed | `free -h` was used to check memory usage. |
| SSH logs reviewed | Completed | `journalctl -u ssh` was used to review SSH logs. |
| Docker logs reviewed | Completed | `docker logs greentech-nginx` was used to review container logs. |
| Firewall status reviewed | Completed | `ufw status verbose` was used to confirm firewall rules. |

---

## 8. Areas for Future Improvement

The following controls could be added in a later phase:

| Future Improvement | Purpose |
|---|---|
| Password policy in Active Directory | Enforce password length, complexity, and lockout settings. |
| Group Policy Objects | Apply centralized security settings to domain computers. |
| Disable unused services | Reduce attack surface on Windows and Linux systems. |
| Automatic security updates | Improve patch management. |
| Docker Compose | Manage the web service using a repeatable compose file. |
| Centralized logging | Forward logs to a central logging server. |
| Backup scheduling with cron | Automate the backup script. |
| Restore documentation | Create a formal recovery runbook. |
| Network diagram | Visualize server, client, Linux, Docker, and traffic flow. |
| Vulnerability scanning | Scan systems for common misconfigurations. |

---

## Summary

The GreenTech lab now includes a basic but realistic security foundation:

- Active Directory identity and access management
- Group-based file share permissions
- Domain-joined Windows client
- Hardened Ubuntu Server with UFW firewall
- Docker-based internal web service
- Backup and restore validation
- Basic operational monitoring checks

This checklist provides a high-level overview of the security controls implemented in the lab and identifies areas for future improvement.