create function addhospeda(
	pk int,
	c1 varchar(15),
	c2 varchar(15),
	c3 date,
	c4 date
)returns void as
$body$
begin
insert into hospeda values(pk, c1, c2, c3, c4, 1);
end;
$body$
language plpgsql;

create function edithospeda(
	pk int,
	c1 varchar(15),
	c2 varchar(15),
	c3 date,
	c4 date
) returns void as
$body$
begin
update hospeda set codanimal = c1, codcelda = c2, fechaentrada = c3, fechasalida = c4 where codhospeda = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletehospeda(
	pk int
)returns void as
$body$
begin
update hospeda set codestado = 0 where codhospeda = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchhospeda(
	pk int
)returns void as
$body$
begin
select * from hospeda where codhospeda = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido y probado por erick
