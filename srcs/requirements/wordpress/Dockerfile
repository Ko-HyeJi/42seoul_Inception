FROM		alpine:3.17

RUN			apk update && apk upgrade

# install php
RUN			apk add \
			php81 \
			php81-fpm \
			php81-phar \
			php81-mysqli \
			php81-mysqlnd \
			php81-openssl \
			php81-json \
			php81-curl \
			php81-exif \
			php81-dom \
			php81-mbstring \
			php81-fileinfo \
			php81-xml \
			php81-zip

# install wp-cli
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/bin/wp

# copy setting files
COPY		./conf/wordpress.conf /etc/php81/php-fpm.d/www.conf
COPY		./conf/wp-config.php /tmp/wp-config.php
COPY		./tools/wordpress.sh /tmp/wordpress.sh
RUN			chmod 777 /tmp/wordpress.sh

# adduser
RUN			adduser -D -S -G www-data www-data

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init
ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["sh", "/tmp/wordpress.sh"]
