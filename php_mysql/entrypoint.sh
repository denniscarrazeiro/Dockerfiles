#!/bin/sh

/usr/sbin/apache2ctl start
/usr/bin/mysqld_safe

_FILE=/opt/mariadb-backup/${MYSQL_DATABASE}.sql
if test -f "${_FILE}"; then
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}"
	mysql -uroot ${MYSQL_DATABASE} < /opt/mariadb-backup/${MYSQL_DATABASE}.sql    
fi
