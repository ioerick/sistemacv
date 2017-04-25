create table estado
(
"codestado" varchar (15) primary key not null,
"descripestad" varchar (50) default null 
);


create table persona 
(
"codpersona" varchar (15) primary key not null,
"nombre" varchar (50)default null,
"apellidopat" varchar (50)default null,
"apellidomat" varchar (50)default null,
"ci" varchar(11)default null,
"edad" int default null,
"fechanacim" date default null, 
"telefono" varchar (10) default null,
"correo" varchar (50) default null,
"nacionalid" varchar (50) default null,
"sexo" int default null,
"codestado" int not null
);

create table administrativo 
(
"codadministra" varchar (15) primary key not null,
"numcontratadm" int default null,
"fechcontrat" date default null,
"cargo" varchar (50) default null,
"usuario" varchar(50) default null,
"codpersona" int not null,
"codestado" int not null
);
create table auxiliar
(
"codauxil" varchar (15) primary key not null,
"numcontrataux" int default null,
"codpersona" int not null,
"codestado" int not null
);
create table veterinario 
(
"codveterin" varchar (15 )primary key not null,
"especialidad" varchar (50) default null,
"sueldo" int default null,
"codpersona" int not null,
"codestado" int not null 
);

create table duenio
(
"codduenio" varchar (15) primary key not null,
"nit" int default null,
"ocupacionduen" varchar (50) default null,
"codpersona" int not null,
"codestado" int not null
);

create table solicita 
(
"codsolict" varchar (15) primary key not null,
"fechsolict" date default null,
"horasolict" time default null,
"codduenio" int not null,
"codservicio" int not null,
"codestado" int not null
);


create table servicio
(
"codserv" varchar (15) primary key not null,
"descripserv" varchar (50) default null,
"fechserv" date default null,
"horaserv" time default null,
"designserv" varchar (50) default null,
"codpres" int not null,
"codestado" int not null
);

create table asiste
(
"codasist" varchar (15) primary key not null,
"fechasist" date default null,
"descripasist" varchar (50) default null,
"codanimal" int not null,
"codserv" int not null,
"codveterin" int not null,
"codestado" int not null
);

create table animal 
(
"codanimal" varchar (15) primary key not null,
"nombreanim" varchar (50) default null,
"edadanim" int  default null,
"pesoanim" int  default null,
"tamanioanim" int  default null,
"coloranim" varchar (20)  default null,
"descripanim" varchar (50)  default null,
"codraza" int not null,
"codestado" int not null
);

create table hospeda
(
"codhosped" varchar (15) primary key not null,
"fechingre" date default null,
"fechsalid" date default null,
"codanimal" int not null,
"codceld" int not null,
"codestado" int not null
);

create table celda
(
"codceld" varchar (15) primary key not null,
"numceld" int default null,
"altceld" int default null,
"espesceld" int default null,
"codestado" int not null
);

create table reguistra
(
"codreguist" varchar (15) primary key not null,
"descripreguist" varchar (50) default null,
"fechreguist" date default null,
"horareguist" time default null,
"codadministra" int not null,
"codserv" int not null,
"codestado" int not null
);

create table posee
(
"codpos" varchar (15) primary key not null,
"descrippos" varchar (50) default null,
"fechpos" date default null,
"codpersona" int not null,
"coddirec" int not null,
"codestado" int not null
);

create table precio
(
"codpres" varchar (15) primary key not null,
"descrippres" varchar (50) default null,
"prestotal" int default null,
"codmedicam" int not null,
"codestado" int not null
);

create table raza
(
"codraz" varchar (15) primary key not null,
"descripraz" varchar (50) default null,
"nacioraz" varchar (20) default null,
"codestado" int not null
);

create table emergencia
(
"codemerg" varchar (15) primary key not null,
"fechingemer" date default null,
"fechsalemeg" date default null,
"motivemerg" varchar (50) default null,
"codanimal" int not null,
"codveterin" int not null
);

create table adquiere
(
"codadqui" varchar (15) primary key not null,
"fechadqui" date default null,
"descripadqui" varchar (50) default null,
"codadimnistra" int not null,
"codmedicam" int not null
);

