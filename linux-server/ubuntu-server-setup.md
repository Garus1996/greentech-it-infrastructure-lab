## Ubuntu Server Setup - GT-LINUX01

A Linux server was added to the GreenTech lab environment.

Server details:

- Hostname: `GT-LINUX01`
- Operating system: Ubuntu Server 24.04 LTS
- Username: `garus`
- Internal lab IP address: `192.168.56.30`
- Internal network: `greentech-lab`
- DNS server: `192.168.56.10`
- SSH access: Enabled

Network interfaces:

- `enp0s3`: Internal Network, static IP `192.168.56.30/24`
- `enp0s8`: NAT adapter, DHCP enabled for internet access and SSH port forwarding

Validation commands:

```bash
hostname
whoami
ip a
ping -c 4 192.168.56.10