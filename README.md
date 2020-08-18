# FT_SERVER

This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.

* You may need to get permission to connect the Docker daemon socket:
```
sudo chmod 666 /var/run/docker.sock
```

* Build an image from the Dockerfile:
```
docker build -t test .
```

* Run a Docker container derived from the image:
```
docker run --rm -it -p 8080:8080 -p 443:443 test
```

* Disable the automatic index:
```
docker run --rm -it -e AUTO_INDEX=off -p 8080:8080 -p 443:443 test
```