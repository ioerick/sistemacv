create function addocupacion(
  pk varchar(15),
  c1 varchar(15),
  c2 int
) returns void as
$body$
begin
insert into ocupacaion values (pk, c1, c2);
end;
$body$
language plpgsql;

create function editocupacion(
  pk varchar(15),
  c1 varchar(15),
) returns void as
$body$
begin
update ocupacion set descripcion = c1 where codocupacion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteocupacion(
  pk varchar(15),
) returns void as
$body$
begin
update ocupacion set codestado = 0 where codocupacion = pk;
end;
$body$
language plpgsql;

create function searchocupacion(
  pk varchar(15),
) returns void as
$body$
begin
select * from ocupacion where codocupacion = pk and codestado != 0;
end;
$body$
language plpgsql;