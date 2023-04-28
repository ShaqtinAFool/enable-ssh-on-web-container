# How to build it?
```bash
# Init VM
docker machine init
docker machine start

# Build on local
docker build -t enable-ssh-on-web-container . --no-cache
docker build -t auoplatform.azurecr.io/enable-ssh-on-web-container . --no-cache
docker exec -it enable-ssh-on-web-container bash

# Push image to ACR
docker tag enable-ssh-on-web-container auoplatform.azurecr.io/enable-ssh-on-web-container:latest
docker images
docker push auoplatform.azurecr.io/enable-ssh-on-web-container:latest

docker stop enable-ssh-on-web-container
```