create function usuario_add(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(30)
) returns void as
$body$
begin
insert into usuario values (pk, c1, c2, 1);
end;
$body$
language plpgsql;

create function usuario_edit(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(30)
) returns void as
$body$
begin
update usuario set usuario = c1, password = c2 where codusuario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function usuario_delete(
  pk varchar(15)
) returns void as
$body$
begin
update usuario set codestado = 0 where codusuario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function usuario_search(
  pk varchar(15)
) returns void as
$body$
begin
select * from usuario where codusuario = pk and codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
