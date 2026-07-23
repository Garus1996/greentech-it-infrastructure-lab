# GreenTech Incident Response and Recovery Plan

## Purpose

This document describes a basic incident response and recovery plan for the GreenTech IT Infrastructure Lab.

The purpose of the plan is to show how common security or operational incidents could be identified, contained, investigated, and recovered from in a small business IT environment.

---

## Lab Environment

The GreenTech lab includes:

- Domain Controller: `GT-DC01`
- Domain: `greentech.local`
- Windows Client: `GT-CLIENT01`
- Linux Server: `GT-LINUX01`
- Docker Web Service: `greentech-nginx`
- Internal Web Page: `GreenTech Internal IT Portal`
- Backup Location: `~/backups`
- Firewall: UFW on `GT-LINUX01`

---

## Incident Response Process

The response process follows these basic phases:

1. Identification
2. Containment
3. Investigation
4. Recovery
5. Documentation
6. Lessons learned

---

## 1. Identification

The first step is to confirm whether an incident or service issue is happening.

Useful checks:

```bash
hostname
uptime
df -h
free -h
sudo ufw status verbose
docker ps
docker logs greentech-nginx --tail 50
sudo journalctl -u ssh --no-pager | tail -50
```

Windows checks:

```powershell
whoami
hostname
nltest /dsgetdc:greentech.local
Test-Path "\\GT-DC01\HR"
Test-Path "\\GT-DC01\Finance"
Test-Path "\\GT-DC01\Sales"
Test-Path "\\GT-DC01\IT"
```

---

## 2. Scenario: Web Service Is Down

### Symptoms

- The internal GreenTech web page does not respond.
- `curl http://localhost:8080` fails.
- The Docker container is stopped or missing.

### Investigation

Run on `GT-LINUX01`:

```bash
docker ps
docker ps -a
docker logs greentech-nginx --tail 50
sudo ufw status verbose
curl http://localhost:8080
```

### Recovery Steps

If the container is stopped:

```bash
docker start greentech-nginx
```

If the container needs to be restarted:

```bash
docker restart greentech-nginx
```

If the container is broken, recreate it:

```bash
docker rm greentech-nginx
docker run -d --name greentech-nginx -p 8080:80 -v ~/greentech-web:/usr/share/nginx/html:ro nginx
```

Validate:

```bash
docker ps
curl http://localhost:8080
```

Expected result:

```text
GreenTech Internal IT Portal
```

---

## 3. Scenario: Firewall Blocks Web Access

### Symptoms

- Nginx container is running.
- Local curl may work, but external access to port `8080` fails.
- UFW does not show port `8080/tcp` as allowed.

### Investigation

```bash
sudo ufw status verbose
docker ps
```

### Recovery Steps

Allow port `8080/tcp`:

```bash
sudo ufw allow 8080/tcp
sudo ufw status verbose
```

Validate:

```bash
curl http://localhost:8080
```

---

## 4. Scenario: Linux Server Issue

### Symptoms

- SSH is unavailable.
- Server is slow or unresponsive.
- Disk or memory usage is high.

### Investigation

```bash
uptime
df -h
free -h
sudo systemctl status ssh
sudo journalctl -xe --no-pager | tail -50
```

### Recovery Steps

Restart SSH if needed:

```bash
sudo systemctl enable --now ssh
sudo systemctl restart ssh
```

Check disk usage:

```bash
df -h
```

Check running containers:

```bash
docker ps
```

If needed, restart the Linux server:

```bash
sudo reboot
```

---

## 5. Scenario: Backup Restore Required

### Symptoms

- The internal web page files are deleted, damaged, or changed incorrectly.
- `~/greentech-web/index.html` is missing or incorrect.

### Investigation

```bash
ls -lh ~/greentech-web
ls -lh ~/backups
```

### Recovery Steps

Create a restore test folder:

```bash
mkdir -p ~/restore-test
```

Find the latest backup:

```bash
LATEST_BACKUP=$(ls -t ~/backups/greentech-web-backup-*.tar.gz | head -1)
echo $LATEST_BACKUP
```

Extract the backup:

```bash
tar -xzf "$LATEST_BACKUP" -C ~/restore-test
```

Verify restored files:

```bash
find ~/restore-test -type f
```

Compare restored file with current file if the original still exists:

```bash
diff ~/greentech-web/index.html ~/restore-test/home/garus/greentech-web/index.html
```

Restore the web file if needed:

```bash
cp ~/restore-test/home/garus/greentech-web/index.html ~/greentech-web/index.html
```

Restart the web container:

```bash
docker restart greentech-nginx
curl http://localhost:8080
```

---

## 6. Scenario: Domain User Access Issue

### Symptoms

- A domain user cannot access a shared folder.
- `Test-Path "\\GT-DC01\ShareName"` returns `False`.
- User receives access denied.

### Investigation on Windows Client

```powershell
whoami
hostname
nltest /dsgetdc:greentech.local
Test-Path "\\GT-DC01\HR"
Test-Path "\\GT-DC01\Finance"
Test-Path "\\GT-DC01\Sales"
Test-Path "\\GT-DC01\IT"
```

### Investigation on Domain Controller

Check:

- User account exists
- User is in the correct AD group
- Group has correct NTFS permissions
- Share exists on `GT-DC01`

Example groups:

- `GG_IT_Admins`
- `GG_HR_Users`
- `GG_Finance_Users`
- `GG_Sales_Users`

### Recovery Steps

- Add the user to the correct AD security group.
- Confirm NTFS permissions on the department folder.
- Confirm SMB share permissions.
- Ask the user to sign out and sign in again.
- Retest access from `GT-CLIENT01`.

---

## 7. Scenario: Suspicious SSH Activity

### Symptoms

- Unexpected SSH login attempts.
- Repeated failed logins.
- Unknown source IP addresses in logs.

### Investigation

```bash
sudo journalctl -u ssh --no-pager | tail -100
```

Check firewall:

```bash
sudo ufw status verbose
```

### Containment

If suspicious activity is detected:

- Confirm whether the login was expected.
- Change the affected user password.
- Review SSH access.
- Consider restricting SSH to trusted IP ranges.
- Keep UFW enabled.

### Recovery

Restart SSH after configuration changes:

```bash
sudo systemctl restart ssh
```

Validate SSH status:

```bash
sudo systemctl status ssh
```

---

## 8. Documentation Requirements

For each incident, record:

- Date and time
- Affected system
- Symptoms
- Commands used for investigation
- Root cause if known
- Recovery steps performed
- Final validation result
- Lessons learned

Example incident log entry:

```text
Date:
System:
Issue:
Impact:
Investigation:
Recovery action:
Validation:
Lessons learned:
```

---

## 9. Lessons Learned

The GreenTech lab shows that even a small environment benefits from:

- Clear documentation
- Tested backups
- Firewall rules
- Service validation commands
- Centralized user and group management
- Basic monitoring checks
- Repeatable recovery steps

---

## Summary

This incident response and recovery plan provides a basic operational process for handling common issues in the GreenTech lab.

The plan covers web service failure, firewall issues, Linux server problems, backup restore, domain user access problems, and suspicious SSH activity.