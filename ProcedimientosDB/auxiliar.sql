create function  auxiliar_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15)
) returns void as
$body$
begin
insert into auxiliar values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function auxiliar_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15)
) returns void as
$body$
begin
update auxiliar set codpersona = c1, codcontrato = c2, codespecialidad = c3  where codauxiliar = pk and codestado != 0;
end;
$body$
language plpgsql;

create function auxiliar_delete(
  pk varchar(15)
) returns void as
$body$
begin
update auxiliar set codestado = 0 where codauxiliar = pk and codestado != 0;
end;
$body$
language plpgsql;

create function auxiliar_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from auxiliar where codauxiliar = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
