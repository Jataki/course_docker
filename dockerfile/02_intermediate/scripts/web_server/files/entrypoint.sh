#!/bin/ash

sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/$WEBAPP_ROOT\"#g" /etc/apache2/httpd.conf
sed -i "s#/var/www/localhost/htdocs#/app/$WEBAPP_ROOT#" /etc/apache2/httpd.conf
printf "\n<Directory \"/app/$WEBAPP_ROOT\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf
chown -R apache:apache /app

httpd -D FOREGROUND
