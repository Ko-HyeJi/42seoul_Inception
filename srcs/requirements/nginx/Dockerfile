FROM		alpine:3.17

RUN			apk update && apk upgrade

# install nginx
RUN			apk add nginx
RUN			mkdir -p /var/www/html

# install OpenSSL
RUN			apk add openssl

# create directory for save ssl certification & key
RUN			mkdir -p /etc/nginx/ssl

# set ssl
RUN			openssl req \
			-newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 365 -nodes \
			-out /etc/nginx/ssl/hyko.crt \
			-keyout /etc/nginx/ssl/hyko.key \
			-subj "/C=KR/ST=Seoul/O=42Seoul/OU=hyko/CN=inception/"

RUN			chmod 777 /etc/nginx/ssl/hyko.crt /etc/nginx/ssl/hyko.key

# copy config file
COPY		./conf/nginx.conf /etc/nginx/http.d/default.conf

# dumb-init
RUN			apk add dumb-init
RUN			chmod +x /usr/bin/dumb-init
ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD			["nginx", "-g", "daemon off;"]
