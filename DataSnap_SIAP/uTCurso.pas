unit uTCurso;

interface

uses Classes, System.SysUtils, FireDAC.Comp.Client, System.Json,
  uTPropiedadesTabla;

type

  TCurso = class(TObject)
  private
    Query: TFDQuery;

    FNombreTabla: string;
    FSqlInsert: string;
    FMensajePost: string;
    FSqlSelect: string;
    FSqlUpdate: string;
    FSqlDelete: string;
    FMensajePut: string;
    FMensajeDelete: string;

    FPropiedadesTabla: TPropiedadesTabla;
    FConexion: TFDConnection;
    procedure setConexion(const Value: TFDConnection);

    function where(nombre, valor: string): string;
  public
    constructor create;
    destructor destroy;

    function post(datos: TJSONObject): TJSONObject;
    function get(idCurso: string): TJSONObject;
    function getAll: TJSONObject;
    function put(datos: TJSONObject): TJSONObject;
    function delete(idCurso: string): TJSONObject;
    function model: TJSONObject;
  published

    property Conexion: TFDConnection read FConexion write setConexion;
  end;

implementation

{ TCurso }

constructor TCurso.create;
begin
  Query := TFDQuery.create(nil);
  FNombreTabla := 'saem_curso ';
  FSqlInsert := 'INSERT INTO ';
  FSqlSelect := 'SELECT * FROM ';
  FSqlUpdate := 'UPDATE ';
  FSqlDelete := 'DELETE FROM ';
  FMensajePost := 'curso creado';
  FMensajePut := 'curso actualizado';
  FMensajeDelete := 'curso eliminado';

  FPropiedadesTabla := TPropiedadesTabla.create;
  with FPropiedadesTabla do
  begin
    agregarPropiedad('id_curso');
    agregarPropiedad('nombre');
    agregarPropiedad('descripcion');
    agregarPropiedad('imagen');
    agregarPropiedad('actualizacion');
  end;
end;

function TCurso.delete(idCurso: string): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON, valor: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlDelete + FNombreTabla + where('id_curso', idCurso);
    Query.ExecSQL;

    Json.AddPair('respuesta', FMensajeDelete);

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

destructor TCurso.destroy;
begin

end;

function TCurso.get(idCurso: string): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON, valor: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlSelect + FNombreTabla + where('id_curso', idCurso);
    Query.Open;

    for i := 1 to FPropiedadesTabla.cantidad do
    begin
      claveSQL := FPropiedadesTabla.obtenerPropiedadSQL(i - 1);
      claveJSON := FPropiedadesTabla.obtenerPropiedadJSON(i - 1);
      valor := Query.FieldByName(claveSQL).AsString;
      Json.AddPair(claveJSON, valor);
    end;

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

function TCurso.getAll: TJSONObject;
var
  ArregloJSON: TJSONArray;
  JsonFor: TJSONObject;
  JsonLista: TJSONObject;
  i, j: integer;
  respuesta, tipo: string;
  claveSQL, claveJSON, valor: string;
begin
  try
    ArregloJSON := TJSONArray.create;
    JsonLista := TJSONObject.create;

    JsonLista.AddPair('cursos', ArregloJSON);

    Query.Close;
    Query.SQL.Text := FSqlSelect + FNombreTabla;
    Query.Open;
    Query.First;

    for i := 1 to Query.RecordCount do
    begin
      JsonFor := TJSONObject.create;

      for j := 1 to FPropiedadesTabla.cantidad do
      begin
        claveSQL := FPropiedadesTabla.obtenerPropiedadSQL(j - 1);
        claveJSON := FPropiedadesTabla.obtenerPropiedadJSON(j - 1);
        valor := Query.FieldByName(claveSQL).AsString;
        JsonFor.AddPair(claveJSON, valor);
      end;

      ArregloJSON.AddElement(JsonFor);

      Query.Next;
    end;

    respuesta := 'cursos obtenidos';

  except
    on E: Exception do
    begin
      respuesta := 'Ocurrio el siguiente error: ' + E.Message;
    end;
  end;

  JsonLista.AddPair('respuesta', respuesta);
  Result := JsonLista;
end;

function TCurso.model: TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON, valor: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    for i := 1 to FPropiedadesTabla.cantidad do
    begin
      claveSQL := FPropiedadesTabla.obtenerPropiedadSQL(i - 1);
      claveJSON := FPropiedadesTabla.obtenerPropiedadJSON(i - 1);
      valor := 'valor';
      Json.AddPair(claveJSON, valor);
    end;

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

function TCurso.post(datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlInsert + FNombreTabla +
      FPropiedadesTabla.obtenerPropiedadesSQL +
      FPropiedadesTabla.obtenerValuesSQL;

    for i := 1 to FPropiedadesTabla.cantidad do
    begin
      claveSQL := FPropiedadesTabla.obtenerPropiedadSQL(i - 1);
      claveJSON := FPropiedadesTabla.obtenerPropiedadJSON(i - 1);

      Query.Params.ParamByName(claveSQL).Value := datos.get(claveJSON)
        .JsonValue.Value;
    end;

    Query.ExecSQL;
    Json.AddPair('respuesta', FMensajePost);

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

function TCurso.put(datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlUpdate + FNombreTabla +
      FPropiedadesTabla.obtenerSetSQL + where('id_curso',
      datos.get('idCurso').JsonValue.Value);
    Json.AddPair('datos', datos.ToString);
    Json.AddPair('sql', Query.SQL.Text);

    for i := 1 to FPropiedadesTabla.cantidad do
    begin
      claveSQL := FPropiedadesTabla.obtenerPropiedadSQL(i - 1);
      claveJSON := FPropiedadesTabla.obtenerPropiedadJSON(i - 1);

      Query.Params.ParamByName(claveSQL).Value := datos.get(claveJSON)
        .JsonValue.Value;
    end;

    Query.ExecSQL;
    Json.AddPair('respuesta', FMensajePut);

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

procedure TCurso.setConexion(const Value: TFDConnection);
begin
  FConexion := Value;
  Query.Connection := Value;
end;

function TCurso.where(nombre, valor: string): string;
begin
  Result := ' WHERE ' + nombre + '=' + chr(39) + valor + chr(39);
end;

end.
