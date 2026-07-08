# Account Lockout Testing

## Purpose

This document describes the account lockout validation performed in the GreenTech IT Infrastructure Lab.

The purpose of the test was to confirm that the Active Directory account lockout policy works as expected after repeated failed login attempts.

---

## Environment

| Setting | Value |
|---|---|
| Domain | greentech.local |
| Domain Controller | GT-DC01 |
| Client Machine | GT-CLIENT01 |
| Test User | GREENTECH\jonas.berg |
| Policy Tested | Account Lockout Policy |

---

## Account Lockout Policy

The following policy was configured in the Default Domain Policy:

| Setting | Value |
|---|---|
| Account lockout threshold | 5 invalid logon attempts |
| Account lockout duration | 15 minutes |
| Reset account lockout counter after | 15 minutes |

---

## Test Procedure

The test was performed from the Windows 10 domain-joined client `GT-CLIENT01`.

Steps performed:

1. The user selected `Other user` on the Windows login screen.
2. The test account `GREENTECH\jonas.berg` was entered.
3. An incorrect password was entered multiple times.
4. After 5 failed login attempts, the account lockout policy was triggered.
5. The account lockout status was confirmed on `GT-DC01` using Active Directory Users and Computers.
6. The account was unlocked again after validation.

---

## Validation

The account lockout was confirmed from:

```text
GT-DC01
Active Directory Users and Computers
User: jonas.berg
Account tab