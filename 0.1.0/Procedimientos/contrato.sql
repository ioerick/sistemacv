create function contrato_add(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 date,
  usuario varchar(15)
) returns void as
$body$
begin
insert into contrato values (pk, c1, c2, c3, 1);
  insert into historial_actividades (accion, usuario, tabla, campo) values ('add', usuario, 'contrato', pk);
end;
$body$
language plpgsql;

create function contrato_edit(
  pk varchar(15),
  c1 varchar(50),
  c2 date,
  c3 date,
  usuario varchar(15)
) returns void as
$body$
begin
update contrato set descripcion = c1, fechainicio = c2, fechafinal = c3 where codcontrato = pk and codestado != 0;
  insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', usuario, 'contrato', pk);
end;
$body$
language plpgsql;

create function contrato_delete(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
update contrato set codestado = 0 where codcontrato = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', usuario, 'contrato', pk);
  end;
$body$
language plpgsql;

create function contrato_search(
  pk varchar(15),
  usuario varchar(15)
) returns void as
$body$
begin
select * from contrato where codcontrato = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', usuario, 'contrato', pk);
end;
$body$
language plpgsql;

create function contrato_view(
) returns void as
$body$
begin
select * from contrato where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
