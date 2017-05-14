create function color_add(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into color values (pk, c1, 1);
end;
$body$
language plpgsql;

create function color_edit(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update color set descripcion = c1 where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

create function color_delete(
  pk varchar(15)
) returns void as
$body$
begin
update color set codestado = 0 where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

create function color_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from color where codcolor = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
