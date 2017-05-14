create function  addadministrativo(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15)
) returns void as
$body$
begin
insert into administrativo values (pk, c1, c2, c3, c4, 1);
end;
$body$
language plpgsql;

create function editadministrativo(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15),
  c4 varchar(15)
) returns void as
$body$
begin
update administrativo set codpersona = c1, codcontrato = c2, codusuario = c3, cargo = c4  where codadministrativo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteadministrativo(
  pk varchar(15)
) returns void as
$body$
begin
update administrativo set codestado = 0 where codestado = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchadministrativo(
  pk varchar(15)
) returns void as
$body$
begin
select * from administrativo where codadministrativo = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado y corregido por erick
