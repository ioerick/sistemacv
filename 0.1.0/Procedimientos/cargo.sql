create function cargo_add(
  pk varchar(15),
  c1 varchar(15),
  user varchar(15)
) returns void as
$body$
begin
insert into cargo values (pk, c1, 1);
  insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'cargo', pk);
end;
$body$
language plpgsql;

create function cargo_edit(
  pk varchar(15),
  c1 varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update cargo set descripcion = c1 where codcargo = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'cargo', pk);
end;
$body$
language plpgsql;

create function cargo_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update cargo set codestado = 0 where codcargo = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'cargo', pk);
end;
$body$
language plpgsql;

create function cargo_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from cargo where codcargo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'cargo', pk);
end;
$body$
language plpgsql;

create function cargo_view(
) returns void as
$body$
begin
select * from cargo where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
