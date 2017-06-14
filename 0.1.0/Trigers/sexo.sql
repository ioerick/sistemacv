CREATE or replace FUNCTION registrar_insert() RETURNS trigger AS $body$
BEGIN
insert into historial_actividades (accion, usuario, tabla, campo) values (3, 'insert', 'sexo', NEW.codsexo);
RETURN NEW;
END;
$body$
LANGUAGE plpgsql;

CREATE TRIGGER registrar_insert
BEFORE INSERT
ON sexo FOR EACH ROW
EXECUTE PROCEDURE registrar_insert();


CREATE or replace FUNCTION registrar_update() RETURNS trigger AS $body$
BEGIN
insert into historial_actividades values (4, 'update', 'sexo', NEW.codsexo);
RETURN NEW;
END;
$body$
LANGUAGE plpgsql;

CREATE TRIGGER registrar_update
BEFORE update
ON sexo FOR EACH ROW
EXECUTE PROCEDURE registrar_update();
