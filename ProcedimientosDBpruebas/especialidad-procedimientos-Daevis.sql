create function addespecilidad(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
insert into especialidad values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editespecilidad(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update especilidad set descripcion = c1 where codespecilidad = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteespecilidad(
  pk varchar(15)
) returns void as
$body$
begin
update especilidad set codestado = 0 where codespecilidad = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchespecilidad(
  pk varchar(15)
) returns void as
$body$
begin
select * from especilidad where codespecialidad = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido por erick
