create function addadquiere
	(
		pk int,
		fk1 varchar(15),
		fk2 varchar(15),
		can int,
		fec date,
		des varchar(50)
	)returns void as
	$body$
	begin
	insert into adquiere values(pk,fk1,fk2,can,fec,des);
	end;
	$body$
	language plpgsql;
select addadquiere(
		pk int,
		fk1 varchar(15),
		fk2 varchar(15),
		can int,
		fec date,
		des varchar(50)
	)r
	
	create function editadquiere
	(
		pk int,
		fk1 varchar(15),
		fk2 varchar(15),
		can int,
		fec date,
		des varchar(50)
	)returns void as
	$body$
	begin
	update adquiere set codadministrativo=fk1,codmedicamento=fk2,cantidad=can,fecha=fec,descripcion=des where codadquiere=pk;
	end;
	$body$
	language plpgsql;

	create function deleteadquiere
	(
		pk int
	)returns void as
	$body$
	begin
	update adquiere set codadministrativo=0,codmedicamento=0 where codadquiere=pk;
	end;
	$body$
	language plpgsql;

	create function searchadquiere
	(
		pk int
	)returns void as
	$body$
	begin
	select * from adquiere where codadquiere=pk;
	end;
	$body$
	language plpgsql;