create function addproveedor(
  pk varchar (15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 varchar (15)
) returns void as
$body$
begin
insert into proveedor values (pk, c1, c2, c3, c4, 1);
end;
$body$
language plpgsql;

create function editproveedor(
  pk varchar (15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 varchar (15)
) returns void as
$body$
begin
update proveedor set codempresa = c1 , coddireccion = c2 , codcorreo = c3 codtelefono = c4 where codproveedor = pk and codestado !=0;
end;
$body$
language plpgsql;

create function deleteproveedor(
  pk varchar (15)
) returns void as
$body$
begin
update proveedor set codestado = 0 where codproveedor = pk and codestado != 0 ;
end;
$body$
language plpgsql;

create function searchproveedor(
  pk varchar (15)
) returns void as
$body$
begin
select * from proveedor where codproveedor = pk and codestado !=0;
end;
$body$
language plpgsql;

--corregido y probado por erick
