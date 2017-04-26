create database dbsistemacv;

--tablas sin dependecias

  create table estado(
    codestado int not null,
    descripcion varchar (15) not null,
    primary key (codestado)
  );

  create table sexo(
    codsexo varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codsexo)
  );

  create table nacion(
    codnacion varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codnacion)
  );

  create table telefono (
    codtelefono varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codtelefono)
  );

  create table correo(
    codcorreo varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codcorreo)
  );

  create table direcion(
    coddirecion varchar (15) not null,
    zona varchar (30) not null,
    numero varchar (7) not null,
    calle varchar (30) not null,
    codestado int not null default 1,
    primary key (coddirecion)
  );

  create table raza(
    codraza varchar (15) not null,
    descripcion varchar (30) not null,
    codestado int not null default 1,
    primary key (codraza)
  );

  create table celda(
    codcelda varchar (15) not null,
    numero varchar(3) not null,
    codestado int not null default 1,
    primary key (codcelda)
  );

  create table precio(
    codprecio varchar (15) not null,
    precio float not null,
    codestado int not null default 1,
    primary key (codprecio)
  );

  create table contrato(
    codcontrato varchar (15) not null,
    descripcion varchar (50) not null,
    fechainicio date not null,
    fechafinal date not null,
    codestado int not null default 1,
    primary key (codcontrato)
  );

  create table usuario(
    codusuario varchar(15) not null,
    usuario varchar(30) not null,
    password varchar(30) not null,
    codestado int not null default 1,
    primary key (codusuario)
  );

  create table cargo(
    codcargo varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codcargo)
  );

  create table especialidad(
    codespecialidad varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codespecialidad)
  );

  create table ocupacion(
    codocupacion varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codocupacion)
  );

  create table tamano(
    codtamano varchar (15) not null,
    descripcion varchar (30) not null,
    codestado int not null default 1,
    primary key (codtamano)
  );

  create table empresa(
    codempresa varchar (15) not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codempresa)
  );

--tablas con dependecias de las tablas sin dependecias

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
  );

  create table servicio(
    codservicio varchar (15) not null,
    descripcion varhcar (50) not null,
    fechaservicio date not null,
    horaservicio time not null,
    codestado int not null default 1,
    primary key codservicio
  );

  create table administrativo(
    codadministrativo varchar (15) not null,
    codpersona varchar (15) not null,
    codcontrato varchar (15) not null,
    codusuario varchar (15) not null,
    cargo varchar (15) not null,
    codestado int not null default 1,
    primary key (codadministrativo)
  );

  create table veterinario(
    codveterinario varchar (15) not null,
    codpersona varchar (15) not null,
    codcontrato varchar (15) not null,
    codespecialidad varchar (15) not null,
    codestado varchar (15) not null default 1,
    primary key (codveterinario)
  );

  create table auxiliar(
    codauxiliar varchar (15) not null,
    codpersona varchar (15) not null,
    codcontrato varchar (15) not null,
    codespecialidad varchar (15) not null,
    codestado varchar (15) not null default 1,
    primary key (codauxiliar)
  );

  create table dueno(
    coddueno varchar (15) not null,
    codpersona varchar (15) not null,
    nit varchar (30) not null,
    ocupacion varchar (15) not null,
    codestado int not null default 1,
    primary key (coddueno)
  );

  create table animal(
    codanimal varchar (15) not null,
    nombre varchar (30) not null,
    edad int not null,
    peso float not null,
    tamano varchar (15) not null,
    color varchar (15) not null,
    descripcion varchar (15) not null,
    codestado int not null default 1,
    primary key (codanimal)
  );

  create table medicamento(
    codmedicamento varchar (15) not null,
    nombre varchar (30) not null,
    descripcion varchar (50) not null,
    stock int not null,
    precio varchar (15) not null,
    fechavencimiento date not null,
    codestado int not null default 1,
    primary key (codmedicamento)
  );

  create table proveedor(
    codproveedor varchar (15) not null,
    codempresa varchar (15) not null,
    coddirecion varchar (15) not null,
    codcorreo varchar (15) not null,
    codtelefono varchar (15) not null,
    codestado int not null default 1,
    primary key codproveedor
  );

--tablas generadas por interrelacion

  create table emergencia(
    codemergencia varchar (15) not null,
    codanimal varchar (15) not null,
    codveterinario varchar (15) not null,
    codauxiliar varchar (15) null,
    fechaentrada date not null,
    fechasalida date not null,
    descripcion varchar (50) not null,
    codestado int not null default 1,
    primary key (codemergencia)
  );
  
  create table suministra(
    codsuministra int not null,
    codmedicamento varchar (15) not null,
    codproveedor varchar (15) not null,
    fecha date not null,
    descripcion varchar (50) not null,
    primary key (codsuministra)
  )

  create table adquiere(
    codadquiere int not null,
    codadministrativo varchar (15) not null,
    codmedicamento varchar (15) not null,
    fecha date not null,
    descripcion varchar (50) not null,
    primary key (codadquiere)
  )

  create table hospeda(
    codhospeda int not null,
    codanimal varchar (15) not null,
    codcelda varchar (15) not null,
    fechaentrada date not null,
    fechasalida date not null,
    primary key (codhospeda)
  )

  create table registra(
    codregistra int not null,
    codadministrativo varchar (15) not null,
    codservicio varchar (15) not null,
    fecha date not null,
    descripcion varchar (50) not null,
    primary key (codregistra)
  )

  create table asiste(
    codasiste int not null,
    codanimal varchar (15) not null,
    codservicio varchar (15) not null,
    codveterinario varchar (15) not null,
    codauxiliar varchar (15) not null,
    fecha date not null,
    descripcion varchar (50) not null,
    primary key (codasiste)
  )

  create table solicita(
    codsolicita int not null,
    coddueno varchar (15) not null,
    codservicio varchar (15) not null,
    fecha date not null,
    primary key (codsolicita)
  )
