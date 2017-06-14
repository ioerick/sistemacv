create function ocupacion_add(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into ocupacaion values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'ocupacaion', pk);
end;
$body$
language plpgsql;

create function ocupacion_edit(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
update ocupacion set descripcion = c1 where codocupacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'ocupacion', pk);
end;
$body$
language plpgsql;

create function ocupacion_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update ocupacion set codestado = 0 where codocupacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'ocupacion', pk);
end;
$body$
language plpgsql;

create function ocupacion_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from ocupacion where codocupacion = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'ocupacion', pk);
end
$body$
language plpgsql;

create function ocupacion_view(
) returns void as
$body$
begin
select * from ocupacion where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
