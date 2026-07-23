# DHCP Server Configuration

## Overview

This document describes the deployment and configuration of Microsoft DHCP Server in the GreenTech IT Infrastructure Lab.

---

## Server

- Server: GT-DC01
- Operating System: Windows Server 2022
- Role: DHCP Server

---

## DHCP Scope

| Setting | Value |
|---------|-------|
| Scope Name | GreenTech Internal Network |
| Network | 192.168.56.0/24 |
| Start Address | 192.168.56.100 |
| End Address | 192.168.56.200 |
| Subnet Mask | 255.255.255.0 |
| Lease Duration | 8 Days |

---

## Excluded Addresses

- 192.168.56.10 (Domain Controller)
- 192.168.56.20
- 192.168.56.30

---

## DHCP Options

| Option | Value |
|---------|-------|
| DNS Server | 192.168.56.10 |
| DNS Domain | greentech.local |

---

## Validation

The following PowerShell commands were used:

```powershell
Get-DhcpServerv4Scope

Get-DhcpServerInDC

Get-DhcpServerv4OptionValue
```

The DHCP scope was successfully activated and authorized in Active Directory.

---

## Screenshots

- dhcp-manager.png
- dhcp-scope-created.png
- dhcp-scope-validation.png
- dhcp-authorized.png
- dhcp-options.png