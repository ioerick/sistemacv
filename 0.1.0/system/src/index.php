<?php
    $host="localhost";
    $port="5432";
    $user="postgres";
    $pass="io_passw0rd";
    $dbname="dbsistemacv";
    $connect = pg_connect("host=$host, port=$port, user=$user, pass=$pass, dbname=$dbname");
    if(!$connect)
        echo "<p><i>No me conecte</i></p>";
    else
        echo "<p><i>Me conecte</i></p>";
    pg_close($connect);
?>
