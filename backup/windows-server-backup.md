# Windows Server Backup

## Purpose

This document describes the implementation of Windows Server Backup in the GreenTech IT Infrastructure Lab.

The objective was to configure and verify a manual backup of the Windows Server operating system and System State using a dedicated backup disk.

---

## Environment

| Component | Value |
|---|---|
| Server | GT-DC01 |
| Backup Tool | Windows Server Backup |
| Backup Disk | E:\ |
| Backup Type | Backup Once |
| Configuration | Custom |

---

## Installation

Windows Server Backup was installed through Server Manager using the Windows Features wizard.

Navigation:

```
Server Manager
→ Manage
→ Add Roles and Features
→ Features
→ Windows Server Backup
```

---

## Backup Configuration

The following items were included in the backup:

- System State
- Local Disk (C:)

Backup destination:

- Local Drive (E:)
- Volume Label: Backup

---

## Validation

A manual backup was successfully completed.

Windows Server Backup reported that the backup finished successfully without errors.

---

## Screenshots

```text
screenshots/backup/windows-server-backup-installed.png
screenshots/backup/backup-running.png
screenshots/backup/backup-completed.png
```

---

## Result

Windows Server Backup was successfully installed and configured.

A dedicated backup disk was created using VirtualBox and formatted as NTFS before being used as the backup destination.

The server backup completed successfully, demonstrating the ability to protect and recover critical server data.
