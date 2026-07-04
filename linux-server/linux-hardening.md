## Basic Linux Hardening

Basic security hardening was applied to `GT-LINUX01`.

Hardening actions performed:

- Updated the package list using `apt update`
- Upgraded installed packages using `apt upgrade`
- Verified SSH access
- Enabled the UFW firewall
- Allowed OpenSSH through the firewall
- Confirmed default firewall policy

Commands used:

```bash
sudo apt update
sudo apt upgrade -y
sudo systemctl enable --now ssh
sudo systemctl status ssh
sudo ufw status
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose