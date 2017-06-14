create function medicamento_add(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(50),
  c3 int,
  c4 varchar(15),
  c5 date,
  user varchar(15)
) returns void as
$body$
begin
insert into medicamento values (pk, c1, c2, c3, c4, c5, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'medicamento', pk);
end;
$body$
language plpgsql;

create function medicamento_edit(
  pk varchar(15),
  c1 varchar(30),
  c2 varchar(50),
  c3 int,
  c4 varchar(15),
  c5 date,
  user varchar(15)
) returns void as
$body$
begin
update medicamento set nombre = c1, descripcion = c2, stock = c3, precio = c4, fechavencimiento = c5 where codmedicamento = pk and codestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'medicamento', pk);
end;
$body$
language plpgsql;

create function medicamento_delete(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
update medicamento set codestado = 0 where codmedicamento = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'medicamento', pk);
end;
$body$
language plpgsql;

create function medicamento_search(
  pk varchar(15),
  user varchar(15)
) returns void as
$body$
begin
select * from medicamento where codmedicamneto = pk and codestado !=0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'medicamento', pk);
end;
$body$
language plpgsql;

create function medicamento_view(
) returns void as
$body$
begin
select * from medicamento where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
