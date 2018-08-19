FROM opensuse/leap:15.0

# disable non-oss, avoid unnecessary repository refresh
RUN zypper mr -d openSUSE-Leap-15.0-Non-Oss openSUSE-Leap-15.0-Update-Non-Oss
RUN zypper ref
RUN zypper --non-interactive in --no-recommends postgresql10-server
# && zypper clean -a

EXPOSE 5432
CMD ["postgres"]
ENV PGDATA=/var/lib/postgresql

RUN mkdir -p "$PGDATA" && chown -R postgres "$PGDATA" && chmod 700 "$PGDATA"
USER postgres

# for simplicity use "trust" authentication (passwordless login)
# OK for development, but not for production...
RUN initdb --locale=en_US.UTF-8 --auth=trust \
  && echo "listen_addresses='*'" >> /var/lib/postgresql/postgresql.conf \
  && echo "host all  all  127.0.0.1/0  trust" >> /var/lib/postgresql/pg_hba.conf
