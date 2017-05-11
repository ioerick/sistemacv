create function addueno
(
coddueno varchar(15),
 codpersona varchar(15),
 nit varchar(30),
 ocupacion varchar(15),
codestado int
) returns void as
$body$
insert into dueno values (coddueno,codpersona,nit,ocupacion,codestado);
  end;
  $body$
  language plpgsql;

  create function eddueno(
    coddueno varchar(15),
     codpersona varchar(15),
     nit varchar(30),
     ocupacion varchar(15),
  ) returns void as
  $body$
  begin
  update dueno set ocupacion  = ocupacion where coddueno = pk and codestado != 0;
  end;
  $body$
  language plpgsql;

  create function deledueno(
    coddueno varchar(15),
  ) returns void as
  $body$
  begin
  update dueno set codestado = 0 where coddueno = pk;
  end;
  $body$
  language plpgsql;

  create function searchdueno(
    coddueno(15),
  ) returns void as
  $body$
  begin
  select * from dueno where coddueno = pk and codestado != 0;
  end;
  $body$
  language plpgsql;
