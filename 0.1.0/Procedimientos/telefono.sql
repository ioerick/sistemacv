create function telefono_add(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
insert into telefono values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'telefono', pk);
end;
$body$
language plpgsql;

create function telefono_edit(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update telefono set descripcion = c1 where codtelefono = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'telefono', pk);
end;
$body$
language plpgsql;

create function telefono_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update telefono set codestado = 0 where codtelefono = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'telefono', pk);
end;
$body$
language plpgsql;

create function telefono_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from telefono where codtelefono = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('serach', usuario, 'telefono', pk);
end;
$body$
language plpgsql;

create function telefono_search(
) returns void as
$body$
begin
select * from telefono where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
