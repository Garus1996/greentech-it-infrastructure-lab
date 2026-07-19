# Windows Security GPO

## Purpose

This document describes the Windows Security Baseline Group Policy configured in the GreenTech IT Infrastructure Lab.

The purpose was to improve the security of Windows domain clients by applying common security settings through Group Policy.

---

## Environment

| Setting | Value |
|---|---|
| Domain | greentech.local |
| Domain Controller | GT-DC01 |
| Client Machine | GT-CLIENT01 |
| GPO Name | GreenTech Windows Security Baseline |
| Tool Used | Group Policy Management |

---

## Security Settings Configured

The following security controls were configured:

| Setting | Configuration | Purpose |
|---|---|---|
| Windows Defender Firewall | Enabled | Protects client computers from unwanted network traffic |
| Domain Profile | Enabled | Applies firewall protection on the domain network |
| Private Profile | Enabled | Applies firewall protection on private networks |
| Inbound Connections | Block (default) | Blocks unsolicited inbound traffic |
| Outbound Connections | Allow (default) | Allows normal client communication |
| Control Panel Access | Prohibited | Prevents standard users from changing system settings |
| Screen Saver | Enabled | Automatically locks inactive sessions |
| Password Protected Screen Saver | Enabled | Requires user authentication after inactivity |
| Screen Saver Timeout | 900 seconds | Locks the session after 15 minutes |

---

## GPO Configuration Paths

### Windows Firewall

```text
Computer Configuration
Policies
Windows Settings
Security Settings
Windows Defender Firewall with Advanced Security
```

### Control Panel Restriction

```text
User Configuration
Policies
Administrative Templates
Control Panel
```

### Screen Lock Settings

```text
User Configuration
Policies
Administrative Templates
Control Panel
Personalization
```

---

## Validation

The Group Policy was updated using:

```powershell
gpupdate /force
```

The applied policy was verified on the client using:

```powershell
gpresult /r
```

Firewall status was checked using:

```powershell
Get-NetFirewallProfile
```

Control Panel access was tested from the Windows 10 domain client.

---

## Screenshots

The following screenshots were captured during validation:

```text
screenshots/active-directory/gpo-windows-security-baseline.png
screenshots/client-tests/control-panel-blocked-validation.png
screenshots/client-tests/windows-firewall-gpo-validation.png
```

---

## Result

The Windows Security Baseline Group Policy was successfully deployed to the GreenTech Active Directory environment.

The Windows Firewall was enabled, Control Panel access was restricted for users, and automatic screen locking was configured through Group Policy.

These settings improve the overall security of the Windows client environment by enforcing consistent security controls across the domain.