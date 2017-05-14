create function addcorreo(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into correo values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editcorreo(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update sexo set descripcion = c1 where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletecorreo(
  pk varchar(15)
) returns void as
$body$
begin
update sexo set codestado = 0 where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchcorreo(
  pk varchar(15)
) returns void as
$body$
begin
select * from sexo where codcorreo = pk and codestado != 0;
end;
$body$
language plpgsql;
