create function addhospeda
	(	
		pk int,
		fkanimal varchar(15),
		fkcelda varchar(15),
		fechentrada date,
		fechsalida date,
	)returns void as
	$body$
	begin 
	insert into hospeda values(pk,fkanimal,fkcelda,fechentrada,fechsalida);
	end;
	$body$
	language plpgsql;

	create function edithospeda
	(
		pk int,
		fechentrada date(15),
		fechsalida date(15),
	) returns void as
	$body$
	begin
	update hospeda set fechaentrada = fechentrada, fechasalida= fechsalida where codhospeda=pk and codanimal !=0,codcelda !=0;
	end;
	$body$
	language plpgsql;

	create function deletehospeda
	(
		pk int,
	)returns void as
	$body$
	begin
	update hospeda set codanimal=0,codcelda=0 where codhospeda=pk;
	end;
	$body$
	language plpgsql;

	create function searchhospeda
	(
		pk int,
	)returns void as
	$body$
	begin
	select * from hospeda where codhospeda=pk and codanimal !=0, codcelda !=0;
	end;
	$body$
	language plpgsql;