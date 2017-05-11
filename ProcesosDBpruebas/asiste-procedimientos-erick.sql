create function addasiste(
  pk int,
  c1 varchar(15),
  c2 varchar(15,
  c3 varchar(15),
  c4 varchar(15),
  c5 date,
  c6 varchar(50)
) returns void as
$body$
begin
insert into asist values (pk, c1, c2, c3, c4, c5, c6, 1);
end;
$body$
language plpgsql;

create function editasiste(
  pk int,
  c1 varchar(15),
  c2 varchar(15,
  c3 varchar(15),
  c4 varchar(15),
  c5 date,
  c6 varchar(50)
) returns void as
$body$
begin
update asiste set codanimal = c1, codservicio = c2, codveterinario = c3, codauxiliar = c4, fecha = c5, descripcion = c6 where codasiste = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteasiste(
  pk int
) returns void as
$body$
begin
update asiste set codestado = 0 where codasiste = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchasiste(
  pk int
) returns void as
$body$
begin
select * from asiste where codasiste = pk and codestado != 0;
end;
$body$
language plpgsql;
