create database dbsistemacv;

--por erick
--tabla parametrica para la variable bandera

  create table estado(
    codestado int not null primary key,
    descripcion varchar(15) not null
  );

  insert into estado values (0, 'no activo');
  insert into estado values (1, 'activo');

--tablas sin dependecias mas que la variable parametrica

  create table sexo(
    codsexo varchar(15) not null primary key,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table nacion(
    codnacion varchar(15) not null primary key,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table telefono (
    codtelefono varchar(15) not null primary key,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table correo(
    codcorreo varchar(15) not null primary key,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table direcion(
    coddirecion varchar(15) not null primary key, -- (codigo de ciudad) + (la##) + (lo##)
    zona varchar(30) not null,
    numero varchar(7) not null,
    calle varchar(30) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table raza(
    codraza varchar(15) not null primary key,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table celda(
    codcelda varchar(15) not null primary key,
    numero varchar(3) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table precio(
    codprecio varchar(15) not null primary key,
    precio float not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table contrato(
    codcontrato varchar(15) not null primary key,
    descripcion varchar(50) not null,
    fechainicio date not null,
    fechafinal date not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table usuario(
    codusuario varchar(15) not null primary key,
    usuario varchar(30) not null,
    password varchar(30) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table cargo(
    codcargo varchar(15) not null primary key,
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table especialidad(
    codespecialidad varchar(15) not null primary key,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table ocupacion(
    codocupacion varchar(15) not null primary key,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table tamano(
    codtamano varchar(15) not null primary key,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table color(
    codcolor varchar(15) not null primary key,
    descripcion varchar(30) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table empresa(
    codempresa varchar(15) not null primary key,
    descripcion varchar(50) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table servicio(
    codservicio varchar(15) not null primary key,
    descripcion varchar(50) not null,
    fechaservicio date not null,
    horaservicio time not null,
    codestado int not null default 1 references estado(codestado)
  );

--tablas con dependecias de las tablas sin dependecias

  create table persona(
    codpersona varchar(15) not null primary key, --llave generada (apellidopaterno)+(apellidomaterno)+(nombre)+(ci)
    nombre varchar(50) not null,
    apellidopaterno varchar(50) not null,
    apellidomaterno varchar(50) not null,
    ci varchar(15) not null,
    fechanacimiento date not null,
    codtelefono varchar(15) references telefono(codtelefono),
    codcorreo varchar(15) not null references correo(codcorreo),
    codnacion varchar(15) not null references nacion(codnacion),
    codsexo varchar(15) not null references sexo(codsexo),
    codestado int not null default 1 references estado(codestado)
  );

  create table administrativo(
    codadministrativo varchar(15) not null primary key, --llave generada adm+(ci)
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codusuario varchar(15) not null references usuario(codusuario),
    cargo varchar(15) not null references cargo(codcargo),
    codestado int not null default 1 references estado(codestado)
  );

  create table veterinario(
    codveterinario varchar(15) not null primary key, --llave generada vet+(ci)
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codespecialidad varchar(15) not null references especialidad(codespecialidad),
    codestado int not null default 1 references estado(codestado)
  );

  create table auxiliar(
    codauxiliar varchar(15) not null primary key, --llave generada aux+(ci)
    codpersona varchar(15) not null references persona(codpersona),
    codcontrato varchar(15) not null references contrato(codcontrato),
    codespecialidad varchar(15) not null references especialidad(codespecialidad),
    codestado int not null default 1 references estado(codestado)
  );

  create table dueno(
    coddueno varchar(15) not null primary key, --llave generada due+(ci)
    codpersona varchar(15) not null references persona(codpersona),
    nit varchar(30) not null,
    ocupacion varchar(15) not null references ocupacion(codocupacion),
    codestado int not null default 1 references estado(codestado)
  );

  create table animal(
    codanimal varchar(15) not null primary key,
    nombre varchar(30) not null,
    edad int not null,
    peso float not null,
    tamano varchar(15) not null references tamano(codtamano),
    color varchar(15) not null references color(codcolor),
    descripcion varchar(15) not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table medicamento(
    codmedicamento varchar(15) not null primary key,
    nombre varchar(30) not null,
    descripcion varchar(50) not null,
    stock int not null,
    precio varchar(15) not null references precio(codprecio),
    fechavencimiento date not null,
    codestado int not null default 1 references estado(codestado)
  );

  create table proveedor(
    codproveedor varchar(15) not null primary key,
    codempresa varchar(15) not null references empresa(codempresa),
    coddirecion varchar(15) not null references direcion(coddirecion),
    codcorreo varchar(15) not null references correo(codcorreo),
    codtelefono varchar(15) not null references telefono(codtelefono),
    codestado int not null default 1 references estado(codestado)
  );

--tablas generadas por interrelacion

  create table emergencia(
    codemergencia int not null primary key,
    codanimal varchar(15) not null references animal(codanimal),
    codveterinario varchar(15) not null references veterinario(codveterinario),
    codauxiliar varchar(15) null references auxiliar(codauxiliar),
    fechaentrada date not null,
    fechasalida date not null,
    descripcion varchar(50) not null
  );

  create table suministra(
    codsuministra int not null primary key,
    codmedicamento varchar(15) not null references medicamento(codmedicamento),
    codproveedor varchar(15) not null references proveedor(codproveedor),
    fecha date not null,
    descripcion varchar(50) not null
  );

  create table adquiere(
    codadquiere int not null primary key,
    codadministrativo varchar(15) not null references administrativo(codadministrativo),
    codmedicamento varchar(15) not null references medicamento(codmedicamento),
    cantidad int not null,
    fecha date not null,
    descripcion varchar(50) not null
  );

  create table hospeda(
    codhospeda int not null primary key,
    codanimal varchar(15) not null references animal(codanimal),
    codcelda varchar(15) not null references celda(codcelda),
    fechaentrada date not null,
    fechasalida date not null
  );

  create table registra(
    codregistra int not null primary key,
    codadministrativo varchar(15) not null references administrativo(codadministrativo),
    codservicio varchar(15) not null references servicio(codservicio),
    fecha date not null,
    descripcion varchar(50) not null
  );

  create table asiste(
    codasiste int not null primary key,
    codanimal varchar(15) not null references animal(codanimal),
    codservicio varchar(15) not null references servicio(codservicio),
    codveterinario varchar(15) not null references veterinario(codveterinario),
    codauxiliar varchar(15) null references auxiliar(codauxiliar),
    fecha date not null,
    descripcion varchar(50) not null
  );

  create table solicita(
    codsolicita int not null primary key,
    coddueno varchar(15) not null references dueno(coddueno),
    codservicio varchar(15) not null references servicio(codservicio),
    fecha date not null
  );
