<?php
    // $host="localhost";
    // $port="5432";
    // $user="postgres";
    // $pass="io_passw0rd";
    // $dbname="dbsistemacv";
    pg_connect("host=localhost, port=5432, user=postgres, pass=io_passw0rd, dbname=dbsistemacv") or die ("no conecta" . pg_last_error());
?>
