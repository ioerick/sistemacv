create function sexo_add(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
insert into sexo values (pk, c1, 1);
end;
$body$
language plpgsql;

create function sexo_edit(
  pk varchar(15),
  c1 varchar(15)
) returns void as
$body$
begin
update sexo set descripcion = c1 where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function sexo_delete(
  pk varchar(15)
) returns void as
$body$
begin
update sexo set codestado = 0 where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function sexo_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from sexo where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
