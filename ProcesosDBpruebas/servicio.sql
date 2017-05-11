create function  addservicio(
  codservicio varchar(15),
  descripcion varchar(50),
  fechaservicio date,
  horaservicio time,
  codestado int
) returns void as
$body$
begin
insert into servicio values (codservicio, descripcion, fechaservicio, horaservicio, codestado);
end;
$body$
language plpgsql;

create function editservicio(
  pk varchar(15),
  dcp varchar(50),
  fser date,
  hser time
) returns void as
$body$
begin
update servicio set dcp = descripcion, fser = fechaservicio, hser = horaservicio  where codservicio = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deleteservicio(
  pk varchar(15),
) returns void as
$body$
begin
update servicio set codestado = 0 where codservicio = pk;
end;
$body$
language plpgsql;

create function searchservicio(
  pk varchar(15),
) returns void as
$body$
begin
select * from servicio where codservicio = pk and codestado != 0;
end;
$body$
language plpgsql;