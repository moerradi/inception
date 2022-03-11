mysql --user=root <<_EOF_
UPDATE mysql.user SET Password=PASSWORD('${MARIADB_ROOT_PASSWORD}') WHERE User='root';
CREATE USER 'wp-user'@'mariadb' IDENTIFIED BY '${MARIDB_WP_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'wp-user'@'mariadb' WITH GRANT OPTION;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_

service mysql start
mysqld_safe 