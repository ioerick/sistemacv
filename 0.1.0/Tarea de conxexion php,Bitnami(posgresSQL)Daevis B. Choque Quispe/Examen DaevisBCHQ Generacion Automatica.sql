//=================================Funcion Gllobal para en campo DESCRIPCION=======================================================//   
CREATE or Replace FUNCTION validar_descripcion() RETURNS trigger AS $$      
BEGIN

	IF NEW.descripcion IS NULL THEN   --- valores del trigger, esto puede ser  nuevo o viejo "NEW u OLD"
		RAISE EXCEPTION 'la descripcion, no debe ser nulo';
	END IF;

	RETURN NEW;

END;
$$ 
LANGUAGE plpgsql;
//=============================validar descripcion para COLOR===========================================================//
CREATE TRIGGER validacion_de_descripcion 
BEFORE INSERT OR UPDATE    
ON color FOR EACH ROW 
EXECUTE PROCEDURE validar_descripcion();
//===================================validad descripcion para ESPECIALIDAD=====================================================//
CREATE TRIGGER validacion_de_descripcion 
BEFORE INSERT OR UPDATE    
ON especialidad FOR EACH ROW 
EXECUTE PROCEDURE validar_descripcion();

//======================================validad descripcion para  OCUPACION=================================================//
CREATE TRIGGER validacion_de_descripcion 
BEFORE INSERT OR UPDATE    
ON ocupacion FOR EACH ROW 
EXECUTE PROCEDURE validar_descripcion();

//======================================validad descripcion para TAMAÑO=================================================//
CREATE TRIGGER validacion_de_descripcion 
BEFORE INSERT OR UPDATE    
ON empresa FOR EACH ROW 
EXECUTE PROCEDURE validar_descripcion();

//==================================Genera codigo para Color=====================================================//
create or replace function codigo_genera_servicio() returns trigger as $$
begin
	new.codcolor := (select 'colr'||ltrim(lpad(to_char(coalesce(max(to_number(substring(codcolor,5,5),'9999'))+1,'0'),'0000'),5,'0'))
		from color);
	if new.codcolor is null then
		raise exception 'servicio introdusca un balor cannot be null value';
	end if;
return new;
end;
$$ language plpgsql;

create trigger secuencia_de_codigo_color
before insert on color
for each row execute procedure codigo_genera_servicio()

insert into color values('','',1)
select *from color
delete from color where codcolor = 'colr0002'
//====================================================================================//
//==================================Genera codigo para Especialidad=====================================================//
create or replace function codigo_genera_especialidad() returns trigger as $$
begin
	if new.codespecialidad is null then
		raise exception 'servicio introdusca un balor cannot be null value';
	end if;

	
	new.codespecialidad := (select 'espl'||ltrim(lpad(to_char(coalesce(max(to_number(substring(codespecialidad,5,5),'9999'))+1,'0'),'0000'),5,'0'))

		from especialidad);

return new;
end;
$$ language plpgsql;

create trigger secuencia_de_codigo_especialidad
before insert on especialidad
for each row execute procedure codigo_genera_especialidad()

insert into especialidad values('','verde',1)
select *from especialidad
delete from especialidad where codespecialidad = 'espl0002'
//====================================================================================//
//==================================Genera codigo para OCUPACION=====================================================//
create or replace function codigo_genera_ocupacion() returns trigger as $$
begin
	if new.codocupacion is null then
		raise exception 'servicio introdusca un balor cannot be null value';
	end if;

	
	new.codocupacion := (select 'ocup'||ltrim(lpad(to_char(coalesce(max(to_number(substring(codocupacion,5,5),'9999'))+1,'0'),'0000'),5,'0'))

		from ocupacion);

return new;
end;
$$ language plpgsql;

create trigger secuencia_de_codigo_ocupacion
before insert on ocupacion
for each row execute procedure codigo_genera_ocupacion()

insert into ocupacion values('','enfermero',1)
select *from ocupacion
delete from ocupacion where codocupacion = 'ocup0002'
//==================================Genera codigo para TAMAÑO=====================================================//
create or replace function codigo_genera_tamano() returns trigger as $$
begin
	if new.codtamano is null then
		raise exception 'servicio introdusca un balor cannot be null value';
	end if;

	
	new.codtamano := (select 'tama'||ltrim(lpad(to_char(coalesce(max(to_number(substring(codtamano,5,5),'9999'))+1,'0'),'0000'),5,'0'))

		from tamano);

return new;
end;
$$ language plpgsql;

create trigger secuencia_de_codigo_tamano
before insert on tamano
for each row execute procedure codigo_genera_tamano()

insert into tamano values('','25*55',1)
select *from tamano
delete from tamano where codtamano = 'tama0002'
//==================================Genera codigo para EMPRESA=====================================================//
create or replace function codigo_genera_empresa() returns trigger as $$
begin
	if new.codempresa is null then
		raise exception 'servicio introdusca un balor cannot be null value';
	end if;

	
	new.codempresa := (select 'empr'||ltrim(lpad(to_char(coalesce(max(to_number(substring(codempresa,5,5),'9999'))+1,'0'),'0000'),5,'0'))

		from empresa);

return new;
end;
$$ language plpgsql;

create trigger secuencia_de_codigo_empresa
before insert on empresa
for each row execute procedure codigo_genera_empresa()

insert into empresa values('','SOBOCE',1)
select *from empresa
delete from empresa where codempresa = 'empr0002'



