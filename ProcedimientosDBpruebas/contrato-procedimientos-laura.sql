create function addcontrato(
  pk varchar(15) not null,
  c1 varchar(50) not null,
  c2 date not null,
  c3 date not null
) returns void as
$body$
begin
insert into contrato values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function editcontrato(
  pk varchar(15)  not null,
  c1 varchar(50) not null,
  c2 date not null,
  c3 date not null
) returns void as
$body$
begin
update contrato set descripcion = c1 where codcontrato = pk and fechainicio = c2 and fechafinal = c3 and codestado != 0;
end;
$body$
language plpgsql;

create function deletecontrato(
  pk varchar(15)  not null,
  c1 varchar(50) not null,
  c2 date not null,
  c3 date not null
) returns void as
$body$
begin
update contrato set codestado = 0 where codcontrato = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchcontrato(
  pk varchar(15)  not null,
  c1 varchar(50) not null,
  c2 date not null,
  c3 date not null
) returns void as
$body$
begin
select * from contrato where codcontrato = pk and codestado != 0;
end;
$body$
language plpgsql;
