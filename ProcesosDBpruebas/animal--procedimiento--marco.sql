create function animal(
   codanimal varchar(15),
   nombre varchar(30),
   edad int ,
   peso float,
   tamano varchar(15),
   color varchar(15),
   descripcion varchar(15),
   codestado int
); returns void as
    $body$
insert into animal values (codanimal ,nombre,edad,peso,tamano,color,descripcion,codestado);
  end;
  $body$
  language plpgsql;

  create function edanimal(
    codanimal varchar(15),
    nombre varchar(30),
    edad int ,
    peso float,
    tamano varchar(15),
    color varchar(15),
    descripcion varchar(15),
  ) returns void as
  $body$
  begin
  update animal set descripcion  = ocupacion where codanimal = pk and codestado != 0;
  end;
  $body$
  language plpgsql;

  create function deledueno(
    codanimal varchar(15),
  ) returns void as
  $body$
  begin
  update dueno set codanimal = 0 where codanimal = pk;
  end;
  $body$
  language plpgsql;

  create function searchanimal(
    codanimal(15),
  ) returns void as
  $body$
  begin
  select * from animal where codanimal = pk and codestado != 0;
  end;
  $body$
  language plpgsql;
