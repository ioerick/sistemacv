create function solicita_add(
  pk int,
  c1 varchar(15),
  c2 varchar(15),
  c3 date
) returns void as
$body$
begin
insert into solicita values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function solicita_edit(
  pk int,
  c1 varchar(15),
  c2 varchar(15),
  c3 date
) returns void as
$body$
begin
update solicita set coddueno = c1, codservicio = c2, fecha = c3 where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;

create function solicita_delete(
  pk int
) returns void as
$body$
begin
update solicita set codestado = 0 where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;

create function solicita_search(
  pk int
) returns void as
$body$
begin
select * from solicita where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
