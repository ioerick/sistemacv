create function registra_add(
  pk int,
  c1 varchar(15),
  c2 varchar(15),
  c3 date,
  c4 varchar(50)
) returns void as
$body$
begin
insert into registra values (pk, c1, c2, c3, c4, 1);
end;
$body$
language plpgsql;

create function registra_edit(
  pk int,
  c1 varchar(15),
  c2 varchar(15),
  c3 date,
  c4 varchar(50)
) returns void as
$body$
begin
update registra set codadministrativo = c1, codservicio = c2, fecha = c3, descripcion = c4 where codregistra = pk and codestado != 0;
end;
$body$
language plpgsql;

create function registra_delete(
  pk int
) returns void as
$body$
begin
update registra set codestado = 0 where codregistra = pk and codestado != 0;
end;
$body$
language plpgsql;

create function registra_search(
  pk int
) returns void as
$body$
begin
select * from registra where codregistra = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
