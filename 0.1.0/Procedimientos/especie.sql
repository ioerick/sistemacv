create function especie_add(
  pk varchar(15),
  c1 varchar(50),
  user varchar(15)
) returns void as
$body$
begin
insert into especie values (pk, c1, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'especie', pk);
end;
$body$
language plpgsql;

create function especie_edit(
  pk varchar(15),
  c1 varchar(50),
  user varchar(15)
) returns void as
$body$
begin
update especie set descripcion = c1 where codespecie = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'especie', pk);
end;
$body$
language plpgsql;

create function especie_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update especie set codestado = 0 where codespecie = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'especie', pk);
end;
$body$
language plpgsql;

create function especie_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from especie where codespecie = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'especie', pk);
end;
$body$
language plpgsql;

create function especie_view(
) returns void as
$body$
begin
select * from especie where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
