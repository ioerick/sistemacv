create function empresa_add(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into empresa values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'empresa', pk);
end;
$body$
language plpgsql;

create function empresa_edit(
  pk varchar(15),
  c1 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
update empresa set descripcion = c1 where codempresa = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'empresa', pk);
end;
$body$
language plpgsql;

create function empresa_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update empresa set codestado = 0 where codempresa = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'empresa', pk);
end;
$body$
language plpgsql;

create function empresa_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from empresa where codempresa = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'empresa', pk);
end;
$body$
language plpgsql;

create function empresa_view(
) returns void as
$body$
begin
select * from empresa where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
