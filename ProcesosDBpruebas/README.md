aqui va los procesos para probar antes del ingreso a procesosDB

(procedimiento) --nombre de programador-- *nombre del testeador*

-programar el procedimiento
-guardarlo en un archivo unico por procedimiento con el formato siguiente
**nombre de la tabla-procedimientos-nombre del programador.sql**
ejemplo
sexo-procedimientos-erick.sql
-subirlo al repositorio de procesosDBpruebas

# por erick
# tabla parametrica para la variable bandera

**estado**
>adicion de datos parametricos para la tabla estados --erick

# tablas sin dependecias mas que la variable parametrica

**sexo** --erick
>addsexo()
>editsexo()
>deletesexo()
>searchsexo()

**nacion** --pame
>addnacion()
>editnacion()
>deletenacion()
>searchnacion()

**telefono** --pame
>addtelefono()
>edittelefono()
>deletetelefono()
>searchtelefono()

**correo** --pame
>addcorreo()
>editcorreo()
>deletecorreo()
>searchcorreo()

**direccion** --pame
>adddireccion()
>editdireccion()
>deletedireccion()
>searchdireccion()

**raza** --pame
>addraza()
>editraza()
>deleteraza()
>searchraza()

**celda** --laura
>addcelda()
>editcelda()
>deletecelda()
>searchcelda()

**precio** --laura
>addprecio()
>editprecio()
>deleteprecio()
>searchprecio()

**contrato** --laura
>addcontrato()
>editcontrato()
>deletecontrato()
>searchcontrato()

**usuario** --laura
>addusuario()
>editusuario()
>deleteusuario()
>searchusario()

**cargo** --laura
>addcargo()
>editcargo()
>deletecargo()
>searchcargo()

**especialidad** --davis
>addespecialidad()
>editespecialidad()
>deleteespecialidad()
>searchespecialidad()

**ocupacion** --davis
>addocupacion()
>editocupacion()
>deleteocupacion()
>searchocupacion()

**tamano** --davis
>addtamano()
>edittamano()
>deletetamano()
>searchtamano()

**color** --davis
>addcolor()
>editcolor()
>deletecolor()
>searchcolor()

**empresa** --davis
>addempresa()
>editempresa()
>deleteempresa()
>searchempresa()

**servicio** --junior
>addservicio()
>editservicio()
>deleteservicio()
>searchservicio()

# tablas con dependecias de las tablas sin dependecias

**persona** --junior
>addpersona()
>editpersona()
>deletepersona()
>searchpersona()

**administrativo** --junior
>addadministrativo()
>editadministrativo()
>deleteadministrativo()
>searchadministrativo()

**veterinario** --junior
>addveterinario()
>editveterinario()
>deleteveterinario()
>searchveterinario()

**auxiliar** --junior
>addauxiliar()
>editauxiliar()
>deleteauxiliar()
>searchauxiliar()

**dueno** --marco
>adddueno()
>editdueno()
>deletedueno()
>searchdueno()

**animal** --marco
>addanimal()
>editanimal()
>deleteanimal()
>searchanimal()

**medicamento** --rafael
>addmedicamento()
>editmedicamento()
>deletemedicamento()
>searchmedicamento()

**proveedor** --rafael
>addproveedor()
>editproveedor()
>deleteproveedor()
>searchproveedor()

# tablas generadas por interrelacion

**emergencia** --eric
>addemergencia()
>editemergencia()
>deleteemergencia()
>searchemergencia()

**suministra** --eric
>addsuministra()
>editsuministra()
>deletesuministra()
>searchsuministra()

**adquiere** --eber
>addadquiere()
>editadquiere()
>deleteadquiere()
>searchadquiere()

**hospeda** --eber
>addhospeda()
>edithospeda()
>deletehospeda()
>searchhospeda()

**registra** --erick
>addregistra()
>editregistra()
>deleteregistra()
>searchregistra()

**asiste** --erick
>addasiste()
>editasiste()
>deleteasiste()
>searchasiste()

**solicita** --erick
>addsolicita()
>editsolicita()
>deletesolicita()
>searchsolicita()
