create database bdclinvt

create table estado
(
codestado varchar(15),
descripcion varchar(20),
primary key(codestado)
);
--insert into estado(codestado,descripcion)values(?,'?');
--update estado set codestado=?, descripcion=? where codestado=?;

create table persona
(
codpersona varchar(15),
codestado varchar(15),
nombre varchar(50),
apellidopat varchar(50),
apellidomat varchar(50),
ci varchar(50),
edad int,
fechanac date,
telefono int,
correo varchar(100),
nacion varchar(50),
genero varchar(15),
primary key(codpersona), 
foreign key(codestado) references estado(codestado)
);
--insert into persona(codpersona,codestado,nombre,apellidopat,apellidomat,ci,edad,fechanac,telefono,correo,nacion,genero)values(?,?,'?','?','?','?',?,'?',?,'?','?','?');
--update persona set codpersona=?, codestado=?, nombre=?, apellidopat=?, apellidomat=?, ci=?, edad=?, fechanac=?, telefono=?, correo=?, nacion=?, genero=? where codpersona=?;

create table administrativo
(
codadministrativo varchar(15),
codpersona varchar(15),
codestado varchar(15),
numerocon int,
fechacon date,
cargo varchar(50),
usuario varchar(50),
password varchar(50),
primary key(codadministrativo), 
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);
--insert into administrativo(codadministrativo,codpersona,codestado,numerocon,fechacon,cargo,usuario,password)values(?,?,?,?,?,?,?,?);
--update administrativo set codadministrativo=?,codpersona=?,codestado=?,numerocon=?,fechacon=?,cargo=?,usuario=?,password=? where codadministrativo=?;

create table auxiliar
(
codauxiliar varchar(15),
codpersona varchar(15),
codestado varchar(15),
numerocon int,
fechacon date,
primary key(codauxiliar), 
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);
--insert into auxiliar(codauxiliar,codpersona,codestado,numerocon,fechacon)values(?,?,?,?,?);
--update auxiliar set codauxiliar=?,codpersona=?,codestado=?,numerocon=?,fechacon=? where codauxiliar=?;

create table veterinario
(
codveterinario varchar(15),
codpersona varchar(15),
codestado varchar(15),
especialidad varchar(50),
sueldo int,
primary key(codveterinario), 
foreign key(codpersona) references persona(codpersona), 
foreign key(codestado) references estado(codestado)
);
--insert into veterinario(codveterinario,codpersona,codestado,especialidad,sueldo)values(?,?,?,?,?);
--update veterinario set codveterinario=?,codpersona=?,codestado=?,especialidad=?,sueldo=? where codveterinario=?;

create table dueno
(
coddueno varchar(15),
codpersona varchar(15),
codestado varchar(15),
nit int,
ocupacion varchar(50),
primary key(coddueno),
foreign key(codpersona) references persona(codpersona),
foreign key(codestado) references estado(codestado)
);
--insert into dueno(coddueno,codpersona,codestado,nit,ocupacion)values(?,?,?,?,?);
--update dueno set coddueno=?,codpersona=?,codestado=?,nit=?,ocupacion=? where coddueno=?;

create table direccion
(
coddireccion varchar(15),
codestado varchar(15),
zona varchar(50),
calle varchar(50),
numerocas int,
primary key(coddireccion),
foreign key (codestado) references estado(codestado)
);
--insert into direccion(coddireccion,codestado,zona,calle,numerocas)values(?,?,?,?,?);
--update direccion set coddireccion=?,codestado=?,zona=?,calle=?,numerocas=? where coddireccion=?;

create table posee
(
codposee int,
codpersona varchar(15),
coddireccion varchar(15),
fecha date,
descripcion varchar(100),
primary key(codposee),
foreign key(codpersona) references persona(codpersona),
foreign key(coddireccion) references direccion(coddireccion)
);
--select * from posee;
--insert into posee(codposee,codpersona,coddireccion,fecha,descripcion)values(?,?,?,?,?);
--update posee set codposee=?,codpersona=?,coddireccion=?,fecha=?,descripcion=? where codposee=?;

