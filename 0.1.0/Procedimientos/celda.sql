create function celda_add(
  pk varchar(15),
  c1 varchar(5),
  user varchar(15)
) returns void as
$body$
begin
insert into celda values (pk, c1, 1);
  insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'celda', pk);
end;
$body$
language plpgsql;

create function celda_edit(
  pk varchar(15),
  c1 varchar(3),
  user varchar(15)
) returns void as
$body$
begin
update celda set numero = c1 where codcelda = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'celda', pk);
end;
$body$
language plpgsql;

create function celda_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update celda set codestado = 0 where codcelda = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'celda', pk);
end;
$body$
language plpgsql;

create function celda_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from celda where codcelda = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'celda', pk);
end;
$body$
language plpgsql;

create function celda_view(
) returns void as
$body$
begin
select * from celda where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
