create function addtamano(
  pk varchar(15),
  c1 varchar(15),
  c2 int
) returns void as
$body$
begin
insert into tamano values (pk, c1, c2);
end;
$body$
language plpgsql;

create function edittamano(
  pk varchar(15),
  c1 varchar(15),
) returns void as
$body$
begin
update tamano set descripcion = c1 where codtamano = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletetamano(
  pk varchar(15),
) returns void as
$body$
begin
update tamano set codestado = 0 where codtamano = pk;
end;
$body$
language plpgsql;

create function searchtamano(
  pk varchar(15),
) returns void as
$body$
begin
select * from tamano where codtamano = pk and codestado != 0;
end;
$body$
language plpgsql;