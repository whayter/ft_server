# FT_SERVER

This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker.

* You may need to get permission to connect the Docker daemon socket: `sudo chmod 666 /var/run/docker.sock`

* Build an image from the Dockerfile: `docker build -t test .`

* Since Nginx may already be running and listening on port 80 on the virtual machine, you have two options to run the container derived from the image:
    - Option 1: `service nginx stop` and then `docker run --rm -it -p 80:80 -p 443:443 test`
    - option 2: `docker run --rm -it -p 8080:80 -p 443:443 test`

* Disable the automatic index: use `-e AUTO_INDEX=off` when running docker