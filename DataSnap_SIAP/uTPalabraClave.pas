unit uTPalabraClave;

interface

uses Classes, System.SysUtils, FireDAC.Comp.Client, System.Json,
  uTPropiedadesTabla, Vcl.dialogs;

type

  TPalabraClave = class(TObject)
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
    FMensajeSelect: string;
    FSQLClavePrincipal: string;
    FJSONClavePrincipal: string;
    FNombreLista: string;
    FSQLOrdenarPor: string;

    FPropiedadesTabla: TPropiedadesTabla;
    FConexion: TFDConnection;
    procedure seTPalabraClave(const Value: TFDConnection);

    function where(nombre, valor: string): string;
  public
    constructor create;
    destructor destroy;

    function post(datos: TJSONObject): TJSONObject;
    function get(idClave: string): TJSONObject;
    function getPalabrasResumenes(idClave: string): TJSONObject;
    function getAll: TJSONObject;
    function put(datos: TJSONObject): TJSONObject;
    function delete(idClave: string): TJSONObject;
    function model: TJSONObject;
  published

    property Conexion: TFDConnection read FConexion write seTPalabraClave;
  end;

implementation

{ TCurso }

constructor TPalabraClave.create;
begin
  Query := TFDQuery.create(nil);
  FNombreTabla := 'math_palabras_clave ';
  FSqlInsert := 'INSERT INTO ';
  FSqlSelect := 'SELECT * FROM ';
  FSqlUpdate := 'UPDATE ';
  FSqlDelete := 'DELETE FROM ';

  FSQLOrdenarPor := ' ORDER BY palabra';

  FSQLClavePrincipal := 'id_palabra_clave';
  FJSONClavePrincipal := 'idPalabraClave';

  FMensajePost := 'Palabra clave creada';
  FMensajePut := 'Palabra clave actualizada';
  FMensajeDelete := 'Palabra clave eliminada';
  FMensajeSelect := 'Palabras clave obtenidas';

  FNombreLista := 'palabrasClave';

  FPropiedadesTabla := TPropiedadesTabla.create;
  with FPropiedadesTabla do
  begin
    agregarPropiedad('id_palabra_clave');
    agregarPropiedad('palabra');
    agregarPropiedad('id_resumen');
  end;
end;

function TPalabraClave.delete(idClave: string): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON, valor: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlDelete + FNombreTabla +
      where(FSQLClavePrincipal, idClave);
    Query.ExecSQL;

    Json.AddPair('respuesta', FMensajeDelete);

  except
    on E: Exception do
      Json.AddPair('respuesta', E.Message);
  end;

  Result := Json;
end;

destructor TPalabraClave.destroy;
begin

end;

function TPalabraClave.get(idClave: string): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON, valor: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlSelect + FNombreTabla + where(FSQLClavePrincipal,
      idClave) + FSQLOrdenarPor;
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

function TPalabraClave.getAll: TJSONObject;
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

    JsonLista.AddPair(FNombreLista, ArregloJSON);

    Query.Close;
    Query.SQL.Text := FSqlSelect + FNombreTabla + FSQLOrdenarPor;
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

    respuesta := FMensajeSelect;

  except
    on E: Exception do
    begin
      respuesta := 'Ocurrio el siguiente error: ' + E.Message;
    end;
  end;

  JsonLista.AddPair('respuesta', respuesta);
  Result := JsonLista;
end;

function TPalabraClave.getPalabrasResumenes(idClave: string): TJSONObject;
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

    JsonLista.AddPair(FNombreLista, ArregloJSON);

    Query.Close;
    Query.SQL.Text := FSqlSelect + FNombreTabla + where('id_resumen', idClave) +
      FSQLOrdenarPor;
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

    respuesta := FMensajeSelect;

  except
    on E: Exception do
    begin
      respuesta := 'Ocurrio el siguiente error: ' + E.Message;
    end;
  end;

  JsonLista.AddPair('respuesta', respuesta);
  Result := JsonLista;
end;

function TPalabraClave.model: TJSONObject;
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

function TPalabraClave.post(datos: TJSONObject): TJSONObject;
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

function TPalabraClave.put(datos: TJSONObject): TJSONObject;
var
  Json: TJSONObject;
  claveSQL, claveJSON: string;
  i: integer;
begin
  try
    Json := TJSONObject.create;

    Query.Close;
    Query.SQL.Text := FSqlUpdate + FNombreTabla +
      FPropiedadesTabla.obtenerSetSQL + where(FSQLClavePrincipal,
      datos.get(FJSONClavePrincipal).JsonValue.Value);

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

procedure TPalabraClave.seTPalabraClave(const Value: TFDConnection);
begin
  FConexion := Value;
  Query.Connection := Value;
end;

function TPalabraClave.where(nombre, valor: string): string;
begin
  Result := ' WHERE ' + nombre + '=' + chr(39) + valor + chr(39);
end;

end.
