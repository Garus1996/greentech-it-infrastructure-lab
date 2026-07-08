# GPO Mapped Drives

## Purpose

This document describes the Group Policy mapped drive configuration used in the GreenTech IT Infrastructure Lab.

The purpose was to automatically map department file shares for domain users through Group Policy.

---

## Environment

| Setting | Value |
|---|---|
| Domain | greentech.local |
| Domain Controller | GT-DC01 |
| Client Machine | GT-CLIENT01 |
| GPO Name | GreenTech Mapped Drives |
| Tool Used | Group Policy Management |

---

## File Shares Mapped

| Drive Letter | Share Path | Label |
|---|---|---|
| H: | `\\GT-DC01\HR` | HR Share |
| F: | `\\GT-DC01\Finance` | Finance Share |
| S: | `\\GT-DC01\Sales` | Sales Share |
| I: | `\\GT-DC01\IT` | IT Share |

---

## GPO Configuration Path

The mapped drives were configured using:

```text
User Configuration
Preferences
Windows Settings
Drive Maps