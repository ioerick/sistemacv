create function addusuario(
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

create function editusuario(
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

create function deleteusuario(
  pk varchar(15)
) returns void as
$body$
begin
update usuario set codestado = 0 where codusuario = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchusuario(
  pk varchar(15)
) returns void as
$body$
begin
select * from usuario where codusuario = pk and codestado != 0;
end;
$body$
language plpgsql;

--corregido y probado por erick
