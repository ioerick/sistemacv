create function sexo_add(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
insert into sexo values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'sexo', pk);
end;
$body$
language plpgsql;

create function sexo_edit(
  pk varchar(15),
  c1 varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update sexo set descripcion = c1 where codsexo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'sexo', pk);
end;
$body$
language plpgsql;

create function sexo_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update sexo set codestado = 0 where codsexo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'sexo', pk);
end;
$body$
language plpgsql;

create function sexo_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from sexo where codsexo = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'sexo', pk);
end;
$body$
language plpgsql;

create function sexo_view(
) returns void as
$body$
begin
select * from sexo where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
