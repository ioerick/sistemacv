create function proveedor_add(
  pk varchar (15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 varchar (15),
  user varchar(15)
) returns void as
$body$
begin
insert into proveedor values (pk, c1, c2, c3, c4, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'proveedor', pk);
end;
$body$
language plpgsql;

create function proveedor_edit(
  pk varchar (15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 varchar (15),
  user varchar(15)
) returns void as
$body$
begin
update proveedor set codempresa = c1 , coddireccion = c2 , codcorreo = c3, codtelefono = c4 where codproveedor = pk and codestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'proveedor', pk);
end;
$body$
language plpgsql;

create function proveedor_delete(
  pk varchar (15),
  user varchar(15)
) returns void as
$body$
begin
update proveedor set codestado = 0 where codproveedor = pk and codestado != 0 ;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'proveedor', pk);
end;
$body$
language plpgsql;

create function proveedor_search(
  pk varchar (15),
  user varchar(15)
) returns void as
$body$
begin
select * from proveedor where codproveedor = pk and codestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'proveedor', pk);
end;
$body$
language plpgsql;

create function proveedor_view(
) returns void as
$body$
begin
select * from proveedor where codestado !=0;
end;
$body$
language plpgsql;

--probado por erick
