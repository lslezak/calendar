FROM opensuse/leap:15.0

RUN zypper mr -d openSUSE-Leap-15.0-Non-Oss openSUSE-Leap-15.0-Update-Non-Oss
RUN zypper ref
RUN zypper --non-interactive in --no-recommends apache2 apache2-mod_php7 wget tar bzip2 php7 php7-pdo php-iconv
# && zypper clean -a

RUN wget https://github.com/agendav/agendav/releases/download/2.2.0/agendav-2.2.0.tar.gz \
    && tar xfzv agendav-2.2.0.tar.gz \
    && rm agendav-2.2.0.tar.gz \
    && mv awl-r0.59 awl \
    && mv davical/ /usr/share/ \
    && mv awl/ /usr/share/ \
    && chown -R root:wwwrun /usr/share/awl \
    && chown -R root:wwwrun /usr/share/davical

RUN a2enmod php7

EXPOSE 80

CMD [ "/usr/sbin/start_apache2", "-DFOREGROUND", "-k", "start" ]
