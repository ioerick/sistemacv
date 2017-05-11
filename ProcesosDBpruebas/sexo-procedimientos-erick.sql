create function addsexo(
  pk varchar(15) not null,
  c1 varchar(15) not null,
) returns void as
$body$
begin
insert into sexo values (pk, c1, 1);
end;
$body$
language plpgsql;

create function editsexo(
  pk varchar(15)  not null,
  c1 varchar(15)  not null,
) returns void as
$body$
begin
update sexo set descripcion = c1 where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletesexo(
  pk varchar(15)  not null
) returns void as
$body$
begin
update sexo set codestado = 0 where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchsexo(
  pk varchar(15)  not null,
) returns void as
$body$
begin
select * from sexo where codsexo = pk and codestado != 0;
end;
$body$
language plpgsql;
