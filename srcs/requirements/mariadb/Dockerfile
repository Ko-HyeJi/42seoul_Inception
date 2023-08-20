FROM		alpine:3.17

RUN			apk update && apk upgrade

# install mariadb
RUN			apk add mariadb
RUN			apk add mariadb-common
RUN			apk add mariadb-client
RUN			apk add mariadb-server-utils

# set socket file directory
RUN			mkdir -p /run/mysqld
RUN			chown -R mysql:mysql /run/mysqld

# set data directory
RUN			mkdir -p /var/lib/mysql
RUN			chown -R mysql:mysql /var/lib/mysql

# copy setting files
COPY		./conf/mariadb.conf /tmp/mariadb.conf
COPY		./tools/mariadb.sh /tmp/mariadb.sh
RUN			chmod 777 /tmp/mariadb.sh

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init
ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/mariadb.sh"]
