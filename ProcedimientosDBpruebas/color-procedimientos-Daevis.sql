create function addcolor(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into color values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editcolor(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update color set descripcion = c1 where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletecolor(
  pk varchar(15)
) returns void as
$body$
begin
update color set codestado = 0 where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchcolor(
  pk varchar(15)
) returns void as
$body$
begin
select * from color where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido y probado por erick
