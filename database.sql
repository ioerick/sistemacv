create database dbsistemacv;

  create table estado(
    codestado int,
    descripcion varchar (15),
    primary key (codestado)
  )

  create table sexo(
    codsexo varchar(15),
    descripcion varchar (15),
    codestado int,
    primary key (codsexo)
  )

  create table telefono (
    codtelefono varchar(15),
    descripcion varchar (15),
    codestado int,
    primary key (codtelefono)
  )

  create table correo(
    codcorreo varchar(15),
    descripcion varchar (50),
    codestado int,
    primary key (codcorreo)
  )

  create table direcion(
    coddirecion varchar(15),
    zona varchar (30),
    numero varchar (7),
    calle varchar (30),
    codestado int,
    primary key (coddirecion)
  )

  create table raza(
    codraza varchar(15),
    descripcion varchar (30),
    codestado int,
    primary key (codraza)
  )

  create table celda(
    codcelda varchar(15),
    numero varchar(3),
    codestado int,
    primary key (codcelda)
  )

  create table precio(
    codprecio varchar(15),
    
  )
