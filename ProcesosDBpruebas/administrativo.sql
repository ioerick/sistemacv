create function  addadministrativo(
  codadministrativo varchar(15),
  codpersona varchar(15),
  codcontrato varchar(15),
  codusuario varchar (15),
  cargo varchar(15),
  codestado int
) returns void as
$body$
begin
insert into administrativo values (codadministrativo, codpersona, codusuario, cargo, ci, edad, fechanacimiento, codtelefono, codcorreo, codsexo, codestado);
end;
$body$
language plpgsql;

create function editadministrativo(
  pk varchar(15),
  pk2 varchar(15),
  pk3 varchar(15),
  pk4 varchar(15),
  cargo  varchar(15),
) returns void as
$body$
begin
update administrativo set pk = codadministrativo, pk2 = codpersona, pk3 = codcontrato, pk4 = codusuario, cargo = cargo  where codadministrativo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteadministrativo(
  pk varchar(15),
) returns void as
$body$
begin
update servicio set codestado = 0 where codadministrativo = pk;
end;
$body$
language plpgsql;

create function searchadministrativo(
  pk varchar(15),
) returns void as
$body$
begin
select * from administrativo where codadministrativo = pk and codestado != 0;
end;
$body$
language plpgsql;