create table medicamento
(
"codmedicam" varchar (15) primary key not null,
"descripmedicam" varchar (50) default null,
"stockmedicam" int default null,
"fechvencimedicam" date default null,
"costomedicam" int default null,
"codestado" int not null
);
create table suministra
(
"codsuminist" varchar (15) primary key not null,
"presiosuminist" int default null,
"fechcompra" date default null,
"descripsuminist" varchar (50) default null,
"codmedicam" int not null,
"codproveed"int not null,
"codestado" int not null
);

create table proveedor
(
"codprovee" varchar (15) primary key not null,
"nombencarg" varchar (50) default null,
"numerencarg"int default null,
"nombempre" varchar (50) default null,
"codsuminist" int not null,
"coddirec" int not null,
"codestado" int not null
);

create table direccion
(
"coddirec" varchar (15) primary key not null,
"zona" varchar (50) default null
"numero" int default null,
"calle" varchar (50) default null,
"avenida" varchar (50) default null,
"codestado" int not null
);

postgres

laves foraneas 

laves foraneas de llamado a codpersona
alter table administrativo add constraint codpersona  foreign key (codpersona) references persona (codpersona) on delete cascade on update cascade
alter table auxiliar add constraint codpersona  foreign key (codpersona) references persona (codpersona) on delete cascade on update cascade
alter table veterinario add constraint codpersona  foreign key (codpersona) references persona (codpersona) on delete cascade on update cascade
alter table duenio add constraint codpersona  foreign key (codpersona) references persona (codpersona) on delete cascade on update cascade
alter table posee add constraint codpersona  foreign key (codpersona) references persona (codpersona) on delete cascade on update cascade

laves foraneas de llamado a codserv
alter table reguistra add constraint codserv  foreign key (codserv) references servicio (codserv) on delete cascade on update cascade
alter table solicita add constraint codserv  foreign key (codserv) references servicio (cpdserv) on delete cascade on update cascade
alter table asiste add constraint codserv  foreign key (codserv) references servicio (codserv) on delete cascade on update cascade

llaves foranear de llamado a codadministra
alter table reguistra add constraint codadministra  foreign key (codadministra) references administrativo (codadministra) on delete cascade on update cascade
alter table adquiere add constraint codadministra  foreign key (codadministra) references administrativo (codadministra) on delete cascade on update cascade

llaves foraneas de llamado a codanimal
alter table asiste add constraint codanimal  foreign key (codanimal) references animal (codanimal) on delete cascade on update cascade
alter table hospeda add constraint codanimal  foreign key (codanimal) references animal (codanimal) on delete cascade on update cascade

alter table solicita add constraint codduenio  foreign key (codduenio) references duenio (codduenio) on delete cascade on update cascade

alter table servicio add constraint codpres  foreign key (codpres) references presio (codpres) on delete cascade on update cascade

alter table asiste add constraint codveterin  foreign key (codveterin) references veterinario (codveterin) on delete cascade on update cascade

alter table animal add constraint codraz  foreign key (codraz) references raza (codraz) on delete cascade on update cascade

alter table hospeda add constraint codceld  foreign key (codceld) references celda (codceld) on delete cascade on update cascade

alter table adquiere add constraint codmedicam  foreign key (codmedicam) references medicamento (codmedicam) on delete cascade on update cascade


para la insersion de datos 

insert into persona
values (创,创,创,创,创,创,创,创,创,创,);

para eliminar la tabls 
drop table persona;



create table solicita 
(
codsolicita  varchar (15) primary key,
fechasoli date default null,
coddue駉 int not null,
codservicio int not null
);


alter table solicita add constraint fk_codservicio foreign key (codservicio) references servicio(codservicio)on delete cascade on update cascade;
alter table veterinario add constraint fk_codpersona foreign key (cod_persona) references persona(cod_persona) on delete cascade on update cascade;

alter table administrativo add constraint fk_codpersona foreign key (codpersona) references nacionalidad (codpersona) on delete cascade on update cascade;
