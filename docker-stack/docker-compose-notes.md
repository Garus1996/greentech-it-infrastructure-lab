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

## Docker Architecture Overview

The Docker component of the GreenTech lab runs on the Ubuntu Server `GT-LINUX01`.

Docker is used to host a lightweight internal web service using an Nginx container. The container serves a custom HTML page called `GreenTech Internal IT Portal`.

Architecture:

- Host server: `GT-LINUX01`
- Host operating system: Ubuntu Server 24.04 LTS
- Container platform: Docker
- Web server image: `nginx`
- Container name: `greentech-nginx`
- Host port: `8080`
- Container port: `80`
- Web content location on host: `~/greentech-web`
- Web content location in container: `/usr/share/nginx/html`

Traffic flow:

```text
User / Admin
   ↓
GT-LINUX01:8080
   ↓
Docker port mapping
   ↓
greentech-nginx container:80
   ↓
Custom GreenTech HTML page
```

## Container Management Commands

The following commands can be used to manage the Nginx container.

Check running containers:

```bash
docker ps
```

Check all containers, including stopped containers:

```bash
docker ps -a
```

Stop the GreenTech web container:

```bash
docker stop greentech-nginx
```

Start the GreenTech web container:

```bash
docker start greentech-nginx
```

Restart the GreenTech web container:

```bash
docker restart greentech-nginx
```

View container logs:

```bash
docker logs greentech-nginx
```

Remove the container:

```bash
docker rm greentech-nginx
```

Recreate the container with the custom web page mounted:

```bash
docker run -d --name greentech-nginx -p 8080:80 -v ~/greentech-web:/usr/share/nginx/html:ro nginx
```

## Docker Validation Summary

The Docker setup was validated by:

- Installing Docker on `GT-LINUX01`
- Running the `hello-world` test container
- Running an Nginx container on port `8080`
- Replacing the default Nginx page with a custom GreenTech internal web page
- Testing the web service using `curl`
- Allowing port `8080/tcp` through UFW

Validation commands:

```bash
docker --version
docker ps
curl http://localhost:8080
sudo ufw status verbose
```

Result:

- Docker is installed and working.
- The Nginx container is running successfully.
- The custom internal web page is served from the Docker container.
- Firewall rules allow SSH and HTTP access on port `8080`.