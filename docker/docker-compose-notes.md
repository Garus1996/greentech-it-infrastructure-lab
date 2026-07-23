# Docker and Nginx Notes

## Docker Installation on GT-LINUX01

Docker was installed on the Ubuntu Server `GT-LINUX01`.

## Server Details

| Setting | Value |
|---|---|
| Hostname | GT-LINUX01 |
| Operating System | Ubuntu Server 24.04 LTS |
| Docker Package | docker.io |
| Docker Version | 29.1.3 |
| Docker User | garus |

## Docker Installation Commands

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
```

## Nginx Container Test

An Nginx web server container was deployed on `GT-LINUX01` using Docker.

## Container Details

| Setting | Value |
|---|---|
| Container Name | greentech-nginx |
| Docker Image | nginx |
| Host Port | 8080 |
| Container Port | 80 |

## Nginx Test Commands

```bash
docker run -d --name greentech-nginx -p 8080:80 nginx
docker ps
curl http://localhost:8080
sudo ufw allow 8080/tcp
sudo ufw status verbose
```

## Custom GreenTech Internal Web Page

The default Nginx page was replaced with a custom internal GreenTech web page.

## Web Page Details

| Setting | Value |
|---|---|
| Page Name | GreenTech Internal IT Portal |
| Host Server | GT-LINUX01 |
| Web Server | Nginx |
| Container Name | greentech-nginx |
| Host Port | 8080 |
| Container Port | 80 |
| Local Content Folder | ~/greentech-web |
| Container Web Root | /usr/share/nginx/html |

## Custom Web Page Commands

```bash
mkdir -p ~/greentech-web
cd ~/greentech-web
nano index.html
docker stop greentech-nginx
docker rm greentech-nginx
docker run -d --name greentech-nginx -p 8080:80 -v ~/greentech-web:/usr/share/nginx/html:ro nginx
docker ps
curl http://localhost:8080
```

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
   |
   v
GT-LINUX01:8080
   |
   v
Docker port mapping
   |
   v
greentech-nginx container:80
   |
   v
Custom GreenTech HTML page
```

## Container Management Commands

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

## Result

Docker was installed and validated successfully.

The Nginx container is running, the custom internal web page is served from the Docker container, and firewall rules allow SSH and HTTP access on port `8080`.