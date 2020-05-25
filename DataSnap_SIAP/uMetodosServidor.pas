unit uMetodosServidor;

interface

uses System.SysUtils, System.Classes, System.Json,
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
  IdSMTPBase, IdSMTP, uFCertificados;

type
{$METHODINFO ON}
  TMatematicas = class(TDataModule)
    Conexion: TFDConnection;
    Query: TFDQuery;
    DireccionLibreria: TFDPhysPgDriverLink;
    Query2: TFDQuery;
    Query3: TFDQuery;
    SMTP: TIdSMTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    Data: TIdMessage;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure iniciarConexion;
    procedure terminarConexion;

    procedure escribirMensaje(msg: string; tipo: string);

    function transformarNombre(sNombre: string): string;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    { CRUD: concurrencias }
    function concurrencia(idClave: string): TJSONObject;
    function updateconcurrencia(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelconcurrencia(const idClave: string; const token: string)
      : TJSONObject;
    function acceptconcurrencia(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { CRUD: usuarios }
    function usuario(idClave: string): TJSONObject;
    function updateusuario(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelusuario(const idClave: string; const token: string)
      : TJSONObject;
    function acceptusuario(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { CRUD: participantes }
    function participante(idClave: string): TJSONObject;
    function updateparticipante(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelparticipante(const idClave: string; const token: string)
      : TJSONObject;
    function acceptparticipante(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { CRUD: resumenes }
    function resumen(idClave: string): TJSONObject;
    function resumenPorTipo(const tipo: string): TJSONObject;
    function resumenesAutor(idClave: string): TJSONObject;
    function updateresumen(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelresumen(const idClave: string; const token: string)
      : TJSONObject;
    function acceptresumen(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { CRUD: palabraClave }
    function palabraClave(idClave: string): TJSONObject;
    function palabraClaveResumen(idClave: string): TJSONObject;
    function updatepalabraClave(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelpalabraClave(const idClave: string; const token: string)
      : TJSONObject;
    function acceptpalabraClave(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { CRUD: autorResumen }
    function autorResumen(idClave: string): TJSONObject;
    function autoresResumen(idClave: string): TJSONObject;
    function updateautorResumen(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelautorResumen(const cedula: string; const id_resumen: string;
      const token: string): TJSONObject;
    function acceptautorResumen(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function cancelborrarResumen(const id_resumen: string; const token: string)
      : TJSONObject;
    function autorPorCedula(cedula: string): TJSONObject;
    function updateagregarAutorResumen(const token: string;
      const Datos: TJSONObject): TJSONObject;

    { CRUD: referenciaResumen }
    function referenciaResumen(idClave: string): TJSONObject;
    function referenciasResumen(idClave: string): TJSONObject;
    function updatereferenciaResumen(const token: string;
      const Datos: TJSONObject): TJSONObject;
    function cancelreferenciaResumen(const idClave: string; const token: string)
      : TJSONObject;
    function acceptreferenciaResumen(const token: string;
      const Datos: TJSONObject): TJSONObject;

    { CRUD: Talleres del Evento }
    function updateinscribirTaller(const token: string;
      const Datos: TJSONObject): TJSONObject;
    function estadisticasTaller(const idResumen: string): TJSONObject;
    function obtenerTallerParticipante(const cedula: string): TJSONObject;
    function cancelsalirDelTaller(const cedula: string; const token: string)
      : TJSONObject;

    { CRUD: Exportaciones de Archivos }
    function updateobtenerCertificados(const Datos: TJSONObject): TJSONObject;
    function obtenerListasTalleres: TJSONObject;
    function listaPosters: TJSONObject;

    { CRUD: Comunicación con el usuario }
    function updateenviarCorreo(const token: string; const Datos: TJSONObject)
      : TJSONObject;

    { Configuraciones }
    function permiteCrearResumenes: TJSONObject;
    function permiteInscribirseTalleres: TJSONObject;

    function obtenerConexion(clave: string): TJSONObject;
    function updatetoken(const Datos: TJSONObject): TJSONObject;
    function descargarResumenEmem(clave: string): TJSONObject;
    function descargarCertificadosUnificados(fecha: string): TJSONObject;

  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

{ CRUD: referenciaResumen %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.referenciaResumen(idClave: string): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
begin
  try
    _referenciaResumen := TreferenciaResumen.Create;
    _referenciaResumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _referenciaResumen.getAll
    else if idClave = 'model' then
      Result := _referenciaResumen.model
    else
      Result := _referenciaResumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

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
    _referenciaResumen := TreferenciaResumen.Create;
    _referenciaResumen.Conexion := Conexion;

    iniciarConexion;

    Result := _referenciaResumen.getReferenciasResumenes(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-referenciasResumen');
  end;
end;

function TMatematicas.updatereferenciaResumen(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.Create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post');
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
  const Datos: TJSONObject): TJSONObject;
var
  _referenciaResumen: TreferenciaResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.Create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put');
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _referenciaResumen := TreferenciaResumen.Create;
      _referenciaResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _referenciaResumen.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete');
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

    Json := TJSONObject.Create;
    ArregloJSON := TJSONArray.Create;
    Json.AddPair('autores', ArregloJSON);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumenes_autor WHERE id_resumen=' +
      chr(39) + idClave + chr(39) + ' ORDER BY id_resumen_autor';
    Query.Open;
    Query.First;

    for i := 1 to Query.RecordCount do
    begin
      JsonFor := TJSONObject.Create;

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

    escribirMensaje(Json.ToString, 'get');

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

    Json := TJSONObject.Create;

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
    _autorResumen := TautorResumen.Create;
    _autorResumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _autorResumen.getAll
    else if idClave = 'model' then
      Result := _autorResumen.model
    else
      Result := _autorResumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-autorResumen');
  end;
end;

function TMatematicas.updateagregarAutorResumen(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin

      iniciarConexion;

      Query.Close;
      Query.SQL.Text := 'SELECT * FROM math_autor_resumen WHERE cedula=' +
        chr(39) + Datos.GetValue('cedula').Value + chr(39);
      Query.Open;

      if Query.RecordCount > 0 then
      begin
        Query.Close;
        Query.SQL.Text :=
          'INSERT INTO math_resumenes_autor (cedula, id_resumen)' +
          ' VALUES (:cedula, :id_resumen)';
        Query.Params.ParamByName('cedula').Value :=
          Datos.GetValue('cedula').Value;
        Query.Params.ParamByName('id_resumen').Value :=
          Datos.GetValue('id_resumen').Value;
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
          Datos.GetValue('cedula').Value;
        Query.Params.ParamByName('nombre').Value :=
          Datos.GetValue('nombre').Value;
        Query.Params.ParamByName('correo').Value :=
          Datos.GetValue('correo').Value;
        Query.Params.ParamByName('institucion').Value :=
          Datos.GetValue('institucion').Value;
        Query.ExecSQL;

        Query.Close;
        Query.SQL.Text :=
          'INSERT INTO math_resumenes_autor (cedula, id_resumen)' +
          ' VALUES (:cedula, :id_resumen)';
        Query.Params.ParamByName('cedula').Value :=
          Datos.GetValue('cedula').Value;
        Query.Params.ParamByName('id_resumen').Value :=
          Datos.GetValue('id_resumen').Value;
        Query.ExecSQL;

        Json.AddPair('resultado', 'El autor se creo correctamente');
      end;

      terminarConexion;

      escribirMensaje(Json.ToString, 'post');
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
  const Datos: TJSONObject): TJSONObject;
var
  _autorResumen: TautorResumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _autorResumen := TautorResumen.Create;
      _autorResumen.Conexion := Conexion;

      iniciarConexion;
      Json := _autorResumen.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post');
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
  const Datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      iniciarConexion;
      escribirMensaje('linea 0', '0');
      Query.Close;
      Query.SQL.Text := 'UPDATE math_autor_resumen SET nombre=:nombre' +
        ', correo=:correo, institucion=:institucion WHERE cedula=' + chr(39) +
        Datos.GetValue('cedula').Value + chr(39);

      escribirMensaje('primera linea', '0');
      Query.Params.ParamByName('nombre').Value :=
        Datos.GetValue('nombre').Value;
      Query.Params.ParamByName('correo').Value :=
        Datos.GetValue('correo').Value;
      Query.Params.ParamByName('institucion').Value :=
        Datos.GetValue('institucion').Value;
      escribirMensaje('segunda linea', '0');
      Query.ExecSQL;

      Json.AddPair('resultado', 'autor actualizado correctamete');
      escribirMensaje('tercera linea', '0');
      terminarConexion;

      escribirMensaje(Json.ToString, 'put');
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
  Json := TJSONObject.Create;

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

      escribirMensaje(Json.ToString, 'delete');
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
    Json := TJSONObject.Create;

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
    _palabraClave := TpalabraClave.Create;
    _palabraClave.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _palabraClave.getAll
    else if idClave = 'model' then
      Result := _palabraClave.model
    else
      Result := _palabraClave.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

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
    _palabraClave := TpalabraClave.Create;
    _palabraClave.Conexion := Conexion;

    iniciarConexion;

    Result := _palabraClave.getPalabrasResumenes(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-palabraClaveResumen');
  end;
end;

function TMatematicas.updatepalabraClave(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  _palabraClave: TpalabraClave;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.Create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post');
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
  const Datos: TJSONObject): TJSONObject;
var
  _palabraClave: TpalabraClave;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.Create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put');
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _palabraClave := TpalabraClave.Create;
      _palabraClave.Conexion := Conexion;

      iniciarConexion;
      Json := _palabraClave.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete');
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
    _resumen := Tresumen.Create;
    _resumen.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _resumen.getAll
    else if idClave = 'model' then
      Result := _resumen.model
    else
      Result := _resumen.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

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
    _resumen := Tresumen.Create;
    _resumen.Conexion := Conexion;

    iniciarConexion;

    Result := _resumen.getForAutor(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'get');

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
    Json := TJSONObject.Create;
    ArregloJSON := TJSONArray.Create;
    Json.AddPair('resumenes', ArregloJSON);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE tipo=' + chr(39) + tipo
      + chr(39) + ' ORDER BY capacidad';
    Query.Open;
    Query.First;

    escribirMensaje('datos', IntToStr(Query.RecordCount));

    for i := 1 to Query.RecordCount do
    begin
      JsonFor := TJSONObject.Create;
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
  const Datos: TJSONObject): TJSONObject;
var
  _resumen: Tresumen;
  Json: TJSONObject;
begin

  Json := TJSONObject.Create;
  try
    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.Create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post');
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
  const Datos: TJSONObject): TJSONObject;
var
  _resumen: Tresumen;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.Create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put')
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _resumen := Tresumen.Create;
      _resumen.Conexion := Conexion;

      iniciarConexion;
      Json := _resumen.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete')
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
    _participante := Tparticipante.Create;
    _participante.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _participante.getAll
    else if idClave = 'model' then
      Result := _participante.model
    else
      Result := _participante.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-participante');
  end;
end;

function TMatematicas.permiteCrearResumenes: TJSONObject;
var
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
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
  Json := TJSONObject.Create;
  if FDataSnapMatematicas.permiteInscribirTalleres then
    Json.AddPair('permite', 'si')
  else
    Json.AddPair('permite', 'no');

  Result := Json;
end;

function TMatematicas.updateparticipante(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  _participante: Tparticipante;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.Create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.post(Datos);
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
  const Datos: TJSONObject): TJSONObject;
var
  _participante: Tparticipante;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.Create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put')
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _participante := Tparticipante.Create;
      _participante.Conexion := Conexion;

      iniciarConexion;
      Json := _participante.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete')
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
    _usuario := Tusuario.Create;
    _usuario.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _usuario.getAll
    else if idClave = 'model' then
      Result := _usuario.model
    else
      Result := _usuario.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-usuario');
  end;
end;

function TMatematicas.updateusuario(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  _usuario: Tusuario;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.Create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post')
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
  const Datos: TJSONObject): TJSONObject;
var
  _usuario: Tusuario;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.Create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put')
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _usuario := Tusuario.Create;
      _usuario.Conexion := Conexion;

      iniciarConexion;
      Json := _usuario.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete')
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
    _concurrencia := Tconcurrencia.Create;
    _concurrencia.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _concurrencia.getAll
    else if idClave = 'model' then
      Result := _concurrencia.model
    else
      Result := _concurrencia.Get(idClave);

    terminarConexion;

    escribirMensaje(Result.ToString, 'post')

  except
    on E: Exception do
      escribirMensaje(E.Message, 'error-concurrencia');
  end;
end;

function TMatematicas.updateconcurrencia(const token: string;
  const Datos: TJSONObject): TJSONObject;
var
  _concurrencia: Tconcurrencia;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.Create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.post(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'post')
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
  const Datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
begin
  try
    Json := TJSONObject.Create;
    if token = FDataSnapMatematicas.obtenerToken then
    begin
      Data.Subject := Datos.GetValue('asunto').Value;
      Data.Body.Clear;
      Data.Body.Add(Datos.GetValue('mensaje').Value);
      Data.Recipients.EMailAddresses := Datos.GetValue('correo').Value;

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
  const Datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  idResumen: string;
  idParticipante: string;
  capacidad: integer;
begin
  try
    Json := TJSONObject.Create;

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      idResumen := Datos.Get('idResumen').JsonValue.Value;
      idParticipante := Datos.Get('idParticipante').JsonValue.Value;

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
  const Datos: TJSONObject): TJSONObject;
var
  _concurrencia: Tconcurrencia;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.Create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.put(Datos);
      terminarConexion;

      escribirMensaje(Json.ToString, 'put')
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
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _concurrencia := Tconcurrencia.Create;
      _concurrencia.Conexion := Conexion;

      iniciarConexion;
      Json := _concurrencia.delete(idClave);
      terminarConexion;

      escribirMensaje(Json.ToString, 'delete')
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

function TMatematicas.updateobtenerCertificados(const Datos: TJSONObject)
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
    Json := TJSONObject.Create;
    ListaCertificados := TJSONArray.Create;
    Json.AddPair('certificados', ListaCertificados);

    cedula := Datos.Get('cedula').JsonValue.Value;
    fecha := Datos.Get('fecha').JsonValue.Value;
    nombre := Datos.Get('nombre').JsonValue.Value;

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
    Json := TJSONObject.Create;

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

function TMatematicas.obtenerListasTalleres: TJSONObject;
var
  Json: TJSONObject;
  i: integer;
  idResumen: string;
  j: integer;
begin
  Json := TJSONObject.Create;

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
    Json := TJSONObject.Create;

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

function TMatematicas.updatetoken(const Datos: TJSONObject): TJSONObject;
var
  i, n, j: integer;
  nombre, correo, clave: string;
  token: string;
begin
  try
    nombre := Datos.GetValue('nombre').Value;
    correo := Datos.GetValue('correo').Value;
    clave := Datos.GetValue('clave').Value;

    if (nombre = 'jprincon') and (correo = 'jarincon@uniquindio.edu.co') and
      (clave = 'Donmatematicas#512519') then
    begin
      token := FDataSnapMatematicas.obtenerToken;
    end
    else
    begin
      token := 'Acceso denegado, por favor recarge el navegador pulsando la tecla F5';
    end;

    Result := TJSONObject.Create;
    Result.AddPair('token', token);
  except
    on E: Exception do
      Result.AddPair('error', E.Message + ', token');
  end;
end;

procedure TMatematicas.DataModuleCreate(Sender: TObject);
var
  datosToken: TJSONObject;
begin
  DireccionLibreria.VendorHome := ExtractFilePath(ParamStr(0)) + 'librerias';

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
    Json := TJSONObject.Create;
    ListaCertificados := TJSONArray.Create;
    Json.AddPair('certificados', ListaCertificados);

    FCertificados.iniciarDocumento('Certificados_EMEM' + fecha);

    Query2.Close;
    Query2.SQL.Text := 'SELECT * FROM math_resumenes_autor';
    Query2.Open;
    Query2.First;

    ListaCedulas := TStringList.Create;

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

    Json := TJSONObject.Create;

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
    Json := TJSONObject.Create;
    listaPoster := TJSONArray.Create;
    Json.AddPair('Poster', listaPoster);

    Query.Close;
    Query.SQL.Text := 'SELECT * FROM math_resumen WHERE tipo=' + chr(39) +
      'Poster' + chr(39) + ' ORDER BY linea';
    Query.Open;

    for i := 1 to Query.RecordCount do
    begin
      JsonTemp := TJSONObject.Create;
      listaAutores := TJSONArray.Create;
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
        JsonAutores := TJSONObject.Create;
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
    Json := TJSONObject.Create;

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
      Json := TJSONObject.Create;

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

end.
