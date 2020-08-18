FROM debian:buster
LABEL maintainer="Winston Hayter <hwinston@student.42.fr>"

RUN apt-get update -qy \
&& apt-get upgrade -qy \
&& apt-get install -qy wget nginx default-mysql-server php7.3-fpm php7.3-mysql

COPY ./srcs/* srcs_docker/

EXPOSE 8080
EXPOSE 443

RUN chmod +x ./srcs_docker/config.sh
CMD bash ./srcs_docker/config.sh