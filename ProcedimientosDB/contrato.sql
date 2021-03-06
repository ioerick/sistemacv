create function contrato_add(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 date
) returns void as
$body$
begin
insert into contrato values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function contrato_edit(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 date
) returns void as
$body$
begin
update contrato set descripcion = c1, fechainicio = c2, fechafinal = c3 where codcontrato = pk and codestado != 0;
end;
$body$
language plpgsql;

create function contrato_delete(
  pk varchar(15)
) returns void as
$body$
begin
update contrato set codestado = 0 where codcontrato = pk and codestado != 0;
end;
$body$
language plpgsql;

create function contrato_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from contrato where codcontrato = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
