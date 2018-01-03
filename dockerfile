FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php7.0 apache2 gnupg wget git zip unzip -y

RUN apt-get update && apt-get install \
	mysql-server mysql-client -y --no-install-recommends

RUN mkdir /data

VOLUME /var/lib/mysql_data

EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh
COPY files/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT /entrypoint.sh
