create function  administrativo_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15),
  user varchar(15)
) returns void as
$body$
begin
insert into administrativo values (pk, c1, c2, c3, c4, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'administrativo', pk);
end;
$body$
language plpgsql;

create function administrativo_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update administrativo set codpersona = c1, codcontrato = c2, codusuario = c3, cargo = c4  where codadministrativo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'administrativo', pk);
end;
$body$
language plpgsql;

create function administrativo_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update administrativo set codestado = 0 where codestado = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'administrativo', pk);
end;
$body$
language plpgsql;

create function administrativo_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from administrativo where codadministrativo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'administrativo', pk);
end;
$body$
language plpgsql;

create function administrativo_view(
) returns void as
$body$
begin
select * from administrativo where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
