create function  servicio_add(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 time
) returns void as
$body$
begin
insert into servicio values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function servicio_edit(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 time
) returns void as
$body$
begin
update servicio set descripcion = c1, fechaservicio = c2, horaservicio = c3  where codservicio = pk and codestado != 0;
end;
$body$
language plpgsql;

create function servicio_delete(
  pk varchar(15)
) returns void as
$body$
begin
update servicio set codestado = 0 where codservicio = pk and codestado != 0;
end;
$body$
language plpgsql;

create function servicio_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from servicio where codservicio = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
