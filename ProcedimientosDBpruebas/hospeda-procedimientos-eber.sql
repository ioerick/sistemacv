create function addhospeda
	(	
		pk int,
		fk1 varchar(15),
		fk2 varchar(15),
		fec1 date,
		fec2 date
	)returns void as
	$body$
	begin 
	insert into hospeda values(pk,fk1,fk2,fec1,fec2);
	end;
	$body$
	language plpgsql;

	create function edithospeda
	(
		pk int,
		fk1 varchar(15),
		fk2 varchar(15),
		fec1 date,
		fec2 date
	) returns void as
	$body$
	begin
	update hospeda set codanimal=fk1,codcelda=fk2, fechaentrada = fec1, fechasalida= fec2 where codhospeda=pk;
	end;
	$body$
	language plpgsql;

	create function deletehospeda
	(
		pk int
	)returns void as
	$body$
	begin
	update hospeda set codanimal=0,codcelda=0 where codhospeda=pk;
	end;
	$body$
	language plpgsql;

	create function searchhospeda
	(
		pk int
	)returns void as
	$body$
	begin
	select * from hospeda where codhospeda=pk;
	end;
	$body$
	language plpgsql;