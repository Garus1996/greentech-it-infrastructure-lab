# GreenTech IT Infrastructure Lab - Architecture Overview

## Purpose

This document provides an overview of the GreenTech IT Infrastructure Lab architecture.

The lab was designed to simulate a small business IT environment using Windows Server, Active Directory, a domain-joined Windows client, Ubuntu Server, Docker, file shares, backup, firewall rules, and basic monitoring.

---

## Lab Components

| Component | Hostname | Role | IP Address |
|---|---|---|---|
| Windows Server | `GT-DC01` | Domain Controller, DNS, File Server | `192.168.56.10` |
| Windows Client | `GT-CLIENT01` | Domain-joined workstation | `192.168.56.20` |
| Ubuntu Server | `GT-LINUX01` | Linux server, Docker host, backup host | `192.168.56.30` |
| Docker Container | `greentech-nginx` | Internal web service | Host port `8080` |
| Domain | `greentech.local` | Active Directory domain | N/A |

---

## Network Design

The lab uses an isolated VirtualBox internal network called:

```text
greentech-lab
```

This internal network allows the lab systems to communicate with each other without exposing the environment directly to the physical network.

Linux also has a NAT adapter for:

- Package updates
- Docker image downloads
- SSH access from the Windows host using port forwarding

---

## IP Address Plan

| System | IP Address | Notes |
|---|---|---|
| `GT-DC01` | `192.168.56.10` | Domain Controller and DNS server |
| `GT-CLIENT01` | `192.168.56.20` | Windows client joined to `greentech.local` |
| `GT-LINUX01` | `192.168.56.30` | Ubuntu Server and Docker host |

---

## High-Level Architecture Diagram

```text
                           Physical Windows Host
                    C:\Users\Bruker\Documents\greentech-it-infrastructure-lab
                                      |
                                      |
                              VirtualBox Lab
                                      |
        ----------------------------------------------------------------
        |                                                              |
 Internal Network: greentech-lab                                NAT Adapter
        |                                                              |
        |                                                              |
  ------------------        --------------------        --------------------
  |    GT-DC01      |        |   GT-CLIENT01    |        |   GT-LINUX01     |
  | Windows Server  |        | Windows 10       |        | Ubuntu Server    |
  | 192.168.56.10   |        | 192.168.56.20    |        | 192.168.56.30    |
  |                 |        |                  |        |                  |
  | AD DS           |<------>| Domain joined    |        | Docker Host      |
  | DNS             |        | User testing     |<------>| Nginx Container  |
  | File Shares     |        | Share access     |        | Backup Scripts   |
  ------------------        --------------------        --------------------
          |
          |
   Shared folders:
   \\GT-DC01\HR
   \\GT-DC01\Finance
   \\GT-DC01\Sales
   \\GT-DC01\IT
```

---

## Active Directory Design

The Active Directory domain is:

```text
greentech.local
```

The domain controller is:

```text
GT-DC01
```

Organizational Units were created for:

- Users
- Groups
- Computers
- Service Accounts
- Domain Controllers

Example users:

- `alice.hansen`
- `jonas.berg`
- `sara.nilsen`
- `omar.ali`

Example groups:

- `GG_IT_Admins`
- `GG_HR_Users`
- `GG_Finance_Users`
- `GG_Sales_Users`

---

## File Share Design

Department shares were created on `GT-DC01`.

| Share | Purpose | Access Model |
|---|---|---|
| `\\GT-DC01\HR` | HR department files | HR group access |
| `\\GT-DC01\Finance` | Finance department files | Finance group access |
| `\\GT-DC01\Sales` | Sales department files | Sales group access |
| `\\GT-DC01\IT` | IT administration files | IT admin access |

Access is controlled using Active Directory security groups and NTFS permissions.

---

## Linux Server Design

The Ubuntu Server `GT-LINUX01` provides Linux administration, Docker hosting, backup scripting, and monitoring checks.

Linux server details:

| Setting | Value |
|---|---|
| Hostname | `GT-LINUX01` |
| OS | Ubuntu Server 24.04 LTS |
| Internal IP | `192.168.56.30` |
| NAT adapter | Enabled |
| SSH | Enabled |
| Firewall | UFW enabled |

---

## Docker Design

Docker is installed on `GT-LINUX01`.

The main container is:

```text
greentech-nginx
```

Container purpose:

- Host a custom internal GreenTech web page
- Demonstrate Docker container deployment
- Demonstrate port mapping and firewall configuration

Docker port mapping:

```text
GT-LINUX01:8080 → greentech-nginx:80
```

The internal web page is stored on the Linux host at:

```text
~/greentech-web
```

and mounted into the container at:

```text
/usr/share/nginx/html
```

as read-only content.

---

## Traffic Flow

### Domain Login

```text
GT-CLIENT01
   ↓
GT-DC01
   ↓
greentech.local authentication
```

### File Share Access

```text
GT-CLIENT01
   ↓
\\GT-DC01\DepartmentShare
   ↓
AD group and NTFS permission check
```

### Web Service Access

```text
Admin/User
   ↓
GT-LINUX01:8080
   ↓
Docker port mapping
   ↓
greentech-nginx container:80
   ↓
GreenTech Internal IT Portal
```

### Backup Flow

```text
~/greentech-web
   ↓
backup-greentech-web.sh
   ↓
~/backups/greentech-web-backup-YYYY-MM-DD_HH-MM-SS.tar.gz
   ↓
restore-test validation
```

---

## Security Controls

The lab includes the following security controls:

- Active Directory-based identity management
- Group-based access control
- NTFS permissions on department folders
- Domain-joined Windows client
- Linux UFW firewall
- SSH administration
- Docker container isolation
- Read-only Docker bind mount for web content
- Backup script
- Restore validation
- Basic logging and monitoring checks

---

## Validation Evidence

The lab was validated using:

- `whoami`
- `hostname`
- `nltest /dsgetdc:greentech.local`
- `Test-Path "\\GT-DC01\ShareName"`
- `ipconfig`
- `ip a`
- `ping`
- `docker ps`
- `curl http://localhost:8080`
- `sudo ufw status verbose`
- `tar -tzf`
- `diff`

Screenshots are stored in:

```text
screenshots/
```

---

## Summary

The GreenTech IT Infrastructure Lab demonstrates a realistic small business IT environment with:

- Windows Server and Active Directory
- Department-based file shares
- A domain-joined Windows client
- Ubuntu Server
- Docker-hosted internal web service
- Linux firewall hardening
- Backup and restore validation
- Basic logging and monitoring

This architecture provides a strong foundation for demonstrating junior IT, infrastructure, system administration, and cybersecurity skills.