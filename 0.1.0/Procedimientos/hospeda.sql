create function hospeda_add(
	pk varchar(15),
	c1 varchar(15),
	c2 varchar(15),
	c3 date,
	c4 date,
	useer varchar(15)
)returns void as
$body$
begin
insert into hospeda values(pk, c1, c2, c3, c4, 1);
insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'hospeda', pk);
end;
$body$
language plpgsql;

create function hospeda_edit(
	pk varchar(15),
	c1 varchar(15),
	c2 varchar(15),
	c3 date,
	c4 date,
	user varchar(15)
) returns void as
$body$
begin
update hospeda set codanimal = c1, codcelda = c2, fechaentrada = c3, fechasalida = c4 where codhospeda = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'hospeda', pk);
end;
$body$
language plpgsql;

create function hospeda_delete(
	pk varchar(15),
	user varchar(15)
)returns void as
$body$
begin
update hospeda set codestado = 0 where codhospeda = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'hospeda', pk);
end;
$body$
language plpgsql;

create function hospeda_search(
	pk varchar(15),
	user varchar(15)
)returns void as
$body$
begin
select * from hospeda where codhospeda = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'hospeda', pk);
end;
$body$
language plpgsql;

create function hospeda_view(
) returns void as
$body$
begin
select * from hospeda where codestado != 0;
end;
$body$
language plpgsql;

--probado por erick
