# Basic Linux Hardening

Basic security hardening was applied to `GT-LINUX01`.

## Hardening Actions Performed

- Updated the package list using `apt update`
- Upgraded installed packages using `apt upgrade`
- Verified SSH access
- Enabled the UFW firewall
- Allowed OpenSSH through the firewall
- Allowed port `8080/tcp` for the internal web service
- Confirmed firewall status

## Commands Used

```bash
sudo apt update
sudo apt upgrade -y
sudo systemctl enable --now ssh
sudo systemctl status ssh
sudo ufw status
sudo ufw allow OpenSSH
sudo ufw allow 8080/tcp
sudo ufw enable
sudo ufw status verbose
```

## Result

The Linux server was successfully updated and protected with a basic firewall configuration.

UFW was enabled with incoming traffic denied by default, while SSH and the internal web service port were allowed.