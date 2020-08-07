unit uMetodosServidor;

interface

uses System.SysUtils, System.Classes, System.Json, Contnrs,
  Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, uFDataSnapMatematicas, uTCurso, uTConcurrencia, uTUsuario,
  uTParticipante, uTResumen, uTPalabraClave, uTAutoresResumen,
  uTReferenciaResumen, uFResumenes, IdMessage, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, uFCertificados, Utilidades;

type
{$METHODINFO ON}
  TIntegerString = record
    vString: string;
    vInteger: integer;
  end;

  TMatematicas = class(TDataModule)
    Conexion: TFDConnection;
    Query: TFDQuery;
    DireccionLibreria: TFDPhysPgDriverLink;
    Query2: TFDQuery;
    Query3: TFDQuery;
    SMTP: TIdSMTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    Data: TIdMessage;
    procedure DataModuleCreate(Sender: tobject);
  private
    AccesoDenegado: string;
    FParametros: TStringList;
    FTipoParametro: TStringList;
    FHoras: TStringList;
    FDias: TStringList;

    procedure iniciarConexion;
    procedure terminarConexion;

    procedure escribirMensaje(msg: string; tipo: string);

    function transformarNombre(sNombre: string): string;
  public

    procedure limpiarConsulta(Query: TFDQuery);
    procedure SELECT(nombreTabla, OrdenarPor: string; Query: TFDQuery);
    procedure SelectWhere(nombreTabla, Identificador, ID: string;
      Query: TFDQuery);
    procedure SelectWhereOrder(nombreTabla, Identificador, OrdenarPor,
      ID: string; Query: TFDQuery);
    procedure InnerJoin(Tabla1, Tabla2, Parametro, IdBusqueda, Valor: string;
      Query: TFDQuery);
    procedure InnerJoin3(Tabla1, Tabla2, Tabla3, Parametro1, Parametro2,
      IdBusqueda, Valor: string; Query: TFDQuery);
    procedure INSERT(nombreTabla: string; Query: TFDQuery);
    procedure DELETE(nombreTabla, Identificador, ID: string; Query: TFDQuery);
    procedure UPDATE(nombreTabla, Identificador, ID: string; Query: TFDQuery);
    procedure limpiarParametros;
    procedure agregarParametro(Param: string; tipo: string);
    function crearJSON(Query: TFDQuery): TJSONObject;
    procedure asignarDatos(datos: TJSONObject; Query: TFDQuery);
    function Texto(ss: string): string;
    function JsonRespuesta: string;
    function JsonError: string;
    procedure enviarError(hora, fecha, procedimiento, mensaje: string);

    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    { CRUD: concurrencias }
    function concurrencia(idClave: string): TJSONObject;
    function updateconcurrencia(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelconcurrencia(const idClave: string; const token: string)
      : TJSONObject;
    function acceptconcurrencia(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CRUD: usuarios }
    function usuario(idClave: string): TJSONObject;
    function updateusuario(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelusuario(const idClave: string; const token: string)
      : TJSONObject;
    function acceptusuario(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CRUD: participantes }
    function participante(idClave: string): TJSONObject;
    function updateparticipante(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelparticipante(const idClave: string; const token: string)
      : TJSONObject;
    function acceptparticipante(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CRUD: resumenes }
    function resumen(idClave: string): TJSONObject;
    function resumenPorTipo(const tipo: string): TJSONObject;
    function resumenesAutor(idClave: string): TJSONObject;
    function updateresumen(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelresumen(const idClave: string; const token: string)
      : TJSONObject;
    function acceptresumen(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CRUD: palabraClave }
    function palabraClave(idClave: string): TJSONObject;
    function palabraClaveResumen(idClave: string): TJSONObject;
    function updatepalabraClave(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelpalabraClave(const idClave: string; const token: string)
      : TJSONObject;
    function acceptpalabraClave(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CRUD: autorResumen }
    function autorResumen(idClave: string): TJSONObject;
    function autoresResumen(idClave: string): TJSONObject;
    function updateautorResumen(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelautorResumen(const cedula: string; const id_resumen: string;
      const token: string): TJSONObject;
    function acceptautorResumen(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function cancelborrarResumen(const id_resumen: string; const token: string)
      : TJSONObject;
    function autorPorCedula(cedula: string): TJSONObject;
    function updateagregarAutorResumen(const token: string;
      const datos: TJSONObject): TJSONObject;

    { CRUD: referenciaResumen }
    function referenciaResumen(idClave: string): TJSONObject;
    function referenciasResumen(idClave: string): TJSONObject;
    function updatereferenciaResumen(const token: string;
      const datos: TJSONObject): TJSONObject;
    function cancelreferenciaResumen(const idClave: string; const token: string)
      : TJSONObject;
    function acceptreferenciaResumen(const token: string;
      const datos: TJSONObject): TJSONObject;

    { CRUD: Talleres del Evento }
    function updateinscribirTaller(const token: string;
      const datos: TJSONObject): TJSONObject;
    function estadisticasTaller(const idResumen: string): TJSONObject;
    function obtenerTallerParticipante(const cedula: string): TJSONObject;
    function cancelsalirDelTaller(const cedula: string; const token: string)
      : TJSONObject;

    { CRUD: Exportaciones de Archivos }
    function updateobtenerCertificados(const datos: TJSONObject): TJSONObject;
    function obtenerListasTalleres: TJSONObject;
    function listaPosters: TJSONObject;

    { CRUD: Comunicación con el usuario }
    function updateenviarCorreo(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { Configuraciones }
    function permiteCrearResumenes: TJSONObject;
    function permiteInscribirseTalleres: TJSONObject;

    function obtenerConexion(clave: string): TJSONObject;
    function updatetoken(const datos: TJSONObject): TJSONObject;
    function descargarResumenEmem(clave: string): TJSONObject;
    function descargarCertificadosUnificados(fecha: string): TJSONObject;

    { TipoContrato }
    function updateTipoContrato(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function TipoContrato(const ID: string): TJSONObject;
    function TiposContrato: TJSONObject;
    function cancelTipoContrato(const token: string; const ID: string)
      : TJSONObject;
    function acceptTipoContrato(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { Error }
    function updateError(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function Error(const ID: string): TJSONObject;
    function Errores: TJSONObject;
    function cancelError(const token: string; const ID: string): TJSONObject;
    function cancelErrorPorMensaje(const token: string; const msg: string)
      : TJSONObject;
    function acceptError(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { CategoriaDocente }
    function updateCategoriaDocente(const token: string;
      const datos: TJSONObject): TJSONObject;
    function CategoriaDocente(const ID: string): TJSONObject;
    function CategoriasDocente: TJSONObject;
    function cancelCategoriaDocente(const token: string; const ID: string)
      : TJSONObject;
    function acceptCategoriaDocente(const token: string;
      const datos: TJSONObject): TJSONObject;

    { Docente }
    function updateDocente(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function Docente(const ID: string): TJSONObject;
    function Docentes(const OrdenarPor: string): TJSONObject;
    function obtenerTipoContratoDocente(idDocente: string): string;
    function obtenerHorasDocencia(idDocente: string): integer;
    function DocentesPorContrato(const IdContrato: string): TJSONObject;
    function cancelDocente(const token: string; const ID: string): TJSONObject;
    function acceptDocente(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function acceptFotoDocente(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { Facultad }
    function updateFacultad(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function Facultad(const ID: string): TJSONObject;
    function Facultades: TJSONObject;
    function cancelFacultad(const token: string; const ID: string): TJSONObject;
    function acceptFacultad(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { Programa }
    function updatePrograma(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function Programa(const ID: string): TJSONObject;
    function Programas: TJSONObject;
    function cancelPrograma(const token: string; const ID: string): TJSONObject;
    function acceptPrograma(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { ServicioPrograma }
    function updateServicioPrograma(const token: string;
      const datos: TJSONObject): TJSONObject;
    function ServicioPrograma(const ID: string): TJSONObject;
    function ServiciosPrograma(const OrdenarPor: string; const Periodo: string)
      : TJSONObject;
    function ServiciosProgramaDocente(const idDocente: string;
      const Periodo: string): TJSONObject;
    function obtenerDocenteServicio(idservicio, Periodo: string): string;
    function validarHorario(idDocente, idservicio, Periodo: string)
      : TIntegerString;
    function cancelServicioPrograma(const token: string; const ID: string)
      : TJSONObject;
    function acceptServicioPrograma(const token: string;
      const datos: TJSONObject): TJSONObject;

    { HorarioServicio }
    function updateHorarioServicio(const token: string;
      const datos: TJSONObject): TJSONObject;
    function HorarioServicio(const ID: string): TJSONObject;
    function HorariosServicio(const IdSercicioPrograma: string): TJSONObject;
    function cancelHorarioServicio(const token: string; const ID: string)
      : TJSONObject;
    function acceptHorarioServicio(const token: string;
      const datos: TJSONObject): TJSONObject;

    { AgendaServicio }
    function updateAgendaServicio(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function AgendaServicio(const ID: string): TJSONObject;
    function AgendasServicio(const idDocente: string; const Periodo: string)
      : TJSONObject;
    function cancelDesasociarAgenda(const token: string;
      const IdServicioPrograma: string): TJSONObject;
    function cancelAgendaServicio(const token: string; const ID: string)
      : TJSONObject;
    function acceptAgendaServicio(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { Configuracion }
    function updateConfiguracion(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function Configuracion(const ID: string): TJSONObject;
    function obtenerSemanasSemestre: integer;
    function obtenerHorasCatedra: integer;
    function obtenerHorasContrato: integer;
    function Configuraciones: TJSONObject;
    function cancelConfiguracion(const token: string; const ID: string)
      : TJSONObject;
    function acceptConfiguracion(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { FuncionDocente }
    function updateFuncionDocente(const token: string; const datos: TJSONObject)
      : TJSONObject;
    function FuncionDocente(const ID: string): TJSONObject;
    function FuncionesDocente: TJSONObject;
    function cancelFuncionDocente(const token: string; const ID: string)
      : TJSONObject;
    function acceptFuncionDocente(const token: string; const datos: TJSONObject)
      : TJSONObject;

    { ActividadDocente }
    function updateActividadDocente(const token: string;
      const datos: TJSONObject): TJSONObject;
    function ActividadDocente(const ID: string): TJSONObject;
    function ActividadesDocente(const IdFuncion: string): TJSONObject;
    function cancelActividadDocente(const token: string; const ID: string)
      : TJSONObject;
    function acceptActividadDocente(const token: string;
      const datos: TJSONObject): TJSONObject;

    { SubactividadDocente }
    function updateSubactividadDocente(const token: string;
      const datos: TJSONObject): TJSONObject;
    function SubactividadDocente(const ID: string): TJSONObject;
    function SubactividadesDocente(const IdActividad: string): TJSONObject;
    function cancelSubactividadDocente(const token: string; const ID: string)
      : TJSONObject;
    function acceptSubactividadDocente(const token: string;
      const datos: TJSONObject): TJSONObject;

  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

{ Método INSERT - SubactividadDocente }
function TMatematicas.updateSubactividadDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idsubactividaddocente', 'String');
      agregarParametro('subactividad', 'String');
      agregarParametro('idactividaddocente', 'String');

      INSERT('siap_subactividades_docentes', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'La Subactividad Docente se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateSubactividadDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateSubactividadDocente', Json.toString);
  Query.Free;
end;

{ Método GET - SubactividadDocente }
function TMatematicas.SubactividadDocente(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_subactividades_docentes', 'idsubactividaddocente',
      Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idsubactividaddocente', 'String');
    agregarParametro('subactividad', 'String');
    agregarParametro('idactividaddocente', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getSubactividadDocente',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('SubactividadDocente', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - SubactividadDocente }
function TMatematicas.SubactividadesDocente(const IdActividad: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('SubactividadesDocentes', ArrayJson);

    limpiarConsulta(Query);
    SelectWhereOrder('siap_subactividades_docentes', 'idactividaddocente',
      'subactividad', Texto(IdActividad), Query);

    limpiarParametros;
    agregarParametro('idsubactividaddocente', 'String');
    agregarParametro('subactividad', 'String');
    agregarParametro('idactividaddocente', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllSubactividadDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('SubactividadesDocente', Json.toString);
  Query.Free;
end;

{ Método DELETE - SubactividadDocente }
function TMatematicas.cancelSubactividadDocente(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_subactividades_docentes', 'idsubactividaddocente',
        Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'La Subactividad Docente se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteSubactividadDocente',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelSubactividadDocente', Json.toString);
  Query.Free;
end;

{ Método UPDATE - SubactividadDocente }
function TMatematicas.acceptSubactividadDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idsubactividaddocente', 'String');
      agregarParametro('subactividad', 'String');
      agregarParametro('idactividaddocente', 'String');

      ID := datos.GetValue('idsubactividaddocente').Value;
      UPDATE('siap_subactividades_docentes', 'idsubactividaddocente',
        Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'La Subactividad Docente se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptSubactividadDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateSubactividadDocente', Json.toString);
  Query.Free;
end;

{ Método INSERT - ActividadDocente }
function TMatematicas.updateActividadDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idactividaddocente', 'String');
      agregarParametro('actividad', 'String');
      agregarParametro('idfunciondocente', 'String');

      INSERT('siap_actividades_docentes', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Actividad Docente se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateActividadDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateActividadDocente', Json.toString);
  Query.Free;
end;

{ Método GET - ActividadDocente }
function TMatematicas.ActividadDocente(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_actividades_docentes', 'idactividaddocente',
      Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idactividaddocente', 'String');
    agregarParametro('actividad', 'String');
    agregarParametro('idfunciondocente', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getActividadDocente',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('ActividadDocente', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - ActividadDocente }
function TMatematicas.ActividadesDocente(const IdFuncion: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('ActividadesDocentes', ArrayJson);

    limpiarConsulta(Query);
    SelectWhereOrder('siap_actividades_docentes', 'idfunciondocente',
      'actividad', Texto(IdFuncion), Query);

    limpiarParametros;
    agregarParametro('idactividaddocente', 'String');
    agregarParametro('actividad', 'String');
    agregarParametro('idfunciondocente', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllActividadDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('ActividadesDocente', Json.toString);
  Query.Free;
end;

{ Método DELETE - ActividadDocente }
function TMatematicas.cancelActividadDocente(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_actividades_docentes', 'idactividaddocente',
        Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'La Actividad Docente se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteActividadDocente',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelActividadDocente', Json.toString);
  Query.Free;
end;

{ Método UPDATE - ActividadDocente }
function TMatematicas.acceptActividadDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idactividaddocente', 'String');
      agregarParametro('actividad', 'String');
      agregarParametro('idfunciondocente', 'String');

      ID := datos.GetValue('idactividaddocente').Value;
      UPDATE('siap_actividades_docentes', 'idactividaddocente',
        Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'La Actividad Docente se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptActividadDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateActividadDocente', Json.toString);
  Query.Free;
end;

{ Método INSERT - FuncionDocente }
function TMatematicas.updateFuncionDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idfunciondocente', 'String');
      agregarParametro('funcion', 'String');

      INSERT('siap_funciones_docentes', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Función Docente se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateFuncionDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateFuncionDocente', Json.toString);
  Query.Free;
end;

{ Método GET - FuncionDocente }
function TMatematicas.FuncionDocente(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_funciones_docentes', 'idfunciondocente',
      Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idfunciondocente', 'String');
    agregarParametro('funcion', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getFuncionDocente',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('FuncionDocente', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - FuncionDocente }
function TMatematicas.FuncionesDocente: TJSONObject;
var
  Json, JsonFuncion, JsonActividad, JsonSubactividad: TJSONObject;
  Query, Query2, Query3: TFDQuery;
  ArrayJson, ArrayActividades, ArraySubactividades: TJSONArray;
  JsonLinea: TJSONObject;
  i, j, k: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  Query2 := TFDQuery.create(nil);
  Query2.Connection := Conexion;
  Query3 := TFDQuery.create(nil);
  Query3.Connection := Conexion;

  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('FuncionesDocentes', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_funciones_docentes', 'funcion', Query);

    limpiarParametros;
    agregarParametro('idfunciondocente', 'String');
    agregarParametro('funcion', 'String');

    for i := 1 to Query.RecordCount do
    begin
      JsonFuncion := TJSONObject.create;
      JsonFuncion := crearJSON(Query);

      Query2.Close;
      Query2.SQL.Clear;
      Query2.SQL.Add
        ('SELECT * FROM siap_actividades_docentes WHERE idfunciondocente=' +
        Texto(Query.FieldByName('idfunciondocente').AsString));
      Query2.Open;
      Query2.First;

      ArrayActividades := TJSONArray.create;
      for j := 1 to Query2.RecordCount do
      begin
        JsonActividad := TJSONObject.create;
        JsonActividad.AddPair('idactividaddocente',
          Query2.FieldByName('idactividaddocente').AsString);
        JsonActividad.AddPair('actividad', Query2.FieldByName('actividad')
          .AsString);
        JsonActividad.AddPair('idfunciondocente',
          Query2.FieldByName('idfunciondocente').AsString);

        { Leer las subactividades }
        Query3.Close;
        Query3.SQL.Text := 'SELECT * FROM siap_subactividades_docentes WHERE' +
          ' idactividaddocente=' +
          Texto(Query2.FieldByName('idactividaddocente').AsString);
        Query3.Open;
        Query3.First;

        ArraySubactividades := TJSONArray.create;
        for k := 1 to Query3.RecordCount do
        begin
          JsonSubactividad := TJSONObject.create;
          JsonSubactividad.AddPair('idsubactividaddocente',
            Query3.FieldByName('idsubactividaddocente').AsString);
          JsonSubactividad.AddPair('subactividad', Query3.FieldByName('subactividad')
            .AsString);
          JsonSubactividad.AddPair('idactividaddocente',
            Query3.FieldByName('idactividaddocente').AsString);

          ArraySubactividades.Add(JsonSubactividad);
        end;

        JsonActividad.AddPair('subactividades', ArraySubactividades);
        ArrayActividades.Add(JsonActividad);

        Query2.Next;
      end;

      JsonFuncion.AddPair('actividades', ArrayActividades);
      ArrayJson.AddElement(JsonFuncion);
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllFuncionDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('FuncionesDocente', Json.toString);
  Query.Free;
end;

{ Método DELETE - FuncionDocente }
function TMatematicas.cancelFuncionDocente(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_funciones_docentes', 'idfunciondocente', Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'La Función Docente se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteFuncionDocente',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelFuncionDocente', Json.toString);
  Query.Free;
end;

{ Método UPDATE - FuncionDocente }
function TMatematicas.acceptFuncionDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idfunciondocente', 'String');
      agregarParametro('funcion', 'String');

      ID := datos.GetValue('idfunciondocente').Value;
      UPDATE('siap_funciones_docentes', 'idfunciondocente', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'La Función Docente se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptFuncionDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateFuncionDocente', Json.toString);
  Query.Free;
end;

{ Método INSERT - Configuracion }
function TMatematicas.updateConfiguracion(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idconfiguracion', 'String');
      agregarParametro('nombredirector', 'String');
      agregarParametro('nombredecano', 'String');
      agregarParametro('semanassemestre', 'String');

      INSERT('siap_configuraciones', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Configuración se agrego correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateConfiguracion',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateConfiguracion', Json.toString);
  Query.Free;
end;

{ Método GET - Configuracion }
function TMatematicas.Configuracion(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_configuraciones', 'idconfiguracion', Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idconfiguracion', 'String');
    agregarParametro('nombredirector', 'String');
    agregarParametro('nombredecano', 'String');
    agregarParametro('semanassemestre', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getConfiguracion',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('Configuracion', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - Configuracion }
function TMatematicas.Configuraciones: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Configuraciones', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_configuraciones', 'nombredirector', Query);

    limpiarParametros;
    agregarParametro('idconfiguracion', 'String');
    agregarParametro('nombredirector', 'String');
    agregarParametro('nombredecano', 'String');
    agregarParametro('semanassemestre', 'String');
    agregarParametro('horascatedra', 'String');
    agregarParametro('horascontrato', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllConfiguracion',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Configuraciones', Json.toString);
  Query.Free;
end;

{ Método DELETE - Configuracion }
function TMatematicas.cancelConfiguracion(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_configuraciones', 'idconfiguracion', Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'La Configuración se eliminó de la agenda correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteConfiguracion',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelConfiguracion', Json.toString);
  Query.Free;
end;

{ Método UPDATE - Configuracion }
function TMatematicas.acceptConfiguracion(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idconfiguracion', 'String');
      agregarParametro('nombredirector', 'String');
      agregarParametro('nombredecano', 'String');
      agregarParametro('semanassemestre', 'String');
      agregarParametro('horascatedra', 'String');
      agregarParametro('horascontrato', 'String');

      ID := datos.GetValue('idconfiguracion').Value;
      UPDATE('siap_configuraciones', 'idconfiguracion', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'La Configuración se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptConfiguracion',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateConfiguracion', Json.toString);
  Query.Free;
end;

{ Método INSERT - AgendaServicio }
function TMatematicas.updateAgendaServicio(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idagendaservicio', 'String');
      agregarParametro('iddocente', 'Integer');
      agregarParametro('idservicioprograma', 'String');
      agregarParametro('periodo', 'String');

      INSERT('siap_agendas_servicios', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Servicio se agrego correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateAgendaServicio',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateAgendaServicio', Json.toString);
  Query.Free;
end;

{ Método GET - AgendaServicio }
function TMatematicas.AgendaServicio(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_agendas_servicios', 'idagendaservicio', Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idagendaservicio', 'String');
    agregarParametro('iddocente', 'String');
    agregarParametro('idservicioprograma', 'String');
    agregarParametro('periodo', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAgendaServicio',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('AgendaServicio', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - AgendaServicio }
function TMatematicas.AgendasServicio(const idDocente: string;
  const Periodo: string): TJSONObject;
var
  Json, JsonServicio, JsonHorario: TJSONObject;
  Query, Query2: TFDQuery;
  ArrayJson, ArrayHorario: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
  j: integer;
  sumaHoras, sumaHorasSemana, horasTotales, horasSemestre, horasRestantes,
    semanasSemestre: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  Query2 := TFDQuery.create(nil);
  Query2.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('AgendasServicios', ArrayJson);

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_agendas_servicios as a ');
    Query.SQL.Add('INNER JOIN siap_servicios_programas as s ');
    Query.SQL.Add('ON a.idservicioprograma = s.idservicioprograma ');
    Query.SQL.Add('INNER JOIN siap_programas as p ');
    Query.SQL.Add('ON s.idprograma = p.idprograma ');
    Query.SQL.Add('WHERE iddocente=' + idDocente + ' AND a.periodo=' +
      Texto(Periodo));
    Query.Open;

    limpiarParametros;
    agregarParametro('idagendaservicio', 'String');
    agregarParametro('iddocente', 'String');
    agregarParametro('idservicioprograma', 'String');
    agregarParametro('periodo', 'String');
    agregarParametro('asignatura', 'String');
    agregarParametro('idprograma', 'String');
    agregarParametro('programa', 'String');
    agregarParametro('horas', 'String');
    agregarParametro('aulas', 'String');
    agregarParametro('semanas', 'Integer');

    sumaHoras := 0;
    sumaHorasSemana := 0;
    horasTotales := obtenerHorasDocencia(idDocente);

    for i := 1 to Query.RecordCount do
    begin
      JsonServicio := TJSONObject.create;
      JsonServicio := crearJSON(Query);

      semanasSemestre := Query.FieldByName('semanas').AsInteger;

      Query2.Close;
      Query2.SQL.Text :=
        'SELECT * FROM siap_horarios_servicios WHERE idservicioprograma=' +
        Texto(Query.FieldByName('idservicioprograma').AsString);
      Query2.Open;
      Query2.First;

      ArrayHorario := TJSONArray.create;

      for j := 1 to Query2.RecordCount do
      begin
        JsonHorario := TJSONObject.create;
        JsonHorario.AddPair('idhorarioservicio',
          Query2.FieldByName('idhorarioservicio').AsString);
        JsonHorario.AddPair('dia', Query2.FieldByName('dia').AsString);
        JsonHorario.AddPair('inicio', Query2.FieldByName('inicio').AsString);
        JsonHorario.AddPair('fin', Query2.FieldByName('fin').AsString);

        ArrayHorario.Add(JsonHorario);
        Query2.Next;
      end;

      sumaHorasSemana := sumaHorasSemana + Query.FieldByName('horas').AsInteger;
      horasSemestre := Query.FieldByName('horas').AsInteger * semanasSemestre;
      sumaHoras := sumaHoras + horasSemestre;

      JsonServicio.AddPair('horarios', ArrayHorario);
      JsonServicio.AddPair('horassemestre', IntToStr(horasSemestre));

      ArrayJson.AddElement(JsonServicio);
      Query.Next;
    end;

    horasRestantes := horasTotales - sumaHoras;
    Json.AddPair('docenciaDirecta', IntToStr(sumaHorasSemana));
    Json.AddPair('horasTotales', IntToStr(sumaHoras));
    Json.AddPair('horasRestantes', IntToStr(horasRestantes));

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllAgendaServicio',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('AgendasServicio', Json.toString);
  Query.Free;
end;

{ Método Delete - DesasociarAgenda }
function TMatematicas.cancelDesasociarAgenda(const token: string;
  const IdServicioPrograma: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_agendas_servicios', 'idservicioprograma',
        Texto(IdServicioPrograma), Query);

      Json.AddPair(JsonRespuesta,
        'El Servicio se eliminó de la agenda correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'cancelDesasociarAgenda',
        E.Message + '=> ' + IdServicioPrograma);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelAgendaServicio', Json.toString);
  Query.Free;
end;

{ Método DELETE - AgendaServicio }
function TMatematicas.cancelAgendaServicio(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_agendas_servicios', 'idagendaservicio', Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'El Servicio se eliminó de la agenda correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteAgendaServicio',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelAgendaServicio', Json.toString);
  Query.Free;
end;

{ Método UPDATE - AgendaServicio }
function TMatematicas.acceptAgendaServicio(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idagendaservicio', 'String');
      agregarParametro('iddocente', 'Integer');
      agregarParametro('idservicioprograma', 'String');
      agregarParametro('periodo', 'String');

      ID := datos.GetValue('idagendaservicio').Value;
      UPDATE('siap_agendas_servicios', 'idagendaservicio', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Servicio se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptAgendaServicio',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateAgendaServicio', Json.toString);
  Query.Free;
end;

{ Método INSERT - HorarioServicio }
function TMatematicas.updateHorarioServicio(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idhorarioservicio', 'String');
      agregarParametro('dia', 'String');
      agregarParametro('inicio', 'String');
      agregarParametro('fin', 'String');
      agregarParametro('salon', 'String');
      agregarParametro('idservicioprograma', 'String');

      INSERT('siap_horarios_servicios', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Horario se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateHorarioServicio',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateHorarioServicio', Json.toString);
  Query.Free;
end;

{ Método GET - HorarioServicio }
function TMatematicas.HorarioServicio(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_horarios_servicios', 'idhorarioservicio',
      Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idhorarioservicio', 'String');
    agregarParametro('dia', 'String');
    agregarParametro('inicio', 'String');
    agregarParametro('fin', 'String');
    agregarParametro('salon', 'String');
    agregarParametro('idservicioprograma', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getHorarioServicio',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('HorarioServicio', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - HorarioServicio }
function TMatematicas.HorariosServicio(const IdSercicioPrograma: string)
  : TJSONObject;
var
  Json, JsonHoras: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
  horas, totalHoras: integer;
  hIni, hFin: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('HorariosServicios', ArrayJson);

    limpiarConsulta(Query);
    SelectWhereOrder('siap_horarios_servicios', 'idservicioprograma', 'dia',
      Texto(IdSercicioPrograma), Query);

    limpiarParametros;
    agregarParametro('idhorarioservicio', 'String');
    agregarParametro('dia', 'String');
    agregarParametro('inicio', 'String');
    agregarParametro('fin', 'String');
    agregarParametro('salon', 'String');
    agregarParametro('idservicioprograma', 'String');

    totalHoras := 0;

    for i := 1 to Query.RecordCount do
    begin
      JsonHoras := TJSONObject.create;
      JsonHoras := crearJSON(Query);

      hIni := Query.FieldByName('inicio').AsString;
      hFin := Query.FieldByName('fin').AsString;

      horas := FHoras.IndexOf(hFin) - FHoras.IndexOf(hIni);
      totalHoras := totalHoras + horas;

      JsonHoras.AddPair('total', IntToStr(horas));
      ArrayJson.AddElement(JsonHoras);

      Query.Next;
    end;

    Json.AddPair('totalHoras', IntToStr(totalHoras));

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllHorarioServicio',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('HorariosServicio', Json.toString);
  Query.Free;
end;

{ Método DELETE - HorarioServicio }
function TMatematicas.cancelHorarioServicio(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_horarios_servicios', 'idhorarioservicio', Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'El Horario se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteHorarioServicio',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelHorarioServicio', Json.toString);
  Query.Free;
end;

{ Método UPDATE - HorarioServicio }
function TMatematicas.acceptHorarioServicio(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idhorarioservicio', 'String');
      agregarParametro('dia', 'String');
      agregarParametro('inicio', 'String');
      agregarParametro('fin', 'String');
      agregarParametro('salon', 'String');
      agregarParametro('idservicioprograma', 'String');

      ID := datos.GetValue('idhorarioservicio').Value;
      UPDATE('siap_horarios_servicios', 'idhorarioservicio', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Horario se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptHorarioServicio',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateHorarioServicio', Json.toString);
  Query.Free;
end;

{ Método INSERT - ServicioPrograma }
function TMatematicas.updateServicioPrograma(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idservicioprograma', 'String');
      agregarParametro('asignatura', 'String');
      agregarParametro('idprograma', 'String');
      agregarParametro('horas', 'Integer');
      agregarParametro('aulas', 'String');
      agregarParametro('periodo', 'String');
      agregarParametro('semanas', 'Integer');
      agregarParametro('jornada', 'String');
      agregarParametro('grupo', 'String');

      INSERT('siap_servicios_programas', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Servicio se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateServicioPrograma',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateServicioPrograma', Json.toString);
  Query.Free;
end;

{ Método GET - ServicioPrograma }
function TMatematicas.ServicioPrograma(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    Query.SQL.Add('select * from siap_servicios_programas as s ');
    Query.SQL.Add('inner join siap_programas as p ');
    Query.SQL.Add('on s.idprograma = p.idprograma WHERE idservicioprograma=' +
      Texto(ID));
    Query.Open;

    limpiarParametros;
    agregarParametro('idservicioprograma', 'String');
    agregarParametro('asignatura', 'String');
    agregarParametro('idprograma', 'String');
    agregarParametro('horas', 'String');
    agregarParametro('aulas', 'String');
    agregarParametro('periodo', 'String');
    agregarParametro('semanas', 'Integer');
    agregarParametro('programa', 'String');
    agregarParametro('jornada', 'String');
    agregarParametro('grupo', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getServicioPrograma',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('ServicioPrograma', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - ServicioPrograma }
function TMatematicas.ServiciosPrograma(const OrdenarPor: string;
  const Periodo: string): TJSONObject;
var
  Json, JsonHorario, JsonTemp: TJSONObject;
  Query, Query2, Query3: TFDQuery;
  ArrayJson, ArrayHorario: TJSONArray;
  JsonLinea: TJSONObject;
  i, j, hIni, hFin, Total, totalHoras, ld: integer;
  inicio, fin: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  Query2 := TFDQuery.create(nil);
  Query2.Connection := Conexion;

  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('ServiciosProgramas', ArrayJson);

    limpiarConsulta(Query);
    Query.SQL.Add('select * from siap_servicios_programas as s ');
    Query.SQL.Add('inner join siap_programas as p ');
    Query.SQL.Add('on s.idprograma = p.idprograma WHERE periodo=' +
      Texto(Periodo) + ' ORDER BY ' + OrdenarPor);
    Query.Open;

    limpiarParametros;
    agregarParametro('idservicioprograma', 'String');
    agregarParametro('asignatura', 'String');
    agregarParametro('idprograma', 'String');
    agregarParametro('horas', 'String');
    agregarParametro('aulas', 'String');
    agregarParametro('periodo', 'String');
    agregarParametro('programa', 'String');
    agregarParametro('semanas', 'Integer');
    agregarParametro('jornada', 'String');
    agregarParametro('grupo', 'String');

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.create;
      JsonTemp := crearJSON(Query);

      Query2.Close;
      Query2.SQL.Text :=
        'SELECT * FROM siap_horarios_servicios WHERE idservicioprograma=' +
        Texto(Query.FieldByName('idservicioprograma').AsString);
      Query2.Open;
      Query2.First;

      ArrayHorario := TJSONArray.create;
      totalHoras := 0;
      for j := 1 to Query2.RecordCount do
      begin
        inicio := Query2.FieldByName('inicio').AsString;
        fin := Query2.FieldByName('fin').AsString;

        hIni := FHoras.IndexOf(inicio);
        hFin := FHoras.IndexOf(fin);
        Total := hFin - hIni;
        totalHoras := totalHoras + Total;

        JsonHorario := TJSONObject.create;
        JsonHorario.AddPair('idhorarioservicio',
          Query2.FieldByName('idhorarioservicio').AsString);
        JsonHorario.AddPair('dia', Query2.FieldByName('dia').AsString);
        JsonHorario.AddPair('inicio', inicio);
        JsonHorario.AddPair('fin', fin);
        JsonHorario.AddPair('total', IntToStr(Total));
        JsonHorario.AddPair('salon', Query2.FieldByName('salon').AsString);
        JsonHorario.AddPair('idservicioprograma',
          Query2.FieldByName('idservicioprograma').AsString);

        ArrayHorario.Add(JsonHorario);
        Query2.Next;
      end;

      { Determinar quien tomo éste servicio }

      JsonTemp.AddPair('horas', IntToStr(totalHoras));
      JsonTemp.AddPair('horarios', ArrayHorario);

      ArrayJson.AddElement(JsonTemp);
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllServicioPrograma',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('ServiciosPrograma', Json.toString);
  Query.Free;
end;

function TMatematicas.ServiciosProgramaDocente(const idDocente, Periodo: string)
  : TJSONObject;
var
  Json, JsonHorario, JsonTemp: TJSONObject;
  Query, Query2, Query3: TFDQuery;
  ArrayJson, ArrayHorario: TJSONArray;
  JsonLinea: TJSONObject;
  i, j, Total, TotalSemana, horasDocencia, Semanas: integer;
  inicio, fin: string;
  validacion: TIntegerString;
  observacion, IdServicioPrograma: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  Query2 := TFDQuery.create(nil);
  Query2.Connection := Conexion;
  Query3 := TFDQuery.create(nil);
  Query3.Connection := Conexion;

  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('ServiciosProgramas', ArrayJson);

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_servicios_programas AS s ');
    Query.SQL.Add('INNER JOIN siap_programas AS p ');
    Query.SQL.Add('ON s.idprograma = p.idprograma WHERE periodo=' +
      Texto(Periodo) + ' ORDER BY programa');

    FDataSnapMatematicas.escribirSQL
      ('/* Consulta de servicios de programas */');
    FDataSnapMatematicas.escribirSQL(Query.SQL.Text);
    Query.Open;

    limpiarParametros;
    agregarParametro('idservicioprograma', 'String');
    agregarParametro('asignatura', 'String');
    agregarParametro('idprograma', 'String');
    agregarParametro('horas', 'String');
    agregarParametro('aulas', 'String');
    agregarParametro('periodo', 'String');
    agregarParametro('programa', 'String');
    agregarParametro('semanas', 'Integer');
    agregarParametro('jornada', 'String');
    agregarParametro('grupo', 'String');

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.create;
      JsonTemp := crearJSON(Query);

      Semanas := Query.FieldByName('semanas').AsInteger;

      IdServicioPrograma := Query.FieldByName('idservicioprograma').AsString;

      { Extraer las horas }
      Query2.Close;
      Query2.SQL.Text :=
        'SELECT * FROM siap_horarios_servicios WHERE idservicioprograma=' +
        Texto(IdServicioPrograma);
      Query2.Open;
      Query2.First;

      ArrayHorario := TJSONArray.create;
      TotalSemana := 0;

      for j := 1 to Query2.RecordCount do
      begin
        inicio := Query2.FieldByName('inicio').AsString;
        fin := Query2.FieldByName('fin').AsString;
        Total := (FHoras.IndexOf(fin) - FHoras.IndexOf(inicio));
        TotalSemana := TotalSemana + Total;

        JsonHorario := TJSONObject.create;
        JsonHorario.AddPair('idhorarioservicio',
          Query2.FieldByName('idhorarioservicio').AsString);
        JsonHorario.AddPair('dia', Query2.FieldByName('dia').AsString);
        JsonHorario.AddPair('inicio', inicio);
        JsonHorario.AddPair('fin', fin);
        JsonHorario.AddPair('total', IntToStr(Total));
        JsonHorario.AddPair('salon', Query2.FieldByName('salon').AsString);
        JsonHorario.AddPair('idservicioprograma',
          Query2.FieldByName('idservicioprograma').AsString);

        ArrayHorario.Add(JsonHorario);
        Query2.Next;
      end;

      { Determinar quien tomo éste servicio }
      observacion := obtenerDocenteServicio(IdServicioPrograma, Periodo);

      { Determinar si se le cruza éste horario }
      validacion := validarHorario(idDocente, IdServicioPrograma, Periodo);
      if observacion = '' then
        observacion := validacion.vString;

      { Determinar si el curso tiene mas horas de las que se pueden }
      if observacion = '' then
      begin

        Query3.Close;
        Query3.SQL.Clear;
        Query3.SQL.Add('SELECT * FROM siap_docentes as d ');
        Query3.SQL.Add('INNER JOIN siap_tipo_contrato as t ');
        Query3.SQL.Add('ON d.idtipocontrato = t.idtipocontrato ');
        Query3.SQL.Add('WHERE iddocente=' + idDocente);
        Query3.Open;

        Total := Query3.FieldByName('horas').AsInteger;
        horasDocencia := validacion.vInteger;
        TotalSemana := TotalSemana * Semanas;

        if (horasDocencia + TotalSemana) > Total then
          observacion := 'Excede las horas permitidas';
      end;

      JsonTemp.AddPair('horarios', ArrayHorario);
      JsonTemp.AddPair('observacion', observacion);

      ArrayJson.AddElement(JsonTemp);
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now),
        'getAllServicioProgramaDocente', E.Message + ' -no data- ');
    end;
  end;

  Result := Json;
  escribirMensaje('ServiciosPrograma', Json.toString);
  Query.Free;
end;

{ Método DELETE - ServicioPrograma }
function TMatematicas.cancelServicioPrograma(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_servicios_programas', 'idservicioprograma',
        Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'El Servicio se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteServicioPrograma',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelServicioPrograma', Json.toString);
  Query.Free;
end;

{ Método UPDATE - ServicioPrograma }
function TMatematicas.acceptServicioPrograma(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idservicioprograma', 'String');
      agregarParametro('asignatura', 'String');
      agregarParametro('idprograma', 'String');
      agregarParametro('horas', 'Integer');
      agregarParametro('aulas', 'String');
      agregarParametro('periodo', 'String');
      agregarParametro('semanas', 'Integer');
      agregarParametro('jornada', 'String');
      agregarParametro('grupo', 'String');

      ID := datos.GetValue('idservicioprograma').Value;
      UPDATE('siap_servicios_programas', 'idservicioprograma',
        Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Servicio se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptServicioPrograma',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateServicioPrograma', Json.toString);
  Query.Free;
end;

{ Método INSERT - Programa }
function TMatematicas.updatePrograma(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idprograma', 'String');
      agregarParametro('programa', 'String');
      agregarParametro('idfacultad', 'String');

      INSERT('siap_programas', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Programa se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updatePrograma',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updatePrograma', Json.toString);
  Query.Free;
end;

{ Método GET - Programa }
function TMatematicas.Programa(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_programas AS p ');
    Query.SQL.Add('INNER JOIN siap_facultades AS f ');
    Query.SQL.Add('ON p.idfacultad = f.idfacultad WHERE idprograma=' +
      Texto(ID));
    Query.Open;

    limpiarParametros;
    agregarParametro('idprograma', 'String');
    agregarParametro('programa', 'String');
    agregarParametro('facultad', 'String');
    agregarParametro('idfacultad', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getPrograma',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('Programa', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - Programa }
function TMatematicas.Programas: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Programas', ArrayJson);

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_programas AS p ');
    Query.SQL.Add('INNER JOIN siap_facultades AS f ');
    Query.SQL.Add('ON p.idfacultad = f.idfacultad');
    Query.Open;

    limpiarParametros;
    agregarParametro('idprograma', 'String');
    agregarParametro('programa', 'String');
    agregarParametro('facultad', 'String');
    agregarParametro('idfacultad', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllPrograma',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Programas', Json.toString);
  Query.Free;
end;

{ Método DELETE - Programa }
function TMatematicas.cancelPrograma(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_programas', 'idprograma', Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'El Programa se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deletePrograma',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelPrograma', Json.toString);
  Query.Free;
end;

{ Método UPDATE - Programa }
function TMatematicas.acceptPrograma(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idprograma', 'String');
      agregarParametro('programa', 'String');
      agregarParametro('idfacultad', 'String');

      ID := datos.GetValue('idprograma').Value;
      UPDATE('siap_programas', 'idprograma', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Programa se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptPrograma',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updatePrograma', Json.toString);
  Query.Free;
end;

{ Método INSERT - Facultad }
function TMatematicas.updateFacultad(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idfacultad', 'String');
      agregarParametro('facultad', 'String');

      INSERT('siap_facultades', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Facultad se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateFacultad',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateFacultad', Json.toString);
  Query.Free;
end;

{ Método GET - Facultad }
function TMatematicas.Facultad(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_facultades', 'idfacultad', Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idfacultad', 'String');
    agregarParametro('facultad', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getFacultad',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('Facultad', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - Facultad }
function TMatematicas.Facultades: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Facultades', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_facultades', 'facultad', Query);

    limpiarParametros;
    agregarParametro('idfacultad', 'String');
    agregarParametro('facultad', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllFacultad',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Facultades', Json.toString);
  Query.Free;
end;

{ Método DELETE - Facultad }
function TMatematicas.cancelFacultad(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_facultades', 'idfacultad', Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'La Facultad se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteFacultad',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelFacultad', Json.toString);
  Query.Free;
end;

{ Método UPDATE - Facultad }
function TMatematicas.acceptFacultad(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idfacultad', 'String');
      agregarParametro('facultad', 'String');

      ID := datos.GetValue('idfacultad').Value;
      UPDATE('siap_facultades', 'idfacultad', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Facultad se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptFacultad',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateFacultad', Json.toString);
  Query.Free;
end;

{ Método INSERT - Docente }
function TMatematicas.updateDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('iddocente', 'Integer');
      agregarParametro('documento', 'Integer');
      agregarParametro('nombre', 'String');
      agregarParametro('telefono', 'String');
      agregarParametro('correo', 'String');
      agregarParametro('activo', 'String');
      agregarParametro('idcategoriadocente', 'String');
      agregarParametro('idtipocontrato', 'String');

      INSERT('siap_docentes', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Docente se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateDocente', Json.toString);
  Query.Free;
end;

{ Método GET - Docente }
function TMatematicas.Docente(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
  ruta: string;
  Foto: TStringList;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_docentes AS d ');
    Query.SQL.Add('INNER JOIN siap_categoria_docentes AS c ');
    Query.SQL.Add('ON d.idcategoriadocente = c.idcategoriadocente');
    Query.SQL.Add('INNER JOIN siap_tipo_contrato as t');
    Query.SQL.Add('ON d.idtipocontrato = t.idtipocontrato');
    Query.SQL.Add('WHERE iddocente=' + ID);
    Query.Open;

    limpiarParametros;
    agregarParametro('iddocente', 'String');
    agregarParametro('documento', 'Integer');
    agregarParametro('nombre', 'String');
    agregarParametro('telefono', 'String');
    agregarParametro('correo', 'String');
    agregarParametro('categoria', 'String');
    agregarParametro('contrato', 'String');
    agregarParametro('activo', 'String');
    agregarParametro('idcategoriadocente', 'String');
    agregarParametro('idtipocontrato', 'String');

    Json := crearJSON(Query);

    ruta := ExtractFilePath(ParamStr(0)) + '\FotosDocentes';
    Foto := TStringList.create;
    if FileExists(ruta + '\' + ID + '.foto.base64') then
    begin
      Foto.LoadFromFile(ruta + '\' + ID + '.foto.base64');
      Json.AddPair('foto', Foto[0]);
    end
    else
      Json.AddPair('foto', '');

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getDocente',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('Docente', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - Docente }
function TMatematicas.Docentes(const OrdenarPor: string): TJSONObject;
var
  Json, JsonTemp: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
  ruta, ID: string;
  Foto: TStringList;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Docentes', ArrayJson);

    limpiarConsulta(Query);
    Query.SQL.Add('SELECT * FROM siap_docentes AS d ');
    Query.SQL.Add('INNER JOIN siap_categoria_docentes AS c ');
    Query.SQL.Add('ON d.idcategoriadocente = c.idcategoriadocente');
    Query.SQL.Add('INNER JOIN siap_tipo_contrato as t');
    Query.SQL.Add('ON d.idtipocontrato = t.idtipocontrato' + ' ORDER BY ' +
      OrdenarPor);
    Query.Open;

    limpiarParametros;
    agregarParametro('iddocente', 'String');
    agregarParametro('documento', 'Integer');
    agregarParametro('nombre', 'String');
    agregarParametro('telefono', 'String');
    agregarParametro('correo', 'String');
    agregarParametro('categoria', 'String');
    agregarParametro('contrato', 'String');
    agregarParametro('activo', 'String');
    agregarParametro('idcategoriadocente', 'String');
    agregarParametro('idtipocontrato', 'String');

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.create;
      JsonTemp := crearJSON(Query);

      ruta := ExtractFilePath(ParamStr(0)) + '\FotosDocentes';
      ID := JsonTemp.GetValue('iddocente').Value;
      Foto := TStringList.create;
      if FileExists(ruta + '\' + ID + '.foto.base64') then
      begin
        Foto.LoadFromFile(ruta + '\' + ID + '.foto.base64');
        JsonTemp.AddPair('foto', Foto[0]);
      end
      else
        JsonTemp.AddPair('foto', '');

      ArrayJson.AddElement(JsonTemp);
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Docentes', Json.toString);
  Query.Free;
end;

function TMatematicas.DocentesPorContrato(const IdContrato: string)
  : TJSONObject;
var
  Json, JsonTemp: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
  ruta, ID: string;
  Foto: TStringList;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Docentes', ArrayJson);

    limpiarConsulta(Query);

    Query.SQL.Add('SELECT * FROM siap_docentes AS d ');
    Query.SQL.Add('INNER JOIN siap_categoria_docentes AS c ');
    Query.SQL.Add('ON d.idcategoriadocente = c.idcategoriadocente');
    Query.SQL.Add('INNER JOIN siap_tipo_contrato as t');
    Query.SQL.Add
      ('ON d.idtipocontrato = t.idtipocontrato WHERE d.idtipocontrato=' +
      Texto(IdContrato) + ' ORDER BY nombre');
    Query.Open;

    limpiarParametros;
    agregarParametro('iddocente', 'String');
    agregarParametro('documento', 'Integer');
    agregarParametro('nombre', 'String');
    agregarParametro('telefono', 'String');
    agregarParametro('correo', 'String');
    agregarParametro('categoria', 'String');
    agregarParametro('contrato', 'String');
    agregarParametro('activo', 'String');
    agregarParametro('idcategoriadocente', 'String');
    agregarParametro('idtipocontrato', 'String');

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.create;
      JsonTemp := crearJSON(Query);

      ruta := ExtractFilePath(ParamStr(0)) + '\FotosDocentes';
      ID := JsonTemp.GetValue('iddocente').Value;
      Foto := TStringList.create;
      if FileExists(ruta + '\' + ID + '.foto.base64') then
      begin
        Foto.LoadFromFile(ruta + '\' + ID + '.foto.base64');
        JsonTemp.AddPair('foto', Foto[0]);
      end
      else
        JsonTemp.AddPair('foto', '');

      ArrayJson.AddElement(JsonTemp);
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Docentes', Json.toString);
  Query.Free;
end;

{ Método DELETE - Docente }
function TMatematicas.cancelDocente(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_docentes', 'iddocente', Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'El Docente se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteDocente',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelDocente', Json.toString);
  Query.Free;
end;

{ Método UPDATE - Docente }
function TMatematicas.acceptDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('iddocente', 'Integer');
      agregarParametro('documento', 'Integer');
      agregarParametro('nombre', 'String');
      agregarParametro('telefono', 'String');
      agregarParametro('correo', 'String');
      agregarParametro('activo', 'String');
      agregarParametro('idcategoriadocente', 'String');
      agregarParametro('idtipocontrato', 'String');

      ID := datos.GetValue('iddocente').Value;
      UPDATE('siap_docentes', 'iddocente', ID, Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Docente se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateDocente', Json.toString);
  Query.Free;
end;

function TMatematicas.acceptFotoDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  ID, ruta: string;
  Foto: TStringList;
begin
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      Foto := TStringList.create;
      Foto.Add(datos.GetValue('foto').Value);
      ID := datos.GetValue('iddocente').Value;

      ruta := ExtractFilePath(ParamStr(0)) + '\FotosDocentes';
      if not DirectoryExists(ruta) then
        CreateDir(ruta);

      Foto.SaveToFile(ruta + '\' + ID + '.foto.base64');

      Json.AddPair(JsonRespuesta, 'La Foto se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateDocente', Json.toString);
  Query.Free;
end;

{ Método INSERT - CategoriaDocente }
function TMatematicas.updateCategoriaDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idcategoriadocente', 'String');
      agregarParametro('categoria', 'String');

      INSERT('siap_categoria_docentes', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Categoría se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateCategoriaDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateCategoriaDocente', Json.toString);
  Query.Free;
end;

{ Método GET - CategoriaDocente }
function TMatematicas.CategoriaDocente(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_categoria_docentes', 'idcategoriadocente',
      Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idcategoriadocente', 'String');
    agregarParametro('categoria', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getCategoriaDocente',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('CategoriaDocente', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - CategoriaDocente }
function TMatematicas.CategoriasDocente: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('CategoriasDocentes', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_categoria_docentes', 'categoria', Query);

    limpiarParametros;
    agregarParametro('idcategoriadocente', 'String');
    agregarParametro('categoria', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllCategoriaDocente',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('CategoriasDocente', Json.toString);
  Query.Free;
end;

{ Método DELETE - CategoriaDocente }
function TMatematicas.cancelCategoriaDocente(const token, ID: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_categoria_docentes', 'idcategoriadocente', Texto(ID), Query);

      Json.AddPair(JsonRespuesta, 'La Categoría se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteCategoriaDocente',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelCategoriaDocente', Json.toString);
  Query.Free;
end;

{ Método UPDATE - CategoriaDocente }
function TMatematicas.acceptCategoriaDocente(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idcategoriadocente', 'String');
      agregarParametro('categoria', 'String');

      ID := datos.GetValue('idcategoriadocente').Value;
      UPDATE('siap_categoria_docentes', 'idcategoriadocente', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'La Categoría se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptCategoriaDocente',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateCategoriaDocente', Json.toString);
  Query.Free;
end;

{ Método INSERT - Error }
function TMatematicas.updateError(const token: string; const datos: TJSONObject)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('iderror', 'String');
      agregarParametro('hora', 'String');
      agregarParametro('fecha', 'String');
      agregarParametro('procedimiento', 'String');
      agregarParametro('mensaje', 'String');

      INSERT('siap_errores', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Registro de Error se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateError',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateError', Json.toString);
  Query.Free;
end;

{ Método GET - Error }
function TMatematicas.Error(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_errores', 'iderror', Texto(ID), Query);

    limpiarParametros;
    agregarParametro('iderror', 'String');
    agregarParametro('hora', 'String');
    agregarParametro('fecha', 'String');
    agregarParametro('procedimiento', 'String');
    agregarParametro('mensaje', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getError',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('Error', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - Error }
function TMatematicas.Errores: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('Errores', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_errores', 'hora', Query);

    limpiarParametros;
    agregarParametro('iderror', 'String');
    agregarParametro('hora', 'String');
    agregarParametro('fecha', 'String');
    agregarParametro('procedimiento', 'String');
    agregarParametro('mensaje', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllError',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('Errores', Json.toString);
  Query.Free;
end;

{ Método DELETE - Error }
function TMatematicas.cancelError(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_errores', 'iderror', Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'El Registro de Error se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteError',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelError', Json.toString);
  Query.Free;
end;

function TMatematicas.cancelErrorPorMensaje(const token, msg: string)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_errores', 'mensaje', Texto(msg), Query);

      Json.AddPair(JsonRespuesta,
        'Los Registros de Error se eliminaron correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteError',
        E.Message + '=> ' + msg);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelError', Json.toString);
  Query.Free;
end;

{ Método UPDATE - Error }
function TMatematicas.acceptError(const token: string; const datos: TJSONObject)
  : TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('iderror', 'String');
      agregarParametro('hora', 'String');
      agregarParametro('fecha', 'String');
      agregarParametro('procedimiento', 'String');
      agregarParametro('mensaje', 'String');

      ID := datos.GetValue('iderror').Value;
      UPDATE('siap_errores', 'iderror', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'El Registro de Error se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptError',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateError', Json.toString);
  Query.Free;
end;

{ Método INSERT - TipoContrato }
function TMatematicas.updateTipoContrato(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  try
    Query := TFDQuery.create(nil);
    Query.Connection := Conexion;
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idtipocontrato', 'String');
      agregarParametro('contrato', 'String');
      agregarParametro('horas', 'String');

      INSERT('siap_tipo_contrato', Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta, 'El Tipo de Contrato se creo correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'updateTipoContrato',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateTipoContrato', Json.toString);
  Query.Free;
end;

{ Método GET - TipoContrato }
function TMatematicas.TipoContrato(const ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    limpiarConsulta(Query);
    SelectWhere('siap_tipo_contrato', 'idtipocontrato', Texto(ID), Query);

    limpiarParametros;
    agregarParametro('idtipocontrato', 'String');
    agregarParametro('contrato', 'String');
    agregarParametro('horas', 'String');

    Json := crearJSON(Query);

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getTipoContrato',
        E.Message + '=>' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('TipoContrato', Json.toString);
  Query.Free;
end;

{ Método GET-ALL - TipoContrato }
function TMatematicas.TiposContrato: TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ArrayJson: TJSONArray;
  JsonLinea: TJSONObject;
  i: integer;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;
    ArrayJson := TJSONArray.create;
    Json.AddPair('TiposContratos', ArrayJson);

    limpiarConsulta(Query);
    SELECT('siap_tipo_contrato', 'contrato', Query);

    limpiarParametros;
    agregarParametro('idtipocontrato', 'String');
    agregarParametro('contrato', 'String');
    agregarParametro('horas', 'String');

    for i := 1 to Query.RecordCount do
    begin
      ArrayJson.AddElement(crearJSON(Query));
      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'getAllTipoContrato',
        E.Message + '-no data-');
    end;
  end;

  Result := Json;
  escribirMensaje('TiposContrato', Json.toString);
  Query.Free;
end;

{ Método DELETE - TipoContrato }
function TMatematicas.cancelTipoContrato(const token, ID: string): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);
      DELETE('siap_tipo_contrato', 'idtipocontrato', Texto(ID), Query);

      Json.AddPair(JsonRespuesta,
        'El Tipo de Contrato se eliminó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'deleteTipoContrato',
        E.Message + '=> ' + ID);
    end;
  end;

  Result := Json;
  escribirMensaje('cancelTipoContrato', Json.toString);
  Query.Free;
end;

{ Método UPDATE - TipoContrato }
function TMatematicas.acceptTipoContrato(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  Query: TFDQuery;
  ID: string;
begin
  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      limpiarConsulta(Query);

      limpiarParametros;

      agregarParametro('idtipocontrato', 'String');
      agregarParametro('contrato', 'String');
      agregarParametro('horas', 'String');

      ID := datos.GetValue('idtipocontrato').Value;
      UPDATE('siap_tipo_contrato', 'idtipocontrato', Texto(ID), Query);

      asignarDatos(datos, Query);

      Json.AddPair(JsonRespuesta,
        'El Tipo de Contrato se actualizó correctamente');
    end
    else
    begin
      Json.AddPair(JsonRespuesta, AccesoDenegado);
    end;

  except
    on E: Exception do
    begin
      Json.AddPair(JsonError, E.Message);
      enviarError(TimeToStr(now), DateToStr(now), 'acceptTipoContrato',
        E.Message + datos.toString);
    end;
  end;

  Result := Json;
  escribirMensaje('updateTipoContrato', Json.toString);
  Query.Free;
end;

{ CRUD: referenciaResumen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.referenciaResumen(idClave: string): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
begin
  try
    _referenciaResumen := TreferenciaResumen.create;
    _referenciaResumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _referenciaResumen.getAll
    else if idClave = 'model' then
      Result := _referenciaResumen.model
    else
      Result := _referenciaResumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-referenciaResumen');
  end;
end;

function TMatematicas.referenciasResumen(idClave: string): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
begin
  try
    _referenciaResumen := TreferenciaResumen.create;
    _referenciaResumen.Conexion := Conexion;

    iniciarConexion;

    Result := _referenciaResumen.getReferenciasResumenes(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-referenciasResumen');
  end;
end;

function TMatematicas.updatereferenciaResumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateReferenciaResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptreferenciaResumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptReferenciaResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelreferenciaResumen(const idClave: string;
  const token: string): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelReferenciaResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

{ CRUD: autorResumen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.autoresResumen(idClave: string): TJSONObject;
var
  Json, JsonFor: TJSONObject;
  ArregloJSON: TJSONArray;
  i: integer;
begin
  try
    iniciarConexion;

    Json := TJSONObject.create;
    ArregloJSON := TJSONArray.create;
    Json.AddPair('autores', ArregloJSON);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumenes_autor WHERE id_resumen=' +
      chr(39) + idClave + chr(39) + ' ORDER BY id_resumen_autor';
    Query.Open;
    Query.First;

    for i := 1 to Query.RecordCount do
    begin
      JsonFor := TJSONObject.create;

      Query2.Close;
      Query2.SQL.Text := 'SELECT * FROM math_autor_resumen WHERE cedula=' +
        chr(39) + Query.FieldByName('cedula').AsString + chr(39);
      Query2.Open;

      JsonFor.AddPair('cedula', Query2.FieldByName('cedula').AsString);
      JsonFor.AddPair('correo', Query2.FieldByName('correo').AsString);
      JsonFor.AddPair('nombre', Query2.FieldByName('nombre').AsString);
      JsonFor.AddPair('institucion', Query2.FieldByName('institucion')
        .AsString);

      ArregloJSON.AddElement(JsonFor);

      Query.Next;
    end;
    terminarConexion;

    escribirMensaje(Json.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-autoresResumen');
  end;

  Result := Json;
end;

function TMatematicas.autorPorCedula(cedula: string): TJSONObject;
var
  Json: TJSONObject;
begin
  try
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_autor_resumen WHERE cedula=' + chr(39)
      + cedula + chr(39);

    Query.Open;

    Json := TJSONObject.create;

    if Query.RecordCount > 0 then
    begin
      Json.AddPair('cedula', Query.FieldByName('cedula').AsString);
      Json.AddPair('nombre', Query.FieldByName('nombre').AsString);
      Json.AddPair('correo', Query.FieldByName('correo').AsString);
      Json.AddPair('institucion', Query.FieldByName('institucion').AsString);
      Json.AddPair('resultado', 'autor encontrado');
    end
    else
    begin
      Json.AddPair('cedula', cedula);
      Json.AddPair('nombre', '');
      Json.AddPair('correo', '');
      Json.AddPair('institucion', '');
      Json.AddPair('resultado', 'el autor no existe');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-autorPorCedula');
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.autorResumen(idClave: string): TJSONObject;
var
  _autorResumen: TautorResumen;
begin
  try
    _autorResumen := TautorResumen.create;
    _autorResumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _autorResumen.getAll
    else if idClave = 'model' then
      Result := _autorResumen.model
    else
      Result := _autorResumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-autorResumen');
  end;
end;

function TMatematicas.updateagregarAutorResumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      iniciarConexion;

      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_autor_resumen WHERE cedula=' +
        chr(39) + datos.GetValue('cedula').Value + chr(39);
      Query.Open;

      if Query.RecordCount > 0 then
      begin
        Query.Close;
        Query.SQL.Text :=
          'INSERT INTO math_resumenes_autor (cedula, id_resumen)' +
          ' VALUES (:cedula, :id_resumen)';
        Query.Params.ParamByName('cedula').Value :=
          datos.GetValue('cedula').Value;
        Query.Params.ParamByName('id_resumen').Value :=
          datos.GetValue('id_resumen').Value;
        Query.ExecSQL;

        Json.AddPair('resultado', 'El autor se creo correctamente');
      end
      else
      begin
        Query.Close;
        Query.SQL.Text := 'INSERT INTO math_autor_resumen (cedula, nombre,' +
          'correo,institucion)' +
          ' VALUES (:cedula, :nombre, :correo, :institucion)';

        Query.Params.ParamByName('cedula').Value :=
          datos.GetValue('cedula').Value;
        Query.Params.ParamByName('nombre').Value :=
          datos.GetValue('nombre').Value;
        Query.Params.ParamByName('correo').Value :=
          datos.GetValue('correo').Value;
        Query.Params.ParamByName('institucion').Value :=
          datos.GetValue('institucion').Value;
        Query.ExecSQL;

        Query.Close;
        Query.SQL.Text :=
          'INSERT INTO math_resumenes_autor (cedula, id_resumen)' +
          ' VALUES (:cedula, :id_resumen)';
        Query.Params.ParamByName('cedula').Value :=
          datos.GetValue('cedula').Value;
        Query.Params.ParamByName('id_resumen').Value :=
          datos.GetValue('id_resumen').Value;
        Query.ExecSQL;

        Json.AddPair('resultado', 'El autor se creo correctamente');
      end;

      terminarConexion;

      escribirMensaje(Json.toString, 'post');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateAgregarAutorResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.updateautorResumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _autorResumen: TautorResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _autorResumen := TautorResumen.create;
      _autorResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _autorResumen.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateAutorResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptautorResumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      iniciarConexion;
      escribirMensaje('linea 0', '0');
      Query.Close;
      Query.SQL.Text := 'UPDATE math_autor_resumen SET nombre=:nombre' +
        ', correo=:correo, institucion=:institucion WHERE cedula=' + chr(39) +
        datos.GetValue('cedula').Value + chr(39);

      escribirMensaje('primera linea', '0');
      Query.Params.ParamByName('nombre').Value :=
        datos.GetValue('nombre').Value;
      Query.Params.ParamByName('correo').Value :=
        datos.GetValue('correo').Value;
      Query.Params.ParamByName('institucion').Value :=
        datos.GetValue('institucion').Value;
      escribirMensaje('segunda linea', '0');
      Query.ExecSQL;

      Json.AddPair('resultado', 'autor actualizado correctamete');
      escribirMensaje('tercera linea', '0');
      terminarConexion;

      escribirMensaje(Json.toString, 'put');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptAutorResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelautorResumen(const cedula: string;
  const id_resumen: string; const token: string): TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      iniciarConexion;

      Query.Close;
      Query.SQL.Text := 'DELETE FROM math_resumenes_autor WHERE cedula=' +
        chr(39) + cedula + chr(39) + ' AND id_resumen=' + chr(39) + id_resumen
        + chr(39);
      Query.ExecSQL;

      Json.AddPair('respuesta', 'el autor se elimino correctamente');

      terminarConexion;

      escribirMensaje(Json.toString, 'delete');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje('cancelautorResumen' + E.Message,
        'error-cancelAutorResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelborrarResumen(const id_resumen: string;
  const token: string): TJSONObject;
var
  i: integer;
  Json: TJSONObject;
begin
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      { Borrar palabras clave }
      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_palabras_clave WHERE id_resumen=' +
        chr(39) + id_resumen + chr(39);
      Query.Open;
      Query.First;

      for i := 1 to Query.RecordCount do
      begin
        Query2.Close;
        Query2.SQL.Text :=
          'DELETE FROM math_palabras_clave WHERE id_palabra_clave=' + chr(39) +
          Query.FieldByName('id_palabra_clave').AsString + chr(39);
        Query2.ExecSQL;
        Query.Next;
      end;

      { Borrar Autores }
      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_resumenes_autor WHERE id_resumen=' +
        chr(39) + id_resumen + chr(39);
      Query.Open;
      Query.First;

      for i := 1 to Query.RecordCount do
      begin
        Query2.Close;
        Query2.SQL.Text :=
          'DELETE FROM math_resumenes_autor WHERE id_resumen_autor=' + chr(39) +
          Query.FieldByName('id_resumen_autor').AsString + chr(39);
        Query2.ExecSQL;
        Query.Next;
      end;

      { Borrar Referencias }
      Query.Close;
      Query.SQL.Text :=
        'SELECT * FROM math_bibliografia_resumen WHERE id_resumen=' + chr(39) +
        id_resumen + chr(39);
      Query.Open;
      Query.First;

      for i := 1 to Query.RecordCount do
      begin
        Query2.Close;
        Query2.SQL.Text :=
          'DELETE FROM math_bibliografia_resumen WHERE id_bibliografia=' +
          chr(39) + Query.FieldByName('id_bibliografia').AsString + chr(39);
        Query2.ExecSQL;
        Query.Next;
      end;

      { Borrar resumen }
      Query.Close;
      Query.SQL.Text := 'DELETE FROM math_resumen WHERE id_resumen=' + chr(39) +
        id_resumen + chr(39);
      Query.ExecSQL;

      Json.AddPair('respuesta', 'El resumen fue borrado correctamente');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelBorrarResumen');
      Json.AddPair('respuesta', 'Ocurrio un error en: borrarResumen (' +
        E.Message + ')');
    end;
  end;
end;

{ CRUD: palabraClave %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.palabraClave(idClave: string): TJSONObject;
var
  _palabraClave: TpalabraClave;
begin
  try
    _palabraClave := TpalabraClave.create;
    _palabraClave.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _palabraClave.getAll
    else if idClave = 'model' then
      Result := _palabraClave.model
    else
      Result := _palabraClave.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-palabraClave');
  end;
end;

function TMatematicas.palabraClaveResumen(idClave: string): TJSONObject;
var
  _palabraClave: TpalabraClave;
begin
  try
    _palabraClave := TpalabraClave.create;
    _palabraClave.Conexion := Conexion;

    iniciarConexion;

    Result := _palabraClave.getPalabrasResumenes(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-palabraClaveResumen');
  end;
end;

function TMatematicas.updatepalabraClave(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _palabraClave: TpalabraClave;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updatePalabraClave');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptpalabraClave(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _palabraClave: TpalabraClave;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptPalabraClave');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelpalabraClave(const idClave: string;
  const token: string): TJSONObject;
var
  _palabraClave: TpalabraClave;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelPalabraClave');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

{ CRUD: resumenes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.resumen(idClave: string): TJSONObject;
var
  _resumen: Tresumen;
begin
  try
    _resumen := Tresumen.create;
    _resumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _resumen.getAll
    else if idClave = 'model' then
      Result := _resumen.model
    else
      Result := _resumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-resumen');
  end;
end;

function TMatematicas.resumenesAutor(idClave: string): TJSONObject;
var
  _resumen: Tresumen;
begin
  try
    _resumen := Tresumen.create;
    _resumen.Conexion := Conexion;

    iniciarConexion;

    Result := _resumen.getForAutor(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-resumenesAutor');
  end;
end;

function TMatematicas.resumenPorTipo(const tipo: string): TJSONObject;
var
  Json, JsonFor: TJSONObject;
  ArregloJSON: TJSONArray;
  i: integer;
begin
  try
    Json := TJSONObject.create;
    ArregloJSON := TJSONArray.create;
    Json.AddPair('resumenes', ArregloJSON);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE tipo=' + chr(39) + tipo
      + chr(39) + ' ORDER BY capacidad';
    Query.Open;
    Query.First;

    escribirMensaje('datos', IntToStr(Query.RecordCount));

    for i := 1 to Query.RecordCount do
    begin
      JsonFor := TJSONObject.create;
      JsonFor.AddPair('idResumen', Query.FieldByName('id_resumen').AsString);
      JsonFor.AddPair('titulo', Query.FieldByName('titulo').AsString);
      JsonFor.AddPair('resumen', Query.FieldByName('resumen').AsString);
      JsonFor.AddPair('linea', Query.FieldByName('linea').AsString);
      JsonFor.AddPair('tipo', Query.FieldByName('tipo').AsString);
      JsonFor.AddPair('objetivo', Query.FieldByName('objetivo').AsString);
      JsonFor.AddPair('capacidad', Query.FieldByName('capacidad').AsString);
      JsonFor.AddPair('materiales', Query.FieldByName('materiales').AsString);
      JsonFor.AddPair('prerequisito', Query.FieldByName('prerequisito')
        .AsString);
      JsonFor.AddPair('requiereSala', Query.FieldByName('requiere_sala')
        .AsString);
      JsonFor.AddPair('evaluado', Query.FieldByName('evaluado').AsString);
      JsonFor.AddPair('idAutor', Query.FieldByName('id_autor').AsString);
      JsonFor.AddPair('nombreAutor', Query.FieldByName('nombre_autor')
        .AsString);
      JsonFor.AddPair('subtitulo', Query.FieldByName('subtitulo').AsString);

      ArregloJSON.AddElement(JsonFor);

      Query.Next;
    end;

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.updateresumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _resumen: Tresumen;
  Json: TJSONObject;
begin

  Json := TJSONObject.create;
  try
    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptresumen(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _resumen: Tresumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelresumen(const idClave: string; const token: string)
  : TJSONObject;
var
  _resumen: Tresumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelResumen');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

{ CRUD: participantees %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.participante(idClave: string): TJSONObject;
var
  _participante: Tparticipante;
begin
  try
    _participante := Tparticipante.create;
    _participante.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _participante.getAll
    else if idClave = 'model' then
      Result := _participante.model
    else
      Result := _participante.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-participante');
  end;
end;

function TMatematicas.permiteCrearResumenes: TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  if FDataSnapMatematicas.permiteCrearResumen then
    Json.AddPair('permite', 'si')
  else
    Json.AddPair('permite', 'no');

  Result := Json;
end;

function TMatematicas.permiteInscribirseTalleres: TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  if FDataSnapMatematicas.permiteInscribirTalleres then
    Json.AddPair('permite', 'si')
  else
    Json.AddPair('permite', 'no');

  Result := Json;
end;

function TMatematicas.updateparticipante(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _participante: Tparticipante;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.post(datos);
      terminarConexion;

    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      if Pos('existe la llave', E.Message) >= 0 then
        Json.AddPair('respuesta', 'El usuario ya esta registrado')
      else
        Json.AddPair('respuesta', E.Message)
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptparticipante(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _participante: Tparticipante;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptParticipante');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelparticipante(const idClave: string;
  const token: string): TJSONObject;
var
  _participante: Tparticipante;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelParticipante');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

{ CRUD: usuarioes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.usuario(idClave: string): TJSONObject;
var
  _usuario: Tusuario;
begin
  try
    _usuario := Tusuario.create;
    _usuario.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _usuario.getAll
    else if idClave = 'model' then
      Result := _usuario.model
    else
      Result := _usuario.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-usuario');
  end;
end;

function TMatematicas.validarHorario(idDocente, idservicio, Periodo: string)
  : TIntegerString;
var
  Query: TFDQuery;
  Query2: TFDQuery;
  diaA, diaB, iniA, iniB, finA, finB: integer;
  i: integer;
  j: integer;
  fm: boolean;
  horasDocencia, horas: integer;
begin
  Result.vString := '';
  Result.vInteger := 0;
  horasDocencia := 0;

  Query := TFDQuery.create(nil);
  Query.Connection := Conexion;

  Query2 := TFDQuery.create(nil);
  Query2.Connection := Conexion;

  { Leer el horario del servicio enviado }
  Query2.Close;
  Query2.SQL.Text :=
    'select * from siap_horarios_servicios where idservicioprograma=' +
    Texto(idservicio);
  Query2.Open;
  Query2.First;

  { Leer los servicios asociados al docente }
  Query.Close;
  Query.SQL.Clear;

  Query.SQL.Add('SELECT * FROM siap_agendas_servicios as a ');
  Query.SQL.Add('INNER JOIN siap_horarios_servicios as h ');
  Query.SQL.Add('ON a.idservicioprograma = h.idservicioprograma ');
  Query.SQL.Add('WHERE a.iddocente = ' + idDocente);
  Query.SQL.Add(' AND a.periodo = ' + Texto(Periodo));
  Query.Open;
  Query.First;

  { Crear un ciclo anidado para evaluar las condiciones }
  for i := 1 to Query2.RecordCount do
  begin
    diaA := FDias.IndexOf(Query2.FieldByName('dia').AsString);
    iniA := FHoras.IndexOf(Query2.FieldByName('inicio').AsString);
    finA := FHoras.IndexOf(Query2.FieldByName('fin').AsString);

    for j := 1 to Query.RecordCount do
    begin
      diaB := FDias.IndexOf(Query.FieldByName('dia').AsString);
      iniB := FHoras.IndexOf(Query.FieldByName('inicio').AsString);
      finB := FHoras.IndexOf(Query.FieldByName('fin').AsString);

      fm := abs(diaA - diaB) = 0;
      fm := fm and ((iniA - iniB) < abs(finA - iniA));

      horas := finB - iniB;

      if fm then
      begin
        Result.vString := 'El Horario se Cruza';
        exit;
      end;

      { solo se puede sumar una sola vez el horario }
      if j = 1 then
        horasDocencia := horasDocencia + horas;

      Query2.Next;
    end;
  end;

  Result.vInteger := horasDocencia;
end;

function TMatematicas.updateusuario(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _usuario: Tusuario;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateUsuario');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptusuario(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _usuario: Tusuario;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptUsuario');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelusuario(const idClave: string; const token: string)
  : TJSONObject;
var
  _usuario: Tusuario;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelUsuario');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

{ CRUD: concurrenciaes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.concurrencia(idClave: string): TJSONObject;
var
  _concurrencia: Tconcurrencia;
begin
  try
    _concurrencia := Tconcurrencia.create;
    _concurrencia.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _concurrencia.getAll
    else if idClave = 'model' then
      Result := _concurrencia.model
    else
      Result := _concurrencia.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.toString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-concurrencia');
  end;
end;

function TMatematicas.updateconcurrencia(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _concurrencia: Tconcurrencia;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.post(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'post')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateConcurrencia');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.updateenviarCorreo(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  try
    Json := TJSONObject.create;
    if token = FDataSnapMatematicas.obtenerToken then
    begin
      Data.Subject := datos.GetValue('asunto').Value;
      Data.Body.Clear;
      Data.Body.Add(datos.GetValue('mensaje').Value);
      Data.Recipients.EMailAddresses := datos.GetValue('correo').Value;

      try
        SMTP.Connect;
        SMTP.Send(Data);
      finally
        SMTP.Disconnect;
        Json.AddPair('respuesta', 'El correo fue enviado');
      end;
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;
  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-updateenviarCorreo');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.updateinscribirTaller(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  idResumen: string;
  idParticipante: string;
  capacidad: integer;
begin
  try
    Json := TJSONObject.create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      idResumen := datos.Get('idResumen').JsonValue.Value;
      idParticipante := datos.Get('idParticipante').JsonValue.Value;

      { Determinar si ya esta inscrito en algun taller }
      Query.Close;
      Query.SQL.Text :=
        'SELECT  * FROM math_resumen_participante WHERE id_participante=' +
        chr(39) + idParticipante + chr(39);
      Query.Open;

      if Query.RecordCount >= 1 then
      begin
        Json.AddPair('respuesta',
          'Lo sentimos ya esta inscrito en éste o en otro taller');
      end
      else
      begin
        { Determinar la capacidad del taller }
        Query.Close;
        Query.SQL.Text := 'SELECT * FROM math_resumen WHERE id_resumen=' +
          chr(39) + idResumen + chr(39);
        Query.Open;

        capacidad := Query.FieldByName('capacidad').AsInteger;

        { Determinar cuántos inscritos hay }
        Query.Close;
        Query.SQL.Text :=
          'SELECT  * FROM math_resumen_participante WHERE id_resumen=' + chr(39)
          + idResumen + chr(39);
        Query.Open;

        if Query.RecordCount < capacidad then
        begin

          Query.Close;
          Query.SQL.Text := 'INSERT INTO math_resumen_participante ' +
            '(id_participante, id_resumen)' +
            ' VALUES (:id_participante, :id_resumen )';

          Query.Params.ParamByName('id_resumen').Value := idResumen;
          Query.Params.ParamByName('id_participante').Value := idParticipante;

          Query.ExecSQL;

          Json.AddPair('respuesta',
            'El proceso de inscripción a éste taller fue exitoso');
        end
        else
        begin
          Json.AddPair('respuesta', 'Lo sentimos ya no hay cupos disponibles');
        end;
      end;
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recargue la página');
    end;

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptconcurrencia(const token: string;
  const datos: TJSONObject): TJSONObject;
var
  _concurrencia: Tconcurrencia;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.put(datos);
      terminarConexion;

      escribirMensaje(Json.toString, 'put')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-acceptConcurrencia');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.cancelconcurrencia(const idClave: string;
  const token: string): TJSONObject;
var
  _concurrencia: Tconcurrencia;
  Json: TJSONObject;
begin
  Json := TJSONObject.create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.DELETE(idClave);
      terminarConexion;

      escribirMensaje(Json.toString, 'delete')
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recarge el navegador pulsando la tecla F5');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-cancelConcurrencia');
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.updateobtenerCertificados(const datos: TJSONObject)
  : TJSONObject;
var
  Json, JsonTemp: TJSONObject;
  ListaCertificados: TJSONArray;
  i: integer;
  nombre: string;
  cedula: string;
  fecha: string;
  tipo: string;
  titulo: string;
begin
  try
    Json := TJSONObject.create;
    ListaCertificados := TJSONArray.create;
    Json.AddPair('certificados', ListaCertificados);

    cedula := datos.Get('cedula').JsonValue.Value;
    fecha := datos.Get('fecha').JsonValue.Value;
    nombre := datos.Get('nombre').JsonValue.Value;

    FCertificados.iniciarDocumento(cedula);

    { Buscar en los participantes }
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_participante_emem WHERE cedula=' +
      chr(39) + cedula + chr(39);
    Query.Open;

    if Query.RecordCount > 0 then
    begin
      FCertificados.agregarCertificado(nombre, cedula, '', 'Participante');
    end;

    { Buscar en los autores de resumen con resumen aceptado }
    Query.Close;
    Query.SQL.Text := 'select * from math_resumenes_autor inner join ' +
      'math_autor_resumen on math_resumenes_autor.cedula = math_autor_resumen.cedula'
      + ' inner join math_resumen on math_resumen.id_resumen = ' +
      'math_resumenes_autor.id_resumen WHERE math_resumen.evaluado=' + chr(39) +
      'Aceptado' + chr(39) + ' AND math_autor_resumen.cedula = ' + chr(39) +
      cedula + chr(39) + ' AND math_resumen.fecha=' + chr(39) + fecha + chr(39);
    Query.Open;
    Query.First;

    for i := 1 to Query.RecordCount do
    begin
      tipo := Query.FieldByName('tipo').AsString;
      titulo := Query.FieldByName('titulo').AsString;
      FCertificados.agregarCertificado(nombre, cedula, titulo, tipo);

      Query.Next;
    end;

    FCertificados.finalizarDocumento;

    Json.AddPair('descarga',
      FDataSnapMatematicas.obtenerRutaDescargaCertificados + '/' + cedula
      + '.pdf');

  except
    on E: Exception do
    begin
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.obtenerConexion(clave: string): TJSONObject;
var
  i: integer;
  Json: TJSONObject;
begin
  try
    Json := TJSONObject.create;

    if clave = '51258908' then
    begin
      for i := 1 to Conexion.Params.Count do
      begin
        Json.AddPair('Parametro' + IntToStr(i), Conexion.Params[i - 1])
      end;
    end
    else
    begin
      Json.AddPair('respuesta', 'sin permisos para obtener datos');
    end;
  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

function TMatematicas.obtenerDocenteServicio(idservicio,
  Periodo: string): string;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM siap_agendas_servicios as a');
  Query.SQL.Add('INNER JOIN siap_servicios_programas as s ');
  Query.SQL.Add('ON a.idservicioprograma = s.idservicioprograma ');
  Query.SQL.Add('INNER JOIN siap_docentes as d ');
  Query.SQL.Add('ON a.iddocente = d.iddocente ');
  Query.SQL.Add('WHERE a.periodo=' + Texto(Periodo) +
    ' AND s.idservicioprograma=' + Texto(idservicio));

  FDataSnapMatematicas.escribirSQL(Query.SQL.Text);
  Query.Open;

  if Query.RecordCount >= 1 then
    Result := 'Tomado por ' + Query.FieldByName('nombre').AsString
  else
    Result := '';
end;

function TMatematicas.obtenerHorasCatedra: integer;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := 'SELECT * FROM siap_configuraciones';
  Query.Open;

  Result := Query.FieldByName('horascatedra').AsInteger;
end;

function TMatematicas.obtenerHorasContrato: integer;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := 'SELECT * FROM siap_configuraciones';
  Query.Open;

  Result := Query.FieldByName('horascontrato').AsInteger;
end;

function TMatematicas.obtenerHorasDocencia(idDocente: string): integer;
begin
  Query.SQL.Add('SELECT * FROM siap_docentes as d ');
  Query.SQL.Add('INNER JOIN siap_tipo_contrato as t ');
  Query.SQL.Add('ON d.idtipocontrato = t.idtipocontrato ');
  Query.SQL.Add('WHERE iddocente=' + Texto(idDocente));
  Query.Open;

  Result := Query.FieldByName('horas').AsInteger;
end;

function TMatematicas.obtenerListasTalleres: TJSONObject;
var
  Json: TJSONObject;
  i: integer;
  idResumen: string;
  j: integer;
begin
  Json := TJSONObject.create;

  try
    Query2.Close;
    Query2.SQL.Text := 'SELECT * FROM math_resumen WHERE tipo = ' + chr(39) +
      'Taller' + chr(39) + ' AND evaluado = ' + chr(39) + 'Aceptado' + chr(39);
    Query2.Open;
    Query2.First;

    FResumenes.limpiarDocumento2;
    FResumenes.IdAutor := 'ListasTalleres';
    FResumenes.iniciarDocumentoExcel;

    for i := 1 to Query2.RecordCount do
    begin
      idResumen := Query2.FieldByName('id_resumen').AsString;

      Query.Close;
      Query.SQL.Text := 'select * from math_resumen_participante inner join ' +
        'math_resumen on math_resumen_participante.id_resumen = math_resumen.id_resumen'
        + ' inner join math_participante_emem on math_resumen_participante.id_participante'
        + ' = math_participante_emem.cedula WHERE math_resumen_participante.id_resumen = '
        + chr(39) + idResumen + chr(39) +
        'ORDER BY math_participante_emem.nombre';
      Query.Open;
      Query.First;

      FResumenes.agregarLinea('\section{TALLER ' + IntToStr(i) + ': ' +
        Query2.FieldByName('titulo').AsString + '}');

      Query3.Close;
      Query3.SQL.Text := 'SELECT * FROM math_resumenes_autor INNER JOIN ' +
        'math_autor_resumen ON math_resumenes_autor.cedula = math_autor_resumen.cedula '
        + 'WHERE id_resumen=' + chr(39) + idResumen + chr(39);
      Query3.Open;

      FResumenes.agregarLinea('\subsection{Talleristas}');
      FResumenes.agregarLinea
        ('\begin{longtable}[c]{|>{\raggedright}m{1cm}|>{\raggedright}m{3cm}|>{\raggedright}m{5cm}|>{\raggedright}m{7cm}|}');
      FResumenes.agregarLinea('\hline');
      FResumenes.agregarLinea
        ('\textbf{No} & \textbf{Cédula} & \textbf{Nombre } & \textbf{Firma}\tabularnewline');
      FResumenes.agregarLinea('\hline ');

      for j := 1 to Query3.RecordCount do
      begin
        FResumenes.agregarLinea(IntToStr(j) + '\\ & ' +
          Query3.FieldByName('cedula').AsString + ' & ' +
          Query3.FieldByName('nombre').AsString + ' & \tabularnewline');
        FResumenes.agregarLinea('\hline');
        Query3.Next;
      end;

      FResumenes.agregarLinea('\end{longtable}');

      FResumenes.agregarLinea('\subsection{Participantes}');
      FResumenes.agregarLinea
        ('\begin{longtable}[c]{|>{\raggedright}m{1cm}|>{\raggedright}m{3cm}|>{\raggedright}m{5cm}|>{\raggedright}m{7cm}|}');
      FResumenes.agregarLinea('\hline');
      FResumenes.agregarLinea
        ('\textbf{No} & \textbf{Cédula} & \textbf{Nombre } & \textbf{Firma}\tabularnewline');
      FResumenes.agregarLinea('\hline ');

      FResumenes.agregarParticipante('Taller ' + IntToStr(i),
        Query2.FieldByName('titulo').AsString);

      for j := 1 to Query.RecordCount do
      begin
        FResumenes.agregarLinea(IntToStr(j) + '\\ & ' +
          Query.FieldByName('cedula').AsString + ' & ' +
          Query.FieldByName('nombre').AsString + ' & \tabularnewline');
        FResumenes.agregarLinea('\hline');
        FResumenes.agregarParticipante(Query.FieldByName('cedula').AsString,
          Query.FieldByName('nombre').AsString);
        Query.Next;
      end;

      FResumenes.agregarLinea('\end{longtable}');
      FResumenes.agregarLinea('\newpage{}');

      Query2.Next;
    end;
    FResumenes.terminarDocumento2;
    FResumenes.exportarListas;
    FResumenes.exportarExcel;

    Json.AddPair('rutaPdf',
      'http://201.185.240.142/matematicas/descargas/listas/ListasTalleres.pdf');
    Json.AddPair('rutaCsv',
      'http://201.185.240.142/matematicas/descargas/listas/ListasTalleres.csv');

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.obtenerSemanasSemestre: integer;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := 'SELECT * FROM siap_configuraciones';
  Query.Open;

  Result := Query.FieldByName('semanassemestre').AsInteger;
end;

function TMatematicas.obtenerTallerParticipante(const cedula: string)
  : TJSONObject;
var
  Json: TJSONObject;
  idResumen: string;
  tituloResumen: string;
  salon: string;
  linea: string;
  nombre: string;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text :=
      'SELECT * FROM math_resumen_participante WHERE id_participante=' + chr(39)
      + cedula + chr(39);
    Query.Open;
    idResumen := Query.FieldByName('id_resumen').AsString;

    if Query.RecordCount > 0 then
    begin
      Json.AddPair('inscrito', 'si');

      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_resumen WHERE id_resumen=' + chr(39)
        + idResumen + chr(39);
      Query.Open;

      tituloResumen := Query.FieldByName('titulo').AsString;
      salon := Query.FieldByName('salon').AsString;
      linea := Query.FieldByName('linea').AsString;

      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_participante_emem WHERE cedula=' +
        chr(39) + cedula + chr(39);
      Query.Open;

      nombre := Query.FieldByName('nombre').AsString;

      Json.AddPair('respuesta', 'El participante ' + nombre +
        ' identificado con documento ' + cedula +
        ', se encuentra inscrito en el taller: "' + tituloResumen +
        '" en la línea de: "' + linea + '", que se realizará en: ' + salon);
    end
    else
    begin
      Json.AddPair('inscrito', 'no');
    end;

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.obtenerTipoContratoDocente(idDocente: string): string;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM siap_docentes';
end;

function TMatematicas.updatetoken(const datos: TJSONObject): TJSONObject;
var
  i, n, j: integer;
  nombre, correo, clave: string;
  token: string;
begin
  try
    nombre := datos.GetValue('nombre').Value;
    correo := datos.GetValue('correo').Value;
    clave := datos.GetValue('clave').Value;

    if (nombre = 'jprincon') and (correo = 'jarincon@uniquindio.edu.co') and
      (clave = 'Donmatematicas#512519') then
    begin
      token := FDataSnapMatematicas.obtenerToken;
    end
    else
    begin
      token := 'Acceso denegado, por favor recarge el navegador pulsando la tecla F5';
    end;

    Result := TJSONObject.create;
    Result.AddPair('token', token);
  except
    on E: Exception do
      Result.AddPair('error', E.Message + ', token');
  end;
end;

procedure TMatematicas.DataModuleCreate(Sender: tobject);
var
  datosToken: TJSONObject;
begin
  // DireccionLibreria.VendorHome := ExtractFilePath(ParamStr(0)) + 'librerias';

  { with Conexion.Params do
    begin
    Clear;
    Add('Database=saem');
    Add('User_Name=postgres');
    Add('DriverID=PG');
    Add('Password=postgres');
    Add('Server=' + FDataSnapMatematicas.edServidor.Text);
    Add('Port=5432');
    Add('CharaterSet=UTF8');
    end; }

  FParametros := TStringList.create;
  FTipoParametro := TStringList.create;

  FHoras := TStringList.create;
  FHoras.Add('7:00 a.m.');
  FHoras.Add('8:00 a.m.');
  FHoras.Add('9:00 a.m.');
  FHoras.Add('10:00 a.m.');
  FHoras.Add('11:00 a.m.');
  FHoras.Add('12:00 p.m.');
  FHoras.Add('1:00 p.m.');
  FHoras.Add('2:00 p.m.');
  FHoras.Add('3:00 p.m.');
  FHoras.Add('4:00 p.m.');
  FHoras.Add('5:00 p.m.');
  FHoras.Add('6:00 p.m.');
  FHoras.Add('7:00 p.m.');
  FHoras.Add('8:00 p.m.');
  FHoras.Add('9:00 p.m.');
  FHoras.Add('10:00 p.m.');

  FDias := TStringList.create;
  FDias.Add('lunes');
  FDias.Add('martes');
  FDias.Add('miércoles');
  FDias.Add('jueves');
  FDias.Add('viernes');
  FDias.Add('sábado');
  FDias.Add('domingo');

  AccesoDenegado := 'Acceso Denegado, por favor refresque el navegador';
end;

function TMatematicas.descargarCertificadosUnificados(fecha: string)
  : TJSONObject;
var
  Json, JsonTemp: TJSONObject;
  ListaCertificados: TJSONArray;
  ListaCedulas: TStringList;
  i: integer;
  nombre, cedula: string;
  tipo: string;
  titulo: string;
  j: integer;
begin
  try
    Json := TJSONObject.create;
    ListaCertificados := TJSONArray.create;
    Json.AddPair('certificados', ListaCertificados);

    FCertificados.iniciarDocumento('Certificados_EMEM' + fecha);

    Query2.Close;
    Query2.SQL.Text := 'SELECT * FROM math_resumenes_autor';
    Query2.Open;
    Query2.First;

    ListaCedulas := TStringList.create;

    for j := 1 to Query2.RecordCount do
    begin
      cedula := Query2.FieldByName('cedula').AsString;

      if ListaCedulas.IndexOf(cedula) < 0 then
      begin
        { Buscar en los participantes }
        Query.Close;
        Query.SQL.Text := 'SELECT * FROM math_participante_emem WHERE cedula=' +
          chr(39) + cedula + chr(39);
        Query.Open;

        nombre := transformarNombre(Query.FieldByName('nombre').AsString);

        if Query.RecordCount > 0 then
        begin
          FCertificados.agregarCertificado(nombre, cedula, '', 'Participante');
        end;

        { Buscar en los autores de resumen con resumen aceptado }
        Query.Close;
        Query.SQL.Text := 'select * from math_resumenes_autor inner join ' +
          'math_autor_resumen on math_resumenes_autor.cedula = math_autor_resumen.cedula'
          + ' inner join math_resumen on math_resumen.id_resumen = ' +
          'math_resumenes_autor.id_resumen WHERE math_resumen.evaluado=' +
          chr(39) + 'Aceptado' + chr(39) + ' AND math_autor_resumen.cedula = ' +
          chr(39) + cedula + chr(39) + ' AND math_resumen.fecha=' + chr(39) +
          fecha + chr(39);
        Query.Open;
        Query.First;

        nombre := transformarNombre(Query.FieldByName('nombre').AsString);

        for i := 1 to Query.RecordCount do
        begin
          tipo := Query.FieldByName('tipo').AsString;
          titulo := Query.FieldByName('titulo').AsString;
          FCertificados.agregarCertificado(nombre, cedula, titulo, tipo);
          Json.AddPair('cert ' + IntToStr(i) + '-' + IntToStr(j),
            cedula + '=' + nombre);

          Query.Next;
        end;

        ListaCedulas.Add(cedula);
      end;

      Query2.Next;
    end;

    FCertificados.finalizarDocumento;

    Json.AddPair('descarga',
      FDataSnapMatematicas.obtenerRutaDescargaCertificados + '/' +
      'Certificados_EMEM' + fecha + '.pdf');

  except
    on E: Exception do
    begin
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.descargarResumenEmem(clave: string): TJSONObject;
var
  Json: TJSONObject;
  idResumen: string;
  i: integer;
  ssAutores: TStringList;
  nombre, palabra, palabrasClave, correo, institucion, autores, resumen: string;
begin
  try
    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE id_resumen=' + chr(39) +
      clave + chr(39);
    Query.Open;

    Json := TJSONObject.create;

    if Query.RecordCount > 0 then
    begin
      idResumen := Query.FieldByName('id_resumen').AsString;
      FResumenes.IdAutor := idResumen;

      FResumenes.limpiarDocumento;
      FResumenes.agregarTitulo(Query.FieldByName('titulo').AsString);

      Query2.Close;
      Query2.SQL.Text :=
        'SELECT * FROM math_resumenes_autor INNER JOIN math_autor_resumen' +
        ' ON math_resumenes_autor.cedula = math_autor_resumen.cedula WHERE' +
        ' id_resumen=' + chr(39) + idResumen + chr(39) +
        ' ORDER BY id_resumen_autor';
      Query2.Open;
      Query2.First;

      autores := '';
      for i := 1 to Query2.RecordCount do
      begin
        nombre := Query2.FieldByName('nombre').AsString;
        correo := Query2.FieldByName('correo').AsString;
        institucion := Query2.FieldByName('institucion').AsString;

        autores := autores + nombre + '\thanks{' + institucion + ', ' +
          correo + '}  ';
        if i < Query2.RecordCount then
          if i = 2 then
            autores := autores + ' \\ '
          else
            autores := autores + ', ';

        Query2.Next;
      end;

      FResumenes.agregarAutores(autores);
      FResumenes.agregarFecha('Noviembre del 2019');

      FResumenes.agregarEstilo;

      Query3.Close;
      Query3.SQL.Text := 'SELECT * FROM math_palabras_clave WHERE id_resumen=' +
        chr(39) + clave + chr(39);
      Query3.Open;
      Query3.First;

      palabrasClave := '';
      for i := 1 to Query3.RecordCount do
      begin
        palabra := Query3.FieldByName('palabra').AsString;

        palabrasClave := palabrasClave + palabra;

        if i < Query3.RecordCount then
          palabrasClave := palabrasClave + ', ';

        Query3.Next;
      end;

      FResumenes.agregarPalabrasClave(palabrasClave);

      resumen := Query.FieldByName('resumen').AsString;
      resumen := StringReplace(resumen, '&', 'y', [rfReplaceAll, rfIgnoreCase]);
      FResumenes.agregarResumen(resumen);

      FResumenes.iniciarBibligrafia;

      Query3.Close;
      Query3.SQL.Text :=
        'SELECT * FROM math_bibliografia_resumen WHERE id_resumen=' + chr(39) +
        clave + chr(39) + ' ORDER BY bibliografia';
      Query3.Open;
      Query3.First;

      for i := 1 to Query3.RecordCount do
      begin
        FResumenes.agregarReferencia(Query3.FieldByName('bibliografia')
          .AsString);
        Query3.Next;
      end;

      FResumenes.terminarDocumento;
      FResumenes.exportarDocumento;

      Json.AddPair('ruta',
        'http://201.185.240.142/matematicas/descargas/resumenes-emem/' +
        idResumen + '.pdf');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 'error-descargarResumenEmem');
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

{ CONEXION DE LA APLICACION }
procedure TMatematicas.iniciarConexion;
begin
  Conexion.Connected := True;
end;

function TMatematicas.listaPosters: TJSONObject;
var
  Json, JsonTemp, JsonAutores: TJSONObject;
  listaAutores, listaPoster: TJSONArray;
  i: integer;
  titulo, linea, nombre, cedula, idResumen: string;
  j: integer;
begin
  try
    Json := TJSONObject.create;
    listaPoster := TJSONArray.create;
    Json.AddPair('Poster', listaPoster);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE tipo=' + chr(39) +
      'Poster' + chr(39) + ' ORDER BY linea';
    Query.Open;

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.create;
      listaAutores := TJSONArray.create;
      JsonTemp.AddPair('autores', listaAutores);

      titulo := Query.FieldByName('titulo').AsString;
      linea := Query.FieldByName('linea').AsString;
      idResumen := Query.FieldByName('id_resumen').AsString;

      JsonTemp.AddPair('titulo', titulo);
      JsonTemp.AddPair('linea', linea);

      { Buscar a los autores de cada resumen }
      Query2.Close;
      Query2.SQL.Text :=
        'SELECT * FROM math_resumenes_autor INNER JOIN math_autor_resumen ON math_resumenes_autor.cedula = math_autor_resumen.cedula WHERE id_resumen='
        + chr(39) + idResumen + chr(39);
      Query2.Open;

      for j := 1 to Query2.RecordCount do
      begin
        JsonAutores := TJSONObject.create;
        nombre := Query2.FieldByName('nombre').AsString;
        cedula := Query2.FieldByName('cedula').AsString;
        JsonAutores.AddPair('nombre', nombre);
        JsonAutores.AddPair('cedula', cedula);
        listaAutores.AddElement(JsonAutores);

        Query2.Next;
      end;

      listaPoster.Add(JsonTemp);
      Query.Next;
    end;
  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

procedure TMatematicas.terminarConexion;
begin
  Conexion.Connected := False;
end;

function TMatematicas.transformarNombre(sNombre: string): string;
begin
  Result := UpperCase(sNombre);
  Result := StringReplace(Result, 'á', 'Á', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', 'É', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', 'Í', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', 'Ó', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', 'Ú', [rfReplaceAll]);

  Result := StringReplace(Result, 'ñ', 'Ñ', [rfReplaceAll]);
end;

{ ESCRIBIR MENSAJES EN CONSOLA }
procedure TMatematicas.enviarError(hora, fecha, procedimiento, mensaje: string);
var
  datos: TJSONObject;
begin
  datos := TJSONObject.create;

  datos.AddPair('iderror', generarID);
  datos.AddPair('hora', hora);
  datos.AddPair('fecha', fecha);
  datos.AddPair('procedimiento', procedimiento);
  datos.AddPair('mensaje', mensaje);

  updateError(FDataSnapMatematicas.obtenerToken, datos);
end;

procedure TMatematicas.escribirMensaje(msg: string; tipo: string);
begin
  FDataSnapMatematicas.escribirMensaje(msg, tipo);
end;

function TMatematicas.estadisticasTaller(const idResumen: string): TJSONObject;
var
  Json: TJSONObject;
  capacidad: integer;
  inscritos: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE id_resumen=' + chr(39) +
      idResumen + chr(39);
    Query.Open;

    capacidad := Query.FieldByName('capacidad').AsInteger;

    { Determinar cuántos inscritos hay }
    Query.Close;
    Query.SQL.Text :=
      'SELECT  * FROM math_resumen_participante WHERE id_resumen=' + chr(39) +
      idResumen + chr(39);
    Query.Open;

    inscritos := Query.RecordCount;

    Json.AddPair('capacidad', IntToStr(capacidad));
    Json.AddPair('inscritos', IntToStr(inscritos));
    Json.AddPair('cupo', IntToStr(capacidad - inscritos));

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

{ OPERACIONES BÁSICAS DEL SERVIDOR }
function TMatematicas.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TMatematicas.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TMatematicas.cancelsalirDelTaller(const cedula: string;
  const token: string): TJSONObject;
var
  Json: TJSONObject;
begin
  try
    if token = FDataSnapMatematicas.obtenerToken then
    begin
      Json := TJSONObject.create;

      Query.Close;
      Query.SQL.Text :=
        'DELETE FROM math_resumen_participante WHERE id_participante=' + chr(39)
        + cedula + chr(39);
      Query.ExecSQL;

      Json.AddPair('respuesta', 'La inscripción se eliminto correctamente');
    end
    else
    begin
      Json.AddPair('respuesta',
        'Acceso denegado, por favor recargue el navegador');
    end;

  except
    on E: Exception do
    begin
      Json.AddPair('error', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.JsonRespuesta: string;
begin
  Result := 'Respuesta';
end;

function TMatematicas.JsonError: string;
begin
  Result := 'Error';
end;

procedure TMatematicas.limpiarConsulta(Query: TFDQuery);
begin
  Query.Close;
  Query.SQL.Clear;
end;

procedure TMatematicas.SELECT(nombreTabla, OrdenarPor: string; Query: TFDQuery);
begin
  Query.SQL.Text := 'SELECT * FROM ' + nombreTabla + ' ORDER BY ' + OrdenarPor;
  Query.Open;
  Query.First;
end;

procedure TMatematicas.SelectWhere(nombreTabla, Identificador, ID: string;
  Query: TFDQuery);
begin
  Query.SQL.Text := 'SELECT * FROM ' + nombreTabla + ' WHERE ' + Identificador
    + '=' + ID;
  Query.Open;
end;

procedure TMatematicas.SelectWhereOrder(nombreTabla, Identificador, OrdenarPor,
  ID: string; Query: TFDQuery);
begin
  Query.SQL.Text := 'SELECT * FROM ' + nombreTabla + ' WHERE ' + Identificador +
    '=' + ID + ' ORDER BY ' + OrdenarPor;
  Query.Open;
end;

procedure TMatematicas.InnerJoin(Tabla1, Tabla2, Parametro, IdBusqueda,
  Valor: string; Query: TFDQuery);
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ' + Tabla1 + ' INNER JOIN ' + Tabla2 + ' ON '
    + Tabla1 + '.' + Parametro + ' = ' + Tabla2 + '.' + Parametro + ' WHERE ' +
    Tabla2 + '.' + IdBusqueda + '=' + Valor;
  escribirMensaje('InnerJoin', Query.SQL.Text);
  Query.Open;
end;

procedure TMatematicas.InnerJoin3(Tabla1, Tabla2, Tabla3, Parametro1,
  Parametro2, IdBusqueda, Valor: string; Query: TFDQuery);
begin
  Query.Close;
  Query.SQL.Text := 'SELECT * FROM ' + Tabla1 + ' INNER JOIN ' + Tabla2 + ' ON '
    + Tabla1 + '.' + Parametro1 + ' = ' + Tabla2 + '.' + Parametro1 +
    ' inner join ' + Tabla3 + ' on ' + Tabla1 + '.' + Parametro2 + ' = ' +
    Tabla3 + '.' + Parametro2 + ' WHERE ' + Tabla2 + '.' + IdBusqueda +
    '=' + Valor;
  Query.Open;
end;

procedure TMatematicas.INSERT(nombreTabla: string; Query: TFDQuery);
var
  i: integer;
  consulta: string;
begin
  consulta := 'INSERT INTO ' + nombreTabla + '(';

  for i := 1 to FParametros.Count do
  begin
    consulta := consulta + FParametros[i - 1];
    if i < FParametros.Count then
      consulta := consulta + ',';
  end;

  consulta := consulta + ') VALUES (';

  for i := 1 to FParametros.Count do
  begin
    consulta := consulta + ':' + FParametros[i - 1];
    if i < FParametros.Count then
      consulta := consulta + ',';
  end;

  consulta := consulta + ')';

  Query.SQL.Text := consulta;
end;

procedure TMatematicas.DELETE(nombreTabla, Identificador, ID: string;
  Query: TFDQuery);
begin
  Query.SQL.Text := 'DELETE FROM ' + nombreTabla + ' WHERE ' + Identificador
    + '=' + ID;
  Query.ExecSQL;
end;

procedure TMatematicas.UPDATE(nombreTabla, Identificador, ID: string;
  Query: TFDQuery);
var
  consulta: string;
  i: integer;
begin
  consulta := 'UPDATE ' + nombreTabla + ' SET ';

  for i := 1 to FParametros.Count do
  begin
    consulta := consulta + FParametros[i - 1] + '=:' + FParametros[i - 1];
    if i < FParametros.Count then
      consulta := consulta + ', ';
  end;

  consulta := consulta + ' WHERE ' + Identificador + '=' + ID;

  Query.SQL.Text := consulta;
end;

procedure TMatematicas.limpiarParametros;
begin
  FParametros.Clear;
  FTipoParametro.Clear;
end;

procedure TMatematicas.agregarParametro(Param: string; tipo: string);
begin
  FParametros.Add(Param);
  FTipoParametro.Add(tipo)
end;

function TMatematicas.crearJSON(Query: TFDQuery): TJSONObject;
var
  i: integer;
begin
  Result := TJSONObject.create;

  if Query.RecordCount > 0 then
  begin
    for i := 1 to FParametros.Count do
    begin
      Result.AddPair(FParametros[i - 1], Query.FieldByName(FParametros[i - 1])
        .AsString);
    end
  end
  else
  begin
    Result.AddPair(JsonRespuesta, 'Consulta con resultado vacio');
  end;
end;

procedure TMatematicas.asignarDatos(datos: TJSONObject; Query: TFDQuery);
var
  i: integer;
begin
  for i := 1 to FParametros.Count do
  begin
    if FTipoParametro[i - 1] = 'String' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        LowerCase(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Memo' then
      Query.Params.ParamByName(FParametros[i - 1]).AsWideMemo :=
        LowerCase(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Base64' then
      Query.Params.ParamByName(FParametros[i - 1]).AsByteStr :=
        datos.GetValue(FParametros[i - 1]).Value;

    if FTipoParametro[i - 1] = 'Integer' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        StrToInt(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Float' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        StrToFloat(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Date' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        StrToDate(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Time' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        StrToTime(datos.GetValue(FParametros[i - 1]).Value);

    if FTipoParametro[i - 1] = 'Boolean' then
      Query.Params.ParamByName(FParametros[i - 1]).Value :=
        StrToBool(datos.GetValue(FParametros[i - 1]).Value);
  end;
  Query.ExecSQL;
end;

function TMatematicas.Texto(ss: string): string;
begin
  Result := chr(39) + ss + chr(39);
end;

end.
