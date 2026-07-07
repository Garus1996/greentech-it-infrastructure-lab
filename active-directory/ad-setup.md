# Active Directory Setup

## Server VM

| Setting | Value |
|---|---|
| VM Name | GT-DC01 |
| Operating System | Windows Server 2022 Standard Evaluation Desktop Experience |
| Role | Planned Domain Controller |
| RAM | 4096 MB |
| CPU | 2 vCPU |
| Disk | 60 GB |
| Network | NAT during installation |

## Installation Notes

Windows Server 2022 Standard Evaluation with Desktop Experience was installed in VirtualBox.

The server was configured with:
- Static IP address
- Server name: GT-DC01
- Active Directory Domain Services
- Domain: greentech.local
- DNS role

## Current Status

Windows Server installation completed successfully and Server Manager opened.