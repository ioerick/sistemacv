create database dbsistemacv;

--tabla parametrica para la variable bandera

  create table estado(
    codestado int not null,
    descripcion varchar(15) not null,
    primary key (codestado)
  );

--tablas sin dependecias mas que la variable parametrica

  create table sexo(
    codsexo varchar(15) not null,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codsexo)
  );

  create table nacion(
    codnacion varchar(15) not null,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codnacion)
  );

  create table telefono (
    codtelefono varchar(15) not null,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codtelefono)
  );

  create table correo(
    codcorreo varchar(15) not null,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codcorreo)
  );

  create table direcion(
    coddirecion varchar(15) not null,
    zona varchar(30) not null,
    numero varchar(7) not null,
    calle varchar(30) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (coddirecion)
  );

  create table raza(
    codraza varchar(15) not null,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codraza)
  );

  create table celda(
    codcelda varchar(15) not null,
    numero varchar(3) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codcelda)
  );

  create table precio(
    codprecio varchar(15) not null,
    precio float not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codprecio)
  );

  create table contrato(
    codcontrato varchar(15) not null,
    descripcion varchar(50) not null,
    fechainicio date not null,
    fechafinal date not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codcontrato)
  );

  create table usuario(
    codusuario varchar(15) not null,
    usuario varchar(30) not null,
    password varchar(30) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codusuario)
  );

  create table cargo(
    codcargo varchar(15) not null,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codcargo)
  );

  create table especialidad(
    codespecialidad varchar(15) not null,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codespecialidad)
  );

  create table ocupacion(
    codocupacion varchar(15) not null,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codocupacion)
  );

  create table tamano(
    codtamano varchar(15) not null,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codtamano)
  );

  create table color(
    codcolor varchar(15) not null,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codcolor)
  );

  create table empresa(
    codempresa varchar(15) not null,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codempresa)
  );

  create table servicio(
    codservicio varchar(15) not null,
    descripcion varchar(50) not null,
    fechaservicio date not null,
    horaservicio time not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codservicio)
  );

--tablas con dependecias de las tablas sin dependecias

  create table persona(
    codpersona varchar(15) not null,
    nombre varchar(50) not null,
    apellidopaterno varchar(50) not null,
    apellidomaterno varchar(50) not null,
    ci varchar(15) not null,
    edad int not null,
    fechanacimiento date not null,
    codtelefono varchar(15) references telefono(codtelefono),
    codcorreo varchar(15) not null references correo(codcorreo),
    codnacion varchar(15) not null references nacion(codnacion),
    codsexo varchar(15) not null references sexo(codsexo),
    codestado int not null default 1 references estado(codestado),
    primary key (codpersona)
  );

  create table administrativo(
    codadministrativo varchar(15) not null,
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codusuario varchar(15) not null references usuario(codusuario),
    cargo varchar(15) not null references cargo(codcargo),
    codestado int not null default 1 references estado(codestado),
    primary key (codadministrativo)
  );

  create table veterinario(
    codveterinario varchar(15) not null,
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codespecialidad varchar(15) not null references especialidad(codespecialidad),
    codestado int not null default 1 references estado(codestado),
    primary key (codveterinario)
  );

  create table auxiliar(
    codauxiliar varchar(15) not null,
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codespecialidad varchar(15) not null references especialidad(codespecialidad),
    codestado int not null default 1 references estado(codestado),
    primary key (codauxiliar)
  );

  create table dueno(
    coddueno varchar(15) not null,
    codpersona varchar(15) not null references persona(codpersona),
    nit varchar(30) not null,
    ocupacion varchar(15) not null references ocupacion(codocupacion),
    codestado int not null default 1 references estado(codestado),
    primary key (coddueno)
  );

  create table animal(
    codanimal varchar(15) not null,
    nombre varchar(30) not null,
    edad int not null,
    peso float not null,
    tamano varchar(15) not null references tamano(codtamano),
    color varchar(15) not null references color(codcolor),
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codanimal)
  );

  create table medicamento(
    codmedicamento varchar(15) not null,
    nombre varchar(30) not null,
    descripcion varchar(50) not null,
    stock int not null,
    precio varchar(15) not null references precio(codprecio),
    fechavencimiento date not null,
    codestado int not null default 1 references estado(codestado),
    primary key (codmedicamento)
  );

  create table proveedor(
    codproveedor varchar(15) not null,
    codempresa varchar(15) not null references empresa(codempresa),
    coddirecion varchar(15) not null references direcion(coddirecion),
    codcorreo varchar(15) not null references correo(codcorreo),
    codtelefono varchar(15) not null references telefono(codtelefono),
    codestado int not null default 1 references estado(codestado),
    primary key (codproveedor)
  );

--tablas generadas por interrelacion

  create table emergencia(
    codemergencia int not null,
    codanimal varchar(15) not null references animal(codanimal),
    codveterinario varchar(15) not null references veterinario(codveterinario),
    codauxiliar varchar(15) null references auxiliar(codauxiliar),
    fechaentrada date not null,
    fechasalida date not null,
    descripcion varchar(50) not null,
    primary key (codemergencia)
  );

  create table suministra(
    codsuministra int not null,
    codmedicamento varchar(15) not null references medicamento(codmedicamento),
    codproveedor varchar(15) not null references proveedor(codproveedor),
    fecha date not null,
    descripcion varchar(50) not null,
    primary key (codsuministra)
  );

  create table adquiere(
    codadquiere int not null,
    codadministrativo varchar(15) not null references administrativo(codadministrativo),
    codmedicamento varchar(15) not null references medicamento(codmedicamento),
    cantidad int not null,
    fecha date not null,
    descripcion varchar(50) not null,
    primary key (codadquiere)
  );

  create table hospeda(
    codhospeda int not null,
    codanimal varchar(15) not null references animal(codanimal),
    codcelda varchar(15) not null references celda(codcelda),
    fechaentrada date not null,
    fechasalida date not null,
    primary key (codhospeda)
  );

  create table registra(
    codregistra int not null,
    codadministrativo varchar(15) not null references administrativo(codadministrativo),
    codservicio varchar(15) not null references servicio(codservicio),
    fecha date not null,
    descripcion varchar(50) not null,
    primary key (codregistra)
  );

  create table asiste(
    codasiste int not null,
    codanimal varchar(15) not null references animal(codanimal),
    codservicio varchar(15) not null references servicio(codservicio),
    codveterinario varchar(15) not null references veterinario(codveterinario),
    codauxiliar varchar(15) null references auxiliar(codauxiliar),
    fecha date not null,
    descripcion varchar(50) not null,
    primary key (codasiste)
  );

  create table solicita(
    codsolicita int not null,
    coddueno varchar(15) not null references dueno(coddueno),
    codservicio varchar(15) not null references servicio(codservicio),
    fecha date not null,
    primary key (codsolicita)
  );
