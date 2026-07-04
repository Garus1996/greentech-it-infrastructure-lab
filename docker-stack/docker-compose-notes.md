## Docker Installation on GT-LINUX01

Docker was installed on the Ubuntu Server `GT-LINUX01`.

Server details:

- Hostname: `GT-LINUX01`
- Operating system: Ubuntu Server 24.04 LTS
- Docker package: `docker.io`
- Docker version: `29.1.3`
- User added to Docker group: `garus`

Commands used:

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable --now docker
sudo systemctl status docker
sudo docker run hello-world
sudo usermod -aG docker garus
newgrp docker
docker ps
docker --version