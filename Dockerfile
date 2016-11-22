FROM centos:6

MAINTAINER Jeroen Boonstra <jeroen@provider.nl>

# Enable epel repo
RUN yum -y install epel-release

RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-6.rpm
RUN yum -y install yum-utils

ENV PHP_VERSION=70

EXPOSE 8000

RUN yum-config-manager --enable remi-php${PHP_VERSION}
RUN yum -y install php${PHP_VERSION} \
      php${PHP_VERSION}-php-mysqlnd \
      php${PHP_VERSION}-php-pdo \
      php${PHP_VERSION}-php-gd  \
      php${PHP_VERSION}-php-imap \
      php${PHP_VERSION}-php-pear \
      php${PHP_VERSION}-php-xml \
      php${PHP_VERSION}-php-xmlrpc \
      php${PHP_VERSION}-php-mbstring \
      php${PHP_VERSION}-php-mcrypt \
      php${PHP_VERSION}-php-soap \
      php${PHP_VERSION}-php-pecl-zip \
      php${PHP_VERSION}-php-bcmath \
      php${PHP_VERSION}-php-pear

# Create symlinks
RUN ln -s /usr/bin/php${PHP_VERSION} /usr/bin/php && \
    ln -s /usr/bin/php${PHP_VERSION}-pear /usr/bin/pear && \
    ln -s /usr/bin/php${PHP_VERSION}-phar /usr/bin/phar && \
    
COPY /resources/phpinfo.php /

ENTRYPOINT php -S localhost:8000 -t /phpinfo.php
