FROM opensuse/leap:15.0

RUN zypper mr -d openSUSE-Leap-15.0-Non-Oss openSUSE-Leap-15.0-Update-Non-Oss
RUN zypper ref
RUN zypper --non-interactive in --no-recommends apache2 apache2-mod_php7 wget tar gzip php7 php7-pgsql php7-ctype php7-curl php7-mbstring php7-tokenizer php7-xmlreader php7-xmlwriter
# && zypper clean -a

RUN wget https://github.com/agendav/agendav/releases/download/2.2.0/agendav-2.2.0.tar.gz \
    && tar xfzv agendav-2.2.0.tar.gz \
    && rm agendav-2.2.0.tar.gz \
    && mv agendav-2.2.0 /usr/share/agendav \
    && chown -R root:wwwrun /usr/share/agendav

RUN a2enmod php7

EXPOSE 80

CMD [ "/usr/sbin/start_apache2", "-DFOREGROUND", "-k", "start" ]

COPY agendav.conf /etc/apache2/conf.d/
