create function nacion_add(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into nacion values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'nacion', pk);
end;
$body$
language plpgsql;

create function nacion_edit(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
update nacion set descripcion = c1 where codnacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'nacion', pk);
end;
$body$
language plpgsql;

create function nacion_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update nacion set codestado = 0 where codnacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'nacion', pk);
end;
$body$
language plpgsql;

create function nacion_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from nacion where codnacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'nacion', pk);
end;
$body$
language plpgsql;

create function nacion_view(
) returns void as
$body$
begin
select * from nacion where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
