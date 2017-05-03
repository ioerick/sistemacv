create database bdclinvt

create table estado
(
codestado int not null,
descripcion varchar(15) not null,
primary key(codestado)
);


create table telefono
(
codtelefono varchar(15) not null,
codestado int not null,
numero varchar(15) not null,
primary key(codtelefono),
foreign key(codestado) references estado(codestado)
);


create table correo
(
codcorreo varchar(15) not null,
codestado int not null,
descripcion varchar(50) not null,
primary key(codcorreo),
foreign key(codestado) references estado(codestado)
);


create table nacion
(
codnacion varchar(15) not null,
codestado int not null,
pais varchar(30) not null,
ciudad varchar(30) not null,
primary key(codnacion),
foreign key(codestado) references estado(codestado)
);


create table persona
(
codpersona varchar(15) not null,
codtelefono varchar(15) not null,
codcorreo varchar(15) not null,
codnacion varchar(15) not null,
codestado int not null,
nombre varchar(30) not null,
apellidopat varchar(30) not null,
apellidomat varchar(30) not null,
ci varchar(15) not null,
fechanac date not null,
sexo varchar(15) not null,
primary key(codpersona),
foreign key(codtelefono) references telefono(codtelefono),
foreign key(codcorreo) references correo(codcorreo),
foreign key(codnacion) references nacion(codnacion),
foreign key(codestado) references estado(codestado)
);


create table login
(
codlogin varchar(15) not null,
codestado int not null,
usuario varchar(40) not null,
contrasena varchar(40) not null,
primary key(codlogin),
foreign key(codestado) references estado(codestado)
);


create table cargo
(
codcargo varchar(15) not null,
codestado int not null,
nombrecar varchar(40) not null,
primary key(codcargo),
foreign key(codestado) references estado(codestado)
);


create table administrativo
(
codadministrativo varchar(15) not null,
codlogin varchar(15) not null,
codcargo varchar(15) not null,
codpersona varchar(15) not null,
codestado int not null,
numerocon int not null,
fechacon date not null,
primary key(codadministrativo), 
foreign key(codlogin) references login(codlogin),
foreign key(codcargo) references cargo(codcargo),
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);


create table auxiliar
(
codauxiliar varchar(15) not null,
codpersona varchar(15) not null,
codestado int not null,
numerocon int not null,
fechacon date not null,
primary key(codauxiliar), 
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);


create table veterinario
(
codveterinario varchar(15) not null,
codpersona varchar(15) not null,
codestado int not null,
especialidad varchar(50) not null,
otro varchar(50),
primary key(codveterinario),
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);


create table ocupacion
(
codocupacion varchar(15) not null,
codestado int not null,
nombreocu varchar(30) not null,
otro varchar(30),
primary key(codocupacion),
foreign key(codestado) references estado(codestado)
);


create table dueno
(
coddueno varchar(15) not null,
codpersona varchar(15) not null,
codocupacion varchar(15) not null,
codestado int not null,
nit int not null,
primary key(coddueno),
foreign key(codpersona) references persona(codpersona),
foreign key(codocupacion) references ocupacion(codocupacion),
foreign key(codestado) references estado(codestado)
);


create table direccion
(
coddireccion varchar(15) not null,
codestado int not null,
zona varchar(40) not null,
calle varchar(40) not null,
numerocas int not null,
primary key(coddireccion),
foreign key (codestado) references estado(codestado)
);


create table georeferencia
(
codgeoreferencia varchar(15) not null,
codestado int not null,
descripcion varchar(50) not null,
otro varchar(50),
primary key(codgeoreferencia),
foreign key(codestado) references estado(codestado)
);


create table posee
(
codposee int not null,
codpersona varchar(15) not null,
coddireccion varchar(15) not null,
codgeoreferencia varchar(15) not null,
fecha date not null,
descripcion varchar(50) not null,
primary key(codposee),
foreign key(codpersona) references persona(codpersona),
foreign key(coddireccion) references direccion(coddireccion),
foreign key(codgeoreferencia) references georeferencia(codgeoreferencia)
);


create table proveedor
(
codproveedor varchar(15) not null,
coddireccion varchar(15) not null,
codestado int not null,
nombreenc varchar(30) not null,
nombreemp varchar(30) not null,
primary key(codproveedor),
foreign key(coddireccion) references direccion(coddireccion),
foreign key(codestado) references estado(codestado)
);


