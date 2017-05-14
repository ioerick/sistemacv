create function adddirecion(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(7),
  c3 varchar(30)
) returns void as
$body$
begin
insert into sexo values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function editdirecion(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(7),
  c3 varchar(30)
) returns void as
$body$
begin
update direcion set zona = c1 numero = c2 calle = c3 where coddirecion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletedirecion(
  pk varchar(15)
) returns void as
$body$
begin
update direcion set codestado = 0 where coddirecion = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchdirecion(
  pk varchar(15)
) returns void as
$body$
begin
select * from direcion where coddirecion = pk and codestado != 0;
end;
$body$
language plpgsql;
