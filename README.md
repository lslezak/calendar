
# Web and CalDav Calendar Docker Application

- Make sure you have the `docker-compose` installed and the docker
  service is running.


## Initialization

At first start you need to build the docker images and initialize the Postgres
database. You can do this by running the `./docker_init.sh` script. The
script keeps the app running, then you can access http://localhost:8080
and create the resources in the [DaviCal](https://www.davical.org/) server.

## Later Start

To start the application run `docker-compose up` (to run the application in
the foreground) or `docker-compose start` (to run it in backround).

See more details in the [docker-compose documentation](
https://docs.docker.com/compose/reference/overview/).

## Shutdown

When running in backround you can stop the application by running
`docker-compose down`.


## Firewall

If you want to access the application from outside make sure
the ports 80 and 8080 and allowed in the firewall configuration.

```bash
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-port=8080/tcp
```

See the [firewalld documentation](https://firewalld.org/documentation/howto/open-a-port-or-service.html).