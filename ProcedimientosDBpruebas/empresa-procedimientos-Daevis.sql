create function addempresa(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
insert into empresa values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editempresa(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
update empresa set descripcion = c1 where codempresa = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletesexo(
  pk varchar(15)
) returns void as
$body$
begin
update empresa set codestado = 0 where codempresa = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchempresa(
  pk varchar(15)
) returns void as
$body$
begin
select * from empresa where codempresa = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido y probado por erick
