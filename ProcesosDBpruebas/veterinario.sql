create function  addveterinario(
  codveterinario varchar(15),
  codpersona varchar(15),
  codcontrato varchar(15),
  codespecialidad varchar(15),
  codestado int
) returns void as
$body$
begin
insert into veterinario values (codveterinario, codpersona, codcontrato, codespecialidad, codestado);
end;
$body$
language plpgsql;

create function editveterinario(
  pk varchar(15),
  pk2 varchar(15),
  pk3 varchar(15),
  pk4 varchar(15)
) returns void as
$body$
begin
update veterinario set pk = codveterinario, pk2 = codpersona, pk3 = codcontrato, pk4 = codespecialidad  where codveterinario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteveterinario(
  pk varchar(15),
) returns void as
$body$
begin
update veterinario set codestado = 0 where codveterinario = pk;
end;
$body$
language plpgsql;

create function searchveterinario(
  pk varchar(15),
) returns void as
$body$
begin
select * from veterinario where codveterinario = pk and codestado != 0;
end;
$body$
language plpgsql;