create table proveedor
(
codproveedor varchar(15),
coddireccion varchar(15),
codestado varchar(15),
nombreenc varchar(50),
nombreemp varchar(50),
primary key(codproveedor),
foreign key(coddireccion) references direccion(coddireccion),
foreign key(codestado) references estado(codestado)
);
--insert into proveedor(codproveedor,coddireccion,codestado,nombreenc,nombreemp)values(?,?,?,?,?);
--update proveedor set codproveedor=?,coddireccion=?,codestado=?,nombreenc=?,nombreemp=? where codproveedor=?;

create table medicamento
(
codmedicamento varchar(15),
codestado varchar(15),
stock int,
preciomed float,
fechaven date,
descripcion varchar(50),
primary key(codmedicamento),
foreign key(codestado) references estado(codestado)
);
--insert into medicamento(codmedicamento,codestado,stock,preciomed,fechaven,descripcion)values(?,?,?,?,?,?);
--update medicamento set codmedicamento=?,codestado=?,stock=?,preciomed=?,fechaven=?,descripcion=? where codmedicamento=?;

create table suministra
(
codsuministra int,
codproveedor varchar(15),
codmedicamento varchar(15),
fechacom date,
precio float,
descripcion varchar(100),
primary key(codsuministra),
foreign key(codproveedor) references proveedor(codproveedor),
foreign key(codmedicamento) references medicamento(codmedicamento)
);
--select * from suministra;
--insert into suministra(codsuministra,codproveedor,codmedicamento,fechacom,precio,descripcion)values(?,?,?,?,?,?);
--update suministra set codsuministra=?,codproveedor=?,codmedicamento=?,fechacom=?,precio=?,descripcion=? where codsuministra=?;

create table adquiere
(
codadquiere int,
codadministrativo varchar(15),
codmedicamento varchar(15),
fecha date,
descripcion varchar(100),
primary key(codadquiere),
foreign key(codadministrativo) references administrativo(codadministrativo),
foreign key(codmedicamento) references medicamento(codmedicamento)
);
--select * from adquiere;
--insert into adquiere(codadquiere,codadministrativo,codmedicamento,fecha,descripcion)values(?,?,?,?,?);
--update adquiere set codadquiere=?,codadministrativo=?,codmedicamento=?,fecha=?,descripcion=? where codadquiere=?;

create table precio
(
codprecio varchar(15),
codestado varchar(15),
tiposer varchar(20),
total float,
descripcion varchar(100),
primary key(codprecio),
foreign key(codestado) references estado(codestado)
);
--insert into precio(codprecio,codestado,tiposer,total,descripcion)values(?,?,?,?,?);
--update precio set codprecio=?,codestado=?,tiposer=?,total=?,descripcion=? where codprecio=?;

create table servicio
(
codservicio varchar(15),
codprecio varchar(15),
codestado varchar(15),
fechaser date,
horaser time,
designacionser varchar(50),
descripcionser varchar(100),
primary key(codservicio),
foreign key(codprecio) references precio(codprecio),
foreign key(codestado) references estado(codestado)
);
--insert into servicio(codservicio,codprecio,codestado,fechaser,horaser,designacionser,descripcionser)values(?,?,?,?,?,?,?);
--update servicio set codservicio=?,codprecio=?,codestado=?,fechaser=?,horaser=?,designacionser=?,descripcionser=? where codservicio=?;

create table registra
(
codregistra int,
codadministrativo varchar(15),
codservicio varchar(15),
fechareg date,
descripcion varchar(100),
primary key(codregistra),
foreign key(codadministrativo) references administrativo(codadministrativo),
foreign key(codservicio) references servicio(codservicio)
);
--insert into registra(codregistra,codadministrativo,codservicio,fechareg,descripcion)values(?,?,?,?,?);
--update registra set codregistra=?,codadministrativo=?,codservicio=?,fechareg=?,descripcion=? where codregistra=?;

