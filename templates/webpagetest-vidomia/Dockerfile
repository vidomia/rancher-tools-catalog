FROM gliderlabs/alpine
MAINTAINER kost - https://github.com/kost

RUN apk --update add php-apache2 curl php-cli php-json php-phar php-openssl && rm -f /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    mkdir /app && chown -R apache:apache /app && \
    sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf && \
    sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
    echo "Success"

RUN apk add \
            freetype-dev \
            libjpeg-turbo-dev \
            libmcrypt-dev \
            libpng-dev \
	    sqlite \
	    sqlite-dev \
	    gd \
	    freetype \
	    libpng \ 
            --with-gd \
            --with-freetype-dir=/usr/include/ \
            --with-png-dir=/usr/include/ \
            --with-jpeg-dir=/usr/include/ 
	    
	    

VOLUME /app
RUN mkdir -p /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
ADD scripts/run.sh /scripts/run.sh
chmod -R 755 /scripts

EXPOSE 80
WORKDIR /app

ENTRYPOINT ["/scripts/run.sh"]
