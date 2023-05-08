# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image
docker build -t enable-ssh-on-web-container .
docker build -t enable-ssh-on-web-container . --no-cache
docker build -t auoplatform.azurecr.io/enable-ssh-on-web-container . --no-cache

# Push image to ACR
docker tag enable-ssh-on-web-container auoplatform.azurecr.io/enable-ssh-on-web-container:latest
docker images
docker push auoplatform.azurecr.io/enable-ssh-on-web-container:latest

# Run image
docker run -d --name enable-ssh-on-web-container -p 8080:80 localhost/enable-ssh-on-web-container
docker run --name enable-ssh-on-web-container -p 8080:80 localhost/enable-ssh-on-web-container
docker exec -it enable-ssh-on-web-container bash
curl http://localhost:8080

# Diag
docker logs enable-ssh-on-web-container

# Delete container
docker stop enable-ssh-on-web-container
docker rm enable-ssh-on-web-container
```

# Check list
- `ps -a`
    ```
    ea6d2dab37e3:~# netstat -nlt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State
    tcp        0      0 0.0.0.0:2222            0.0.0.0:*               LISTEN
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN
    tcp        0      0 127.0.0.11:53           0.0.0.0:*               LISTEN
    tcp        0      0 :::80                   :::*                    LISTEN
    ```