create table solicita
(
codsolicita int,
coddueno varchar(15),
codservicio varchar(15),
fechasol date,
descripcio varchar(100),
primary key(codsolicita),
foreign key(coddueno) references dueno(coddueno),
foreign key(codservicio) references servicio(codservicio)
);
--insert into solicita(codsolicita,coddueno,codservicio,fechasol,descripcion)values(?,?,?,?,?);
--update solicita set codsolicita=?,coddueno=?,codservicio=?,fechasol=?,descripcion=? where codsolicita=?;

create table raza
(
codraza varchar(15),
codestado varchar(15),
descripcion varchar(20),
primary key(codraza),
foreign key(codestado) references estado(codestado)
);
--insert into raza(codraza,codestado,descripcion)values(?,?,?);
--update raza set codraza=?,codestado=?,descripcion=? where codraza=?;

create table animal
(
codanimal varchar(15),
codraza varchar(15),
codestado varchar(15),
nombre varchar(50),
edad int,
peso float,
tamano float,
color varchar(50),
descripcion varchar(100),
primary key(codanimal),
foreign key(codraza) references raza(codraza),
foreign key(codestado) references estado(codestado)
);
--insert into animal(codanimal,codraza,codestado,nombre,edad,peso,tamano,color,descripcion)values(?,?,?,?,?,?,?,?,?);
--update animal set codanimal=?,codraza=?,codestado=?,nombre=?,edad=?,peso=?,tamano=?,color=?,descripcion=? where codanimal=?;

create table asiste
(
codasiste int,
codanimal varchar(15),
codservicio varchar(15),
codveterinario varchar(15),
fechaasi date,
descripcion varchar(100),
primary key(codasiste),
foreign key(codanimal) references animal(codanimal),
foreign key(codservicio) references servicio(codservicio),
foreign key(codveterinario) references veterinario(codveterinario)
);
--insert into asiste(codasiste,codanimal,codservicio,codveterinario,fechaasi,descripcion)values(?,?,?,?,?,?);
--update asiste set codasiste=?,codanimal=?,codservicio=?,codveterinario=?,fechaasi=?,descripcion=? where codasiste=?;

create table emergencia
(
codemergencia varchar(15),
codanimal varchar(15),
codveterinario varchar(15),
codestado varchar(15),
fechaing date,
fechasal date,
motivo varchar(100),
primary key(codemergencia),
foreign key(codanimal) references animal(codanimal),
foreign key(codveterinario) references veterinario(codveterinario),
foreign key(codestado) references estado(codestado)
);
--insert into emergencia(codemergencia,codanimal,codveterinario,codestado,fechaing,fechasal,motivo)values(?,?,?,?,?,?,?);
--update emergencia set codemergencia=?,codanimal=?,codveterinario=?,codestado=?,fechaing=?,fechasal=?,motivo=? where codemergencia=?;

create table celda
(
codcelda varchar(15),
codestado varchar(15),
numerocel varchar(15),
altura float,
anchura float,
primary key(codcelda),
foreign key(codestado) references estado(codestado)
);
--insert into celda(codcelda,codestado,numerocel,altura,anchura)values(?,?,?,?,?);
--update celda set codcelda=?,codestado=?,numerocel=?,altura=?,anchura=? where codcelda=?;

create table hospeda
(
codhospeda int,
codcelda varchar(15),
codanimal varchar(15),
fechaing date,
fechasal date,
primary key(codhospeda),
foreign key(codcelda) references celda(codcelda),
foreign key(codanimal) references animal(codanimal)
);
--insert into hospeda(codhospeda,codcelda,codanimal,fechaing,fechasal)values(?,?,?,?,?);
--update hospeda set codhospeda=?,codcelda=?,codanimal=?,fechaing=?,fechasal=? where codhospeda=?;