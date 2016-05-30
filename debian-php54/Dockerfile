FROM debian:wheezy

RUN apt-get update && apt-get install -y wget curl ca-certificates && \
    echo "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list && \
    wget http://www.dotdeb.org/dotdeb.gpg -O /tmp/dotdeb.gpg && apt-key add /tmp/dotdeb.gpg && \
    apt-get update && \
    apt-get install -y apache2 apache2-utils php5 php5-common php5-cli php5-dev php-pear \
        php5-zendopcache php5-apcu php5-curl php5-gd php5-imagick php5-mcrypt php5-memcache php5-memcached \
        php5-mysql php5-xdebug php5-xsl php5-xmlrpc phpunit && \
    rm -rf /var/www/html && mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && \
    mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.dist && rm -rf /etc/apache2/sites-enabled/*

COPY conf/apache2.conf /etc/apache2/apache2.conf
COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html

EXPOSE 80
CMD ["/usr/local/bin/apache2-foreground"]
