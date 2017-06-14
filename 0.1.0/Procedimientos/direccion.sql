create function direcion_add(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(7),
  c3 varchar(30),
  usuario varchar(15),
) returns void as
$body$
begin
insert into direcion values (pk, c1, c2, c3, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'direccion', pk);
end;
$body$
language plpgsql;

create function direcion_edit(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(7),
  c3 varchar(30),
  usuario varchar(15)
) returns void as
$body$
begin
update direcion set zona = c1, numero = c2, calle = c3 where coddirecion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'direccion', pk);
end;
$body$
language plpgsql;

create function direcion_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update direcion set codestado = 0 where coddirecion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'direccion', pk);
end;
$body$
language plpgsql;

create function direcion_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from direcion where coddirecion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'direccion', pk);
end;
$body$
language plpgsql;

create function direccion_view(
) returns void as
$body$
begin
select * from direccion where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
