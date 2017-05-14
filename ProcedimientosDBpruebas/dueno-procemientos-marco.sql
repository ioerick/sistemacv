create function adddueno(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(30),
  c3 varchar(15)
) returns void as
$body$
insert into dueno values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function editdueno(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(30),
  c3 varchar(15)
) returns void as
$body$
begin
update dueno set codpersona = c1, nit = c2, ocupacion = c3 where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletedueno(
  coddueno varchar(15)
) returns void as
$body$
begin
update dueno set codestado = 0 where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchdueno(
  coddueno varchar(15)
) returns void as
$body$
begin
select * from dueno where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido por erick
