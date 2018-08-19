FROM opensuse/leap:15.0

RUN zypper mr -d openSUSE-Leap-15.0-Non-Oss openSUSE-Leap-15.0-Update-Non-Oss
RUN zypper ref

RUN zypper --non-interactive in --no-recommends apache2 apache2-mod_php7 wget tar bzip2 php7 php7-pdo php7-iconv php7-pgsql php7-gettext php7-curl php7-calendar postgresql perl-DBI perl-YAML perl-DBD-Pg
# && zypper clean -a

RUN wget https://gitlab.com/davical-project/awl/-/archive/r0.59/awl-r0.59.tar.bz2 \
    && wget https://gitlab.com/davical-project/davical/-/archive/r1.1.7/davical-r1.1.7.tar.bz2 \
    && tar xfjv awl-r0.59.tar.bz2 \
    && tar xfjv davical-r1.1.7.tar.bz2 \
    && rm awl-r0.59.tar.bz2 \
    && rm davical-r1.1.7.tar.bz2 \
    && mv awl-r0.59 awl \
    && mv davical-r1.1.7 davical \
    && rm -rf davical/testing/ \
    && rm -rf awl/vendor/phpunit/ \
    && mv davical/ /usr/share/ \
    && mv awl/ /usr/share/ \
    && chown -R root:wwwrun /usr/share/awl \
    && chown -R root:wwwrun /usr/share/davical

RUN a2enmod php7

COPY davical.conf /etc/apache2/conf.d/davical.conf
COPY davical.php /etc/davical/config.php
COPY administration.yml /etc/davical/administration.yml

EXPOSE 80

CMD [ "/usr/sbin/start_apache2", "-DFOREGROUND", "-k", "start" ]

RUN zypper --non-interactive in --no-recommends unzip
RUN wget https://www.inf-it.com/CalDavZAP_0.13.1.zip \
    && unzip CalDavZAP_0.13.1.zip \
    && mv caldavzap/ /usr/share/davical/htdocs \
    && chown -R root:wwwrun /usr/share/davical/htdocs/caldavzap \
    && rm CalDavZAP_0.13.1.zip
