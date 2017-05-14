create function addcargo(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into cargo values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editcargo(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update cargo set descripcion = c1 where codcargo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletecargo(
  pk varchar(15)
) returns void as
$body$
begin
update cargo set codestado = 0 where codcargo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchcargo(
  pk varchar(15)
) returns void as
$body$
begin
select * from cargo where codcargo = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido por erick
