create function addsuministra(
  pk int,
  c1 varchar (15),
  c2 varchar (15),
  c3 date,
  c4 varchar (50)
) returns void as
$body$
begin
insert into suministra values (pk,c1, c2, c3, c4, 1);
end;
$body$
language plpgsql;

create function editsuministra(
  pk int,
  c1 varchar (15),
  c2 varchar (15),
  c3 date,
  c4 varchar (50)
) returns void as
$body$
begin
update suministra set codmedicamento = c1 , codproveedor = c2, fecha=c3 , descripcion=c4 where codsuministra = pk and codestado !=0;
end;
$body$
language plpgsql;

create function deletesuministra(
  pk int
) returns void as
$body$
begin
update suministra set codestado =0 where codsuministra = pk;
end;
$body$
language plpgsql;

create function searchsuministra(
  pk int
) returns void as
$body$
begin
select * from suministra where codsuministra = pk , codmedicamento =c1 , codproveedor=c2 and cosestado !=0;
end;
$body$
language plpgsql;
