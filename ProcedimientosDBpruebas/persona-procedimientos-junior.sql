create function  addpersona(
  pk varchar(15),
  c1 varchar(50),
  c2 varchar(50),
  c3 varchar(50),
  c4 varchar(15),
  c5 date,
  c6 varchar(15),
  c7 varchar(15),
  c8 varchar(15),
  c9 varchar(15)
) returns void as
$body$
begin
insert into persona values (pk, c1, c2, c3, c4, c5, c6, c7, c8, c9, 1);
end;
$body$
language plpgsql;

create function editpersona(
  pk varchar(15),
  c1 varchar(50),
  c2 varchar(50),
  c3 varchar(50),
  c4 varchar(15),
  c5 date,
  c6 varchar(15),
  c7 varchar(15),
  c8 varchar(15),
  c9 varchar(15)
) returns void as
$body$
begin
update persona set nombre = c1, apellidopaterno = c2, apellidomaterno = c3, ci = c4, fechanacimiento = c5, codtelefono = c6, codcorreo = c7, codnacion = c8, codsexo = c9 where codpersona = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletepersona(
  pk varchar(15)
) returns void as
$body$
begin
update persona set codestado = 0 where codpersona = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchpersona(
  pk varchar(15)
) returns void as
$body$
begin
select * from persona where codpersona = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido y probado por erick
