create function suministra_add(
  pk varchar(15),
  c1 varchar (15),
  c2 varchar (15),
  c3 int,
  c4 date,
  c5 varchar (50),
  usuario varchar(15)
) returns void as
$body$
begin
insert into suministra values (pk,c1, c2, c3, c4, c5, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'suministra', pk);
end;
$body$
language plpgsql;

create function suministra_edit(
  pk varchar(15),
  c1 varchar (15),
  c2 varchar (15),
  c3 int,
  c4 date,
  c5 varchar (50),
  usuario varchar(15)
) returns void as
$body$
begin
update suministra set codmedicamento = c1 , codproveedor = c2, cantidad = c3, fecha = c4 , descripcion = c5 where codsuministra = pk and codestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'suministra', pk);
end;
$body$
language plpgsql;

create function suministra_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update suministra set codestado = 0 where codsuministra = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'suministra', pk);
end;
$body$
language plpgsql;

create function suministra_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from suministra where codsuministra = pk and cosestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'suministra', pk);
end;
$body$
language plpgsql;

create function suministra_view(
) returns void as
$body$
begin
select * from suministra where cosestado !=0;
end;
$body$
language plpgsql;

--probado por erick
