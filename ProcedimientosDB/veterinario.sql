create function  veterinario_add(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15)
) returns void as
$body$
begin
insert into veterinario values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function veterinario_edit(
  pk varchar(15),
  c1 varchar(15),
  c2 varchar(15),
  c3 varchar(15)
) returns void as
$body$
begin
update veterinario set codpersona = c1, codcontrato = c2, codespecialidad = c3  where codveterinario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function veterinario_delete(
  pk varchar(15)
) returns void as
$body$
begin
update veterinario set codestado = 0 where codveterinario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function veterinario_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from veterinario where codveterinario = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
