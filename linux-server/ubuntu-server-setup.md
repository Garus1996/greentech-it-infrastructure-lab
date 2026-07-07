# Ubuntu Server Setup - GT-LINUX01

A Linux server was added to the GreenTech lab environment.

## Server Details

| Setting | Value |
|---|---|
| Hostname | GT-LINUX01 |
| Operating System | Ubuntu Server 24.04 LTS |
| Username | garus |
| Internal Lab IP Address | 192.168.56.30 |
| Internal Network | greentech-lab |
| DNS Server | 192.168.56.10 |
| SSH Access | Enabled |

## Network Interfaces

| Interface | Configuration |
|---|---|
| enp0s3 | Internal Network, static IP `192.168.56.30/24` |
| enp0s8 | NAT adapter, DHCP enabled for internet access and SSH port forwarding |

## Validation Commands

```bash
hostname
whoami
ip a
ping -c 4 192.168.56.10
```

## Result

The Ubuntu Server was successfully installed, configured with a static internal IP address, and connected to the GreenTech lab network.

The server was able to communicate with the Windows Server domain controller.