create function addadquiere(
	pk int,
	c1 varchar(15),
	c2 varchar(15),
	c3 int,
	c4 date,
	c5 varchar(50)
)returns void as
$body$
begin
insert into adquiere values( pk, c1, c2, c3, c4, c5, 1);
end;
language plpgsql;

create function editadquiere(
	pk int,
	c1 varchar(15),
	c2 varchar(15),
	c3 int,
	c4 date,
	c5 varchar(50)
)returns void as
$body$
begin
update adquiere set codadministrativo = c1, codmedicamento = c2, cantidad = c3, fecha = c4, descripcion = c5 where codadquiere = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteadquiere(
	pk int
)returns void as
$body$
begin
update adquiere set codestado = 0 where codadquiere = pk and codestado !=0;
end;
$body$
language plpgsql;

create function searchadquiere(
	pk int
)returns void as
$body$
begin
select * from adquiere where codadquiere = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado y corregido por erick
