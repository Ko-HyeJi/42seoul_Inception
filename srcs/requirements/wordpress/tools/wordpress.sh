# mv config file
mv /tmp/wp-config.php /var/www/html/wp-config.php

wp core download --allow-root --path=/var/www/html

# install wordpress
wp	core install \
	--allow-root \
	--path=/var/www/html \
	--url=${DOMAIN_NAME} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--skip-email

# create wordpress user
wp	user create \
	--allow-root \
	--path=/var/www/html \
	${WORDPRESS_USER} \
	${WORDPRESS_USER_EMAIL} \
	--role=author \
	--user_pass=${WORDPRESS_USER_PASSWORD}

# no subshell is created and the current process is replaced
php-fpm81 -F -R
