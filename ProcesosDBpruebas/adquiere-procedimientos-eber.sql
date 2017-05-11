create function addadquiere
	(
		pk int,
		fkadm varchar(15),
		fkmed varchar(15),
		cant int,
		fech date,
		des varchar(50),
	)returns void as
	$body$
	begin
	insert into adquiere values(pk,fkadm,fkmed,cant,fech,des);
	end;
	language plpgsql;

	create function editadquiere
	(
		pk int,
		cant int,
		fech date,
		des varchar(50),
	)returns void as
	$body$
	begin
	update adquiere set cantidad= cant, fecha= fech, descripcion= des where codadquiere=pk and codadministrativo !=0, codmedicamento !=0;
	end;
	$body$
	language plpgsql;

	create function deleteadquiere
	(
		pk int,
	)returns void as
	$body$
	begin
	update adquiere set codadministrativo=0,codmedicamento=0 where codadquiere=pk;
	end;
	$body$
	language plpgsql;

	create function searchadquiere
	(
		pk int,
	)returns void as
	$body$
	begin
	select * from adquiere where codadquiere=pk and codadministrativo !=0, codmedicamento !=0;
	end;
	$body$
	language plpgsql;