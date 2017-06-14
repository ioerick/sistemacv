create function adquiere_add(
	pk varchar(15),
	c1 varchar(15),
	c2 varchar(15),
	c3 int,
	c4 date,
	c5 varchar(50),
	user varchar(15)
)returns void as
$body$
begin
insert into adquiere values( pk, c1, c2, c3, c4, c5, 1);
	insert into historial_actividades (accion, usuario, tabla, campo) values ('add', user, 'adquiere', pk);
end;
$body$
language plpgsql;

create function adquiere_edit(
	pk varchar(15),
	c1 varchar(15),
	c2 varchar(15),
	c3 int,
	c4 date,
	c5 varchar(50),
	user varchar(15)
)returns void as
$body$
begin
update adquiere set codadministrativo = c1, codmedicamento = c2, cantidad = c3, fecha = c4, descripcion = c5 where codadquiere = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('edit', user, 'adquiere', pk);
end;
$body$
language plpgsql;

create function adquiere_delete(
	pk varchar(15),
	user varchar(15)
)returns void as
$body$
begin
update adquiere set codestado = 0 where codadquiere = pk and codestado !=0;
	insert into historial_actividades (accion, usuario, tabla, campo) values ('delete', user, 'adquiere', pk);
end;
$body$
language plpgsql;

create function adquiere_search(
	pk varchar(15),
	user varchar(15)
)returns void as
$body$
begin
select * from adquiere where codadquiere = pk and codestado != 0;
insert into historial_actividades (accion, usuario, tabla, campo) values ('search', user, 'adquiere', pk);
end;
$body$
language plpgsql;

create function adquiere_view(
) returns void as
$body$
begin
select * from adquiere where codestado != 0;
end;
$body$
language plpgsql;
--probado por erick
