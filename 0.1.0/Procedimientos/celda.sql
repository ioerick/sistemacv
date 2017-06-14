create function celda_add(
  pk varchar(15),
  c1 varchar(5)
) returns void as
$body$
begin
insert into celda values (pk, c1, 1);
end;
$body$
language plpgsql;

create function celda_edit(
  pk varchar(15),
  c1 varchar(3)
) returns void as
$body$
begin
update celda set numero = c1 where codcelda = pk and codestado != 0;
end;
$body$
language plpgsql;

create function celda_delete(
  pk varchar(15)
) returns void as
$body$
begin
update celda set codestado = 0 where codcelda = pk and codestado != 0;
end;
$body$
language plpgsql;

create function celda_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from celda where codcelda = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
