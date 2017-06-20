<?php
     $dbconn = pg_connect("host=localhost port=5432 dbname=dbsistemacv user=postgres password=yopatitupami");
    
    /*$query ="select * from sexo";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);*/
    
    //$obj = pg_fetch_object($result);
    /*$num = pg_num_rows($result);
    for ($i=0; $i < $num; $i++) { 
      echo $obj->codigo." ".$obj->descripcion."<br>";
    }*/
    /*
    //adicionar dato
    $query ="insert into sexo values('abc','feme',1)";
    pg_query($dbconn,$query);
    //eliminar dato
    $query ="delete from sexo where codsexo = 'abc'";
    pg_query($dbconn,$query);
    //modificar
    $query ="update sexo set codsexo = 'menos', descripcion='femenino', codestado ='1' where codsexo='mas'";
    pg_query($dbconn,$query);
    */
    //$query = pg_query($dbconn, "select sexo_add ('fem','femenino',1)");
    //pg_query($dbconn,$query);
    echo "======================================================================================================="."<br>";
    $query ="select * from color";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);
    echo "======================================================================================================="."<br>";
    $query ="select * from especialidad";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);
    echo "======================================================================================================="."<br>";
    $query ="select * from ocupacion";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);
    echo "======================================================================================================="."<br>";
    $query ="select * from tamano";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);
    echo "======================================================================================================="."<br>";
    $query ="select * from empresa";
    $result = pg_query($dbconn,$query);
    $array = pg_fetch_all($result);
    print_r($array);
    echo "======================================================================================================="."<br>";
    
?>