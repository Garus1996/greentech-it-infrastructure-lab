# File Server Resource Manager (FSRM)

## Purpose

This document describes the implementation of File Server Resource Manager (FSRM) in the GreenTech IT Infrastructure Lab.

The goal was to demonstrate storage management by configuring quotas and file screening to restrict unwanted file types.

---

## Environment

| Component | Value |
|---|---|
| Server | GT-DC01 |
| Shared Folder | C:\CompanyShares\IT |
| Feature | File Server Resource Manager |

---

## Configuration

### Quota

A quota was created for the shared IT folder.

| Setting | Value |
|---|---|
| Path | C:\CompanyShares\IT |
| Template | 100 MB Limit |

### File Screen

An active file screen was configured.

| Setting | Value |
|---|---|
| Path | C:\CompanyShares\IT |
| Template | Block Audio and Video Files |
| Mode | Active Screening |

---

## Validation

The quota was successfully created for the IT shared folder.

A text file (`Test.txt`) could be created successfully.

An attempt to create an audio file (`Test.mp3`) was blocked, confirming that Active File Screening was working as expected.

---

## Screenshots

```text
screenshots/storage/fsrm-installed.png
screenshots/storage/fsrm-quota-created.png
screenshots/storage/fsrm-file-screen-created.png
screenshots/client-tests/fsrm-file-blocked.png
```

---

## Result

File Server Resource Manager was successfully configured to manage storage resources.

Storage quotas and active file screening were implemented to control disk usage and prevent unwanted file types from being stored on the shared folder.

This demonstrates practical Windows Server storage administration and security management.