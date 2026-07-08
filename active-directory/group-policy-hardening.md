# Group Policy Hardening

## Purpose

This document describes the Group Policy hardening controls applied in the GreenTech IT Infrastructure Lab.

The goal was to improve the security of the Active Directory environment by configuring password and account lockout policies.

---

## Environment

| Setting | Value |
|---|---|
| Domain | greentech.local |
| Domain Controller | GT-DC01 |
| Policy Edited | Default Domain Policy |
| Tool Used | Group Policy Management |

---

## Password Policy

The following password policy settings were configured:

| Setting | Value | Purpose |
|---|---|---|
| Enforce password history | 5 passwords remembered | Prevents users from quickly reusing old passwords. |
| Maximum password age | 90 days | Requires passwords to be changed periodically. |
| Minimum password age | 1 day | Prevents users from cycling through passwords immediately. |
| Minimum password length | 10 characters | Improves password strength. |
| Password must meet complexity requirements | Enabled | Requires passwords to include complexity requirements. |
| Store passwords using reversible encryption | Disabled | Prevents insecure password storage. |

---

## Account Lockout Policy

The following account lockout policy settings were configured:

| Setting | Value | Purpose |
|---|---|---|
| Account lockout threshold | 5 invalid logon attempts | Locks accounts after repeated failed login attempts. |
| Account lockout duration | 15 minutes | Keeps the account locked for a limited period. |
| Reset account lockout counter after | 15 minutes | Resets failed login counter after the observation window. |

---

## Validation

The policy was updated using:

```powershell
gpupdate /force