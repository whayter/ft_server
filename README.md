# =========== FT_SERVER ==========

This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.

* Get permission to connect the Docker daemon socket : sudo chmod 666 /var/run/docker.sock

* Build Docker:
```
docker build -t test .
```

* Run Docker:
```
docker run --rm -it -p 80:80 -p 443:443 test
```

* Unable autoindex:
```
docker run --rm -it -e AUTO_INDEX=off -p 80:80 -p 443:443 test
```

* Nginx may already be turned on on th virtual machine and occupy port 80. If so, run:
```
service nginx stop
```