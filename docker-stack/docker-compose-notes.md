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

## Nginx Container Test

An Nginx web server container was deployed on `GT-LINUX01` using Docker.

Container details:

- Container name: `greentech-nginx`
- Docker image: `nginx`
- Host port: `8080`
- Container port: `80`

Commands used:

```bash
docker run -d --name greentech-nginx -p 8080:80 nginx
docker ps
curl http://localhost:8080
sudo ufw allow 8080/tcp
sudo ufw status verbose


## Custom GreenTech Internal Web Page

The default Nginx page was replaced with a custom internal GreenTech web page.

Web page details:

- Page name: `GreenTech Internal IT Portal`
- Host server: `GT-LINUX01`
- Web server: Nginx
- Container name: `greentech-nginx`
- Host port: `8080`
- Container port: `80`
- Local content folder: `~/greentech-web`
- Container web root: `/usr/share/nginx/html`

Commands used:

```bash
mkdir -p ~/greentech-web
cd ~/greentech-web
nano index.html
docker stop greentech-nginx
docker rm greentech-nginx
docker run -d --name greentech-nginx -p 8080:80 -v ~/greentech-web:/usr/share/nginx/html:ro nginx
docker ps
curl http://localhost:8080