<?php
  $c->domain_name = "calendar.example.net";
  $c->sysabbr     = 'DAViCal';
  $c->admin_email = 'admin@example.net';
  $c->system_name = "DAViCal Server";
  $c->db_connect[] = array( 'dsn' => 'pgsql:dbname=davical port=5432 host=postgres', 'dbuser' => 'davical_app', 'dbpass' => 'fred' );