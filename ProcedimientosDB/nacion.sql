create function nacion_add(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
insert into nacion values (pk, c1, 1);
end;
$body$
language plpgsql;

create function nacion_edit(
  pk varchar(15),
  c1 varchar(50)
) returns void as
$body$
begin
update nacion set descripcion = c1 where codnacion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function nacion_delete(
  pk varchar(15)
) returns void as
$body$
begin
update nacion set codestado = 0 where codnacion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function nacion_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from nacion where codnacion = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
