create function addmedicamento(
  pk varchar(15),
  c1 varchar (30),
  c2 varchar (50),
  c3 int,
  c4 varchar (15),
  c5 date,
  c6 int
) returns void as
$body$
begin
insert into medicamento values (pk,c1, c2, c3, c4,c5,c6 1);
end;
$body$
language plpgsql;

create function editmedicamento(
  pk varchar(15),
  c1 varchar (30),
  c2 varchar (50),
  c3 int,
  c4 varchar (15),
  c5 date,
  c6 int
) returns void as
$body$
begin
update medicamento set codmedicamento = c1 , nombre = c2, descripcion=c3 , stock=c4 , precio=c5 , fechavencimiento=c6 where codmedicamento = pk and codestado !=0;
end;
$body$
language plpgsql;

create function deletemedicamento(
  pk int
) returns void as
$body$
begin
update medicamento set codestado =0 where codmedicamento = pk;
end;
$body$
language plpgsql;

create function searchmedicamento(
  pk int
) returns void as
$body$
begin
select * from medicamento where codmedicamneto = pk , nombre =c1 , codproveedor=c2 and codestado !=0;
end;
$body$
language plpgsql;
