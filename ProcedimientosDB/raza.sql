create function raza_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(30)
) returns void as
$body$
begin
insert into raza values (pk, c1, c2, 1);
end;
$body$
language plpgsql;

create function raza_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15)
) returns void as
$body$
begin
update raza set codespecie = c1, descripcion = c2 where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

create function raza_delete(
  pk varchar(15)
) returns void as
$body$
begin
update raza set codestado = 0 where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

create function raza_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from raza where codraza = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
