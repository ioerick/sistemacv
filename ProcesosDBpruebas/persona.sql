create function  addpersona(
  codpersona varchar(15),
  nombre varchar(50),
  apellidopaterno date,
  apellidomaterno time,
  ci int,
  edad int,
  fechanacimiento date,
  codtelefono int,
  codcorreo int,
  codnacion int,
  codsexo int,
  codestado int
) returns void as
$body$
begin
insert into persona values (codpersona, nombre, apellidopaterno, apellidomaterno, ci, edad, fechanacimiento, codtelefono, codcorreo, codnacion, codsexo, codestado);
end;
$body$
language plpgsql;

create function editpersona(
  pk varchar(15),
  nom varchar(50),
  app varchar(50),
  apm varchar(50),
  ci  varchar(15),
  ed int,
  pktel varchar(15),
  pkcor varchar(15),
  pknac varchar(15)
) returns void as
$body$
begin
update persona set pk = codpersona, nom = nombre, app = apellidopaterno, apm = apellidomaterno, ci = ci , ed = edad    where codpersona = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletepersona(
  pk varchar(15),
) returns void as
$body$
begin
update persona set codestado = 0 where codpersona = pk;
end;
$body$
language plpgsql;

create function searchpersona(
  pk varchar(15),
) returns void as
$body$
begin
select * from persona where codpersona = pk and codestado != 0;
end;
$body$
language plpgsql;