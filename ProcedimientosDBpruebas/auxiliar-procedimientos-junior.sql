create function  addauxiliar(
  codauxiliar varchar(15),
  codpersona varchar(15),
  codcontrato varchar(15),
  codespecialidad varchar(15),
  codestado int
) returns void as
$body$
begin
insert into auxiliar values (codauxliar, codpersona, codcontrato, codespecialidad, codestado);
end;
$body$
language plpgsql;

create function editauxiliar(
  pk varchar(15),
  pk2 varchar(15),
  pk3 varchar(15),
  pk4 varchar(15)
) returns void as
$body$
begin
update auxiliar set pk = codauxiliar, pk2 = codpersona, pk3 = codcontrato, pk4 = codespecialidad  where codauxiliar = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteauxiliar(
  pk varchar(15),
) returns void as
$body$
begin
update auxiliar set codestado = 0 where codauxiliar = pk;
end;
$body$
language plpgsql;

create function searchauxiliar(
  pk varchar(15),
) returns void as
$body$
begin
select * from auxiliar where codauxiliar = pk and codestado != 0;
end;
$body$
language plpgsql;
