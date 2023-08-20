mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD("$MARIADB_ROOT_PASSWORD");
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB;
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB.* TO '$WORDPRESS_DB_USER'@'%';

FLUSH PRIVILEGES;
EOF

cp /tmp/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console
