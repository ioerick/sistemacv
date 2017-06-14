create function especilidad_add(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into especialidad values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'especialidad', pk);
end;
$body$
language plpgsql;

create function especilidad_edit(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update especilidad set descripcion = c1 where codespecilidad = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'especilidad', pk);
end;
$body$
language plpgsql;

create function especilidad_delete(
  pk varchar(15),
  usuario varchar(15),
) returns void as
$body$
begin
update especilidad set codestado = 0 where codespecilidad = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'especilidad', pk);
end;
$body$
language plpgsql;

create function especilidad_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from especilidad where codespecialidad = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'especialidad', pk);
end;
$body$
language plpgsql;

create function especialidad_view(
) returns void as
$body$
begin
select * from especialidad where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
