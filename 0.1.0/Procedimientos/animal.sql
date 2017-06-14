create function animal_add(
  pk varchar(15),
  c1 varchar(30),
  c2 date,
  c3 float,
  c4 varchar(15),
  c5 varchar(15),
  c6 varchar(15),
  c7 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
insert into animal values (pk, c1, c2, c3, c4, c5, c6, c7, 1);
  insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'animal', pk);
end;
$body$
language plpgsql;

create function animal_edit(
  pk varchar(15),
  c1 varchar(30),
  c2 date,
  c3 float,
  c4 varchar(15),
  c5 varchar(15),
  c6 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update animal set nombre = c1, fechanacimiento = c2, peso = c3, tamano = c4, color = c5, codespecie = c6, codraza = c7 where codanimal = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'animal', pk);
end;
$body$
language plpgsql;

create function animal_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update animal set codestado = 0 where codanimal = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'animal', pk);
  end;
end;
$body$
language plpgsql;

create function animal_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from animal where codanimal = pk and codestado != 0;
nsert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'animal', pk);
end;
$body$
language plpgsql;

create function animal_view(
) returns void as
$body$
begin
select * from animal where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
