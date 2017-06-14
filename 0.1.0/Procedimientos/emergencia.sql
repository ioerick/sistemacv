create function emergencia_add(
  pk varchar(15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 date,
  c5 date,
  c6 varchar (50)
) returns void as
$body$
begin
insert into emergencia values (pk, c1, c2, c3, c4, c5, c6,1);
end;
$body$
language plpgsql;

create function emergencia_edit(
  pk varchar(15),
  c1 varchar (15),
  c2 varchar (15),
  c3 varchar (15),
  c4 date,
  c5 date,
  c6 varchar (50)
) returns void as
$body$
begin
update emergencia set codanimal = c1 , codveterinario = c2 , codauxiliar = c3, fechaentrada = c4, fechasalida = c5, descripcion = c6 where codemeregencia = pk and codestado !=0;
end;
$body$
language plpgsql;

create function emergencia_delete(
  pk varchar(15)
) returns void as
$body$
begin
update emergencia set codestado = 0 where codemergencia = pk and codestado != 0;
end;
$body$
language plpgsql;

create function emergencia_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from emergencia where  codemergencia = pk and codestado !=0;
end;
$body$
language plpgsql;

--probado por erick
