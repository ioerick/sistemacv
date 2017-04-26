create database dbsistemacv;

  create table estado(
    codestado int not null,
    descripcion varchar (15) not null,
    primary key (codestado)
  )

  create table sexo(
    codsexo varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codsexo)
  )

  create table nacion(
    codnacion varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codnacion)
  )

  create table telefono (
    codtelefono varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codtelefono)
  )

  create table correo(
    codcorreo varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codcorreo)
  )

  create table direcion(
    coddirecion varchar (15) not null,
    zona varchar (30) not null,
    numero varchar (7) not null,
    calle varchar (30) not null,
    codestado int not null default 1,
    primary key (coddirecion)
  )

  create table raza(
    codraza varchar (15) not null,
    descripcion varchar (30) not null,
    codestado int not null default 1,
    primary key (codraza)
  )

  create table celda(
    codcelda varchar (15) not null,
    numero varchar(3) not null,
    codestado int not null default 1,
    primary key (codcelda)
  )

  create table precio(
    codprecio varchar (15) not null,
    precio float not null,
    codestado int not null default 1,
    primary key (codprecio)
  )

  create table contrato(
    codcontrato varchar (15) not null,
    descripcion varchar (50) not null,
    fechainicio date not null,
    fechafinal date not null,
    codestado int not null default 1,
    primary key (codcontrato)
  )

  create table usuario(
    codusuario varchar(15) not null,
    usuario varchar(30) not null,
    password varchar(30) not null,
    codestado int not null default 1,
    primary key codusuario
  )

  create table cargo(
    codcargo varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key codcargo
  )

  create table persona(
    codpersona varchar (15) not null,
    nombre varchar (50) not null,
    apellidopaterno varchar (50) not null,
    apellidomaterno varchar (50) not null,
    ci varchar (15) not null,
    edad int not null,
    fechanacimiento date not null,
    codtelefono varchar (15),
    codcorreo varchar (15) not null,
    codnacion varchar (15) not null,
    codsexo varchar (15) not null,
    codestado int not null default 1,
    primary key (codpersona)
  )

  create table servicio(
    codservicio varchar (15) not null,
    descripcion varhcar (50) not null,
    fechaservicio date not null,
    horaservicio time not null,
    codestado int not null default 1,
    primary key codservicio
  )

  create table administrativo(
    codadministrativo varchar (15) not null,
    codpersona varchar (15) not null,
    codcontrato varchar (15) not null,
    codusuario varchar (15) not null,
    cargo varchar (15) not null,
    codestado int not null default 1,
    primary key codadministrativo
  )
