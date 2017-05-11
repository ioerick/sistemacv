create function addsolicita(
  pk int not null,
  c1 varchar(15) not null,
  c2 varchar(15) not null,
  c3 date not null,
) returns void as
$body$
begin
insert into solicita values (pk, c1, c2, c3, 1);
end;
$body$
language plpgsql;

create function editsolicita(
  pk int not null,
  c1 varchar(15) not null,
  c2 varchar(15) not null,
  c3 date not null,
) returns void as
$body$
begin
update solicita set coddueno = c1, codservicio = c2, fecha = c3 where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;

create function deletesolicita(
  pk int not null
) returns void as
$body$
begin
update solicita set codestado = 0 where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;

create function searchsolicita(

) returns void as
$body$
begin
select * from solicita where codsolicita = pk and codestado != 0;
end;
$body$
language plpgsql;
