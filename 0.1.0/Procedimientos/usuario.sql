create function usuario_add(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(30),
  user varchar(15)
) returns void as
$body$
begin
insert into usuario values (pk, c1, c2, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'usuario', pk);
end;
$body$
language plpgsql;

create function usuario_edit(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(30),
  user varchar(15)
) returns void as
$body$
begin
update usuario set usuario = c1, password = c2 where codusuario = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'usuario', pk);
end;
$body$
language plpgsql;

create function usuario_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update usuario set codestado = 0 where codusuario = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'usuario', pk);
end;
$body$
language plpgsql;

create function usuario_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from usuario where codusuario = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'usuario', pk);
end;
$body$
language plpgsql;

create function usuario_search(
) returns void as
$body$
begin
select * from usuario where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
