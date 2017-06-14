create function dueno_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(30),
  c3 varchar(15)
) returns void as
$body$
begin
insert into dueno values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function dueno_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(30),
  c3 varchar(15)
) returns void as
$body$
begin
update dueno set codpersona = c1, nit = c2, ocupacion = c3 where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

create function dueno_delete(
  coddueno varchar(15)
) returns void as
$body$
begin
update dueno set codestado = 0 where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

create function dueno_search(
  coddueno varchar(15)
) returns void as
$body$
begin
select * from dueno where coddueno = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
