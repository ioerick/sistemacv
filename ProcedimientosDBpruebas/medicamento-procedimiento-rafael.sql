create function addmedicamento(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(50),
  c3 int,
  c4 varchar(15),
  c5 date
) returns void as
$body$
begin
insert into medicamento values (pk, c1, c2, c3, c4, c5, 1);
end;
$body$
language plpgsql;

create function editmedicamento(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(50),
  c3 int,
  c4 varchar(15),
  c5 date
) returns void as
$body$
begin
update medicamento set nombre = c1, descripcion = c2, stock = c3, precio = c4, fechavencimiento = c5 where codmedicamento = pk and codestado !=0;
end;
$body$
language plpgsql;

create function deletemedicamento(
  pk varchar(15)
) returns void as
$body$
begin
update medicamento set codestado = 0 where codmedicamento = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchmedicamento(
  pk varchar(15)
) returns void as
$body$
begin
select * from medicamento where codmedicamneto = pk and codestado !=0;
end;
$body$
language plpgsql;

--corregido por erick
