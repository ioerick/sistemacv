create table tamano(
  codtamano varchar(15) not null primary key,
  descripcion varchar(30) not null,
  codestado int not null default 1 references estado(codestado)
);
INSERT INTO tamano(codtamano,descripcion,codestado)
VALUES ('tam02','grande',-1)
select *from tamano
---  creando la función trigger (PL/PGSQL)
--- 
CREATE FUNCTION validar_estado() RETURNS trigger AS $val_cant$      
BEGIN
	IF NEW.codestado IS NULL THEN       --- valores del trigger, esto puede ser  nuevo o viejo "NEW u OLD"
		RAISE EXCEPTION 'El estado, no debe ser nulo';
	END IF;
	IF NEW.codestado < 0 THEN
		RAISE EXCEPTION 'El estado debe ser igual 1 o 0';
	END IF;
	RETURN NEW;
END;
$val_cant$ 
LANGUAGE plpgsql;

--- 
CREATE TRIGGER validacion_de_estado
BEFORE INSERT OR UPDATE      -- es el momento de ejecución que puede ser "BEFORE o AFTER", seguido por el EVENTO "INSERT O UPDATE O DELETE"
ON tamano FOR EACH ROW     --  en ON seguimos con el nombre de la tabla en FOR EACH se define "ROW O STATEMENT" lo que determina cuantas veces se debe ejecutar el cuerpo de trigger
EXECUTE PROCEDURE validar_estado();

--=================================================================================================================--
--================================================EMPRESA=================================================================--
create table empresa(
  codempresa varchar(15) not null primary key,
  descripcion varchar(50) not null,
  codestado int not null default 1 references estado(codestado)
);
INSERT INTO empresa(codempresa,descripcion,codestado)
VALUES ('emp02','Rojo',-1)

CREATE TRIGGER validacion_de_estado
BEFORE INSERT OR UPDATE      -- es el momento de ejecución que puede ser "BEFORE o AFTER", seguido por el EVENTO "INSERT O UPDATE O DELETE"
ON empresa FOR EACH ROW     --  en ON seguimos con el nombre de la tabla en FOR EACH se define "ROW O STATEMENT" lo que determina cuantas veces se debe ejecutar el cuerpo de trigger
EXECUTE PROCEDURE validar_estado();
--================================================FIN EMPRESA=================================================================--
--===================================================COLOR==============================================================--
create table color(
  codcolor varchar(15) not null primary key,
  descripcion varchar(30) not null,
  codestado int not null default 1 references estado(codestado)
);

INSERT INTO color(codcolor,descripcion,codestado)
VALUES ('col02','Rojo',-1)

CREATE TRIGGER validacion_de_estado
BEFORE INSERT OR UPDATE      -- es el momento de ejecución que puede ser "BEFORE o AFTER", seguido por el EVENTO "INSERT O UPDATE O DELETE"
ON color FOR EACH ROW     --  en ON seguimos con el nombre de la tabla en FOR EACH se define "ROW O STATEMENT" lo que determina cuantas veces se debe ejecutar el cuerpo de trigger
EXECUTE PROCEDURE validar_estado();
--=============================================FIN COLOR====================================================================--
--==============================================ESPECIALIDAD=====================================================================--
create table especialidad(
  codespecialidad varchar(15) not null primary key,
  descripcion varchar(50) not null,
  codestado int not null default 1 references estado(codestado)
);

INSERT INTO especialidad(codespecialidad,descripcion,codestado)
VALUES ('esp01','General',1)
select *from especialidad
---  creando la función trigger (PL/PGSQL)
--- 
--- 
CREATE TRIGGER validacion_de_estado
BEFORE INSERT OR UPDATE      -- es el momento de ejecución que puede ser "BEFORE o AFTER", seguido por el EVENTO "INSERT O UPDATE O DELETE"
ON especialidad FOR EACH ROW     --  en ON seguimos con el nombre de la tabla en FOR EACH se define "ROW O STATEMENT" lo que determina cuantas veces se debe ejecutar el cuerpo de trigger
EXECUTE PROCEDURE validar_estado();
--=================================================FIN ESPECIALIDAD================================================================--
--=======================================================OCUPACION==================================================================--
create table ocupacion(
  codocupacion varchar(15) not null primary key,
  descripcion varchar(50) not null,
  codestado int not null default 1 references estado(codestado)
);

INSERT INTO ocupacion(codocupacion,descripcion,codestado)
VALUES ('ocu02','Enfermero Veterinario',-1)

CREATE TRIGGER validacion_de_estado
BEFORE INSERT OR UPDATE      -- es el momento de ejecución que puede ser "BEFORE o AFTER", seguido por el EVENTO "INSERT O UPDATE O DELETE"
ON ocupacion FOR EACH ROW     --  en ON seguimos con el nombre de la tabla en FOR EACH se define "ROW O STATEMENT" lo que determina cuantas veces se debe ejecutar el cuerpo de trigger
EXECUTE PROCEDURE validar_estado();
--======================================================FIN OCUPACION===========================================================--

