

## DB Init

```sh
docker-compose up
docker-compose run -e PSQLOPTS="--host postgres -U postgres " davical /usr/share/davical/dba/create-database.sh davical admin_password
docker-compose exec postgres createuser davical_app
docker-compose exec postgres createuser davical_dba
# TODO
# php agendavcli migrations:migrate
```