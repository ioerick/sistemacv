create function precio_add(
  pk varchar(15),
  c1 float
) returns void as
$body$
begin
insert into precio values (pk, c1, 1);
end;
$body$
language plpgsql;

create function precio_edit(
  pk varchar(15),
  c1 float
) returns void as
$body$
begin
update precio set precio = c1 where codprecio = pk and codestado != 0;
end;
$body$
language plpgsql;

create function precio_delete(
  pk varchar(15)
) returns void as
$body$
begin
update precio set codestado = 0 where codprecio = pk and codestado != 0;
end;
$body$
language plpgsql;

create function precio_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from precio where codprecio = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
