create function ocupacion_add(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
insert into ocupacaion values (pk, c1, 1);
end;
$body$
language plpgsql;

create function ocupacion_edit(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
update ocupacion set descripcion = c1 where codocupacion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function ocupacion_delete(
  pk varchar(15)
) returns void as
$body$
begin
update ocupacion set codestado = 0 where codocupacion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function ocupacion_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from ocupacion where codocupacion = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
