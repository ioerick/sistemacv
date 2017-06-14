create function solicita_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 date,
  user varchar(15)
) returns void as
$body$
begin
insert into solicita values (pk, c1, c2, c3, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'solicita', pk);
end;
$body$
language plpgsql;

create function solicita_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 date,
  user varchar(15)
) returns void as
$body$
begin
update solicita set coddueno = c1, codservicio = c2, fecha = c3 where codsolicita = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'solicita', pk);
end;
$body$
language plpgsql;

create function solicita_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update solicita set codestado = 0 where codsolicita = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'solicita', pk);
end;
$body$
language plpgsql;

create function solicita_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from solicita where codsolicita = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'solicita', pk);
end;
$body$
language plpgsql;

create function solicita_view(
) returns void as
$body$
begin
select * from solicita where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
