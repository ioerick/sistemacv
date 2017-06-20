<?php
    $myPDO = new PDO('pgsql:host=localhost;dbname=postgres', 'postgres', 'io_passw0rd');
    if ($myPDO) {
      echo "conectado<br>";
    } else {
      echo "no conectado<br>";
    }
    $dbconn = pg_connect("host=localhost port=5432 dbname=test user=postgres password=io_passw0rd");
    if ($dbconn) {
      echo "conectado<br>";
    } else {
      echo "no conectado<br>";
    }
?>
