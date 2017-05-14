create function addtelefono(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into telefono values (pk, c1, 1);
end;
$body$
language plpgsql;

create function edittelefono(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update telefono set descripcion = c1 where codtelefono = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletetelefono(
  pk varchar(15)
) returns void as
$body$
begin
update telefono set codestado = 0 where codtelefono = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchtelefono(
  pk varchar(15)
) returns void as
$body$
begin
select * from telefono where codtelefono = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido por erick
