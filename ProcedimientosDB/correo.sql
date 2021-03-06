create function correo_add(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into correo values (pk, c1, 1);
end;
$body$
language plpgsql;

create function correo_edit(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update correo set descripcion = c1 where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function correo_delete(
  pk varchar(15)
) returns void as
$body$
begin
update correo set codestado = 0 where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function correo_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from correo where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
