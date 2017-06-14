create function tamano_add(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into tamano values (pk, c1, 1);
end;
$body$
language plpgsql;

create function tamano_edit(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update tamano set descripcion = c1 where codtamano = pk and codestado != 0;
end;
$body$
language plpgsql;

create function tamano_delete(
  pk varchar(15)
) returns void as
$body$
begin
update tamano set codestado = 0 where codtamano = pk and codestado != 0;
end;
$body$
language plpgsql;

create function tamano_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from tamano where codtamano = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
