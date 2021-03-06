create function asiste_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15),
  c5 date,
  c6 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into asist values (pk, c1, c2, c3, c4, c5, c6, 1);
  insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'asiste', pk);
end;
$body$
language plpgsql;

create function asiste_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15),
  c5 date,
  c6 varchar(50),
  usuario varchar(15)
) returns void as
$body$
begin
update asiste set codanimal = c1, codservicio = c2, codveterinario = c3, codauxiliar = c4, fecha = c5, descripcion = c6 where codasiste = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'asiste', pk);
end;
$body$
language plpgsql;

create function asiste_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update asiste set codestado = 0 where codasiste = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'asiste', pk);
end;
$body$
language plpgsql;

create function asiste_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from asiste where codasiste = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'asiste', pk);
end;
$body$
language plpgsql;

create function asiste_view(
) returns void as
$body$
begin
select * from asiste where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
