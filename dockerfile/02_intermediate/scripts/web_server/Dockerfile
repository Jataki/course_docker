FROM alpine:3.4
MAINTAINER Luis Nabais <luis.nabais@findmore.pt>

ENV WORDPRESS_VERSION 4.6.1

# Setup apache and php
RUN apk --update add apache2 php5-apache2 curl \
    php5-json php5-phar php5-openssl php5-mysql php5-curl php5-mcrypt php5-pdo_mysql php5-ctype php5-gd php5-xml php5-dom php5-iconv \
    && rm -f /var/cache/apk/* \
    && mkdir /run/apache2 \
    && sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf \
    && mkdir -p /opt/utils \
    && mkdir -p /app

    
EXPOSE 80

ADD files/entrypoint.sh /opt/utils/
ADD files/info.php /app
ADD files/wordpress-${WORDPRESS_VERSION}.tar.gz /app/

RUN chmod +x /opt/utils/entrypoint.sh

ENTRYPOINT ["/opt/utils/entrypoint.sh"]
