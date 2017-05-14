create function addraza(
  pk varchar(15),
  c1 varchar(30)
) returns void as
$body$
begin
insert into raza values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editraza(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update raza set descripcion = c1 where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteraza(
  pk varchar(15)
) returns void as
$body$
begin
update raza set codestado = 0 where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchraza(
  pk varchar(15)
) returns void as
$body$
begin
select * from raza where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido por erick