create table medicamento
(
codmedicamento varchar(15) not null,
codestado int not null,
nombremed varchar(30) not null,
stock int not null,
preciomed float not null,
fechaven date not null,
descripcion varchar(50) not null,
primary key(codmedicamento),
foreign key(codestado) references estado(codestado)
);


create table suministra
(
codsuministra int not null,
codproveedor varchar(15) not null,
codmedicamento varchar(15) not null,
fechacom date not null,
precio float not null,
descripcion varchar(50) not null,
primary key(codsuministra),
foreign key(codproveedor) references proveedor(codproveedor),
foreign key(codmedicamento) references medicamento(codmedicamento)
);


create table adquiere
(
codadquiere int not null,
codadministrativo varchar(15) not null,
codmedicamento varchar(15) not null,
fecha date not null,
descripcion varchar(50) not null,
primary key(codadquiere),
foreign key(codadministrativo) references administrativo(codadministrativo),
foreign key(codmedicamento) references medicamento(codmedicamento)
);


create table servicio
(
codservicio varchar(15) not null,
codestado int not null,
nombreser varchar(30) not null,
fechaser date not null,
horaser time not null,
designacionser varchar(30) not null,
descripcionser varchar(50) not null,
primary key(codservicio),
foreign key(codestado) references estado(codestado)
);


create table precio
(
codprecio varchar(15) not null,
codservicio varchar(15) not null,
codestado int not null,
total float not null,
descripcion varchar(50) not null,
primary key(codprecio),
foreign key(codservicio) references servicio(codservicio),
foreign key(codestado) references estado(codestado)
);


create table registra
(
codregistra int not null,
codadministrativo varchar(15) not null,
codservicio varchar(15) not null,
fechareg date not null,
descripcion varchar(50) not null,
primary key(codregistra),
foreign key(codadministrativo) references administrativo(codadministrativo),
foreign key(codservicio) references servicio(codservicio)
);


create table solicita
(
codsolicita int not null,
coddueno varchar(15) not null,
codservicio varchar(15) not null,
fechasol date not null,
descripcion varchar(50) not null,
primary key(codsolicita),
foreign key(coddueno) references dueno(coddueno),
foreign key(codservicio) references servicio(codservicio)
);


create table raza
(
codraza varchar(15) not null,
codestado int not null,
descripcion varchar(20) not null,
primary key(codraza),
foreign key(codestado) references estado(codestado)
);


create table tamano
(
codtamano varchar(15) not null,
codestado int not null,
altura float not null,
distancia float not null,
primary key(codtamano),
foreign key(codestado) references estado(codestado)
);


create table color
(
codcolor varchar(15) not null,
codestado int not null,
color varchar(20) not null,
otro varchar(30),
primary key(codcolor),
foreign key(codestado) references estado(codestado)
);


create table animal
(
codanimal varchar(15) not null,
codraza varchar(15) not null,
codtamano varchar(15) not null,
codcolor varchar(15) not null,
codestado int not null,
nombre varchar(20) not null,
edad int not null,
peso float not null,
descripcion varchar(50) not null,
primary key(codanimal),
foreign key(codraza) references raza(codraza),
foreign key(codestado) references estado(codestado),
foreign key(codtamano) references tamano(codtamano),
foreign key(codcolor) references color(codcolor)
);


create table asiste
(
codasiste int not null,
codanimal varchar(15) not null,
codservicio varchar(15) not null,
codveterinario varchar(15) not null,
fechaasi date not null,
descripcion varchar(50) not null,
primary key(codasiste),
foreign key(codanimal) references animal(codanimal),
foreign key(codservicio) references servicio(codservicio),
foreign key(codveterinario) references veterinario(codveterinario)
);


create table emergencia
(
codemergencia varchar(15) not null,
codanimal varchar(15) not null,
codveterinario varchar(15) not null,
codestado int not null,
fechaing date not null,
fechasal date not null,
motivo varchar(100) not null,
primary key(codemergencia),
foreign key(codanimal) references animal(codanimal),
foreign key(codveterinario) references veterinario(codveterinario),
foreign key(codestado) references estado(codestado)
);


create table celda
(
codcelda varchar(15) not null,
codestado int not null,
numerocel varchar(3) not null,
primary key(codcelda),
foreign key(codestado) references estado(codestado)
);


create table hospeda
(
codhospeda int not null,
codcelda varchar(15) not null,
codanimal varchar(15) not null,
fechaing date not null,
fechasal date not null,
motivo varchar(30) not null,
primary key(codhospeda),
foreign key(codcelda) references celda(codcelda),
foreign key(codanimal) references animal(codanimal)
);

