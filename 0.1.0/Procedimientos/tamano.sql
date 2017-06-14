create function tamano_add(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
insert into tamano values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'tamano', pk);
end;
$body$
language plpgsql;

create function tamano_edit(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update tamano set descripcion = c1 where codtamano = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'tamano', pk);
end;
$body$
language plpgsql;

create function tamano_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update tamano set codestado = 0 where codtamano = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'tamano', pk);
end;
$body$
language plpgsql;

create function tamano_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from tamano where codtamano = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'tamano', pk);
end;
$body$
language plpgsql;

create function tamano_view(
) returns void as
$body$
begin
select * from tamano where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
