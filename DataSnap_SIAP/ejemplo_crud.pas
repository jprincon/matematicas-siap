{ CRUD: iglesia }
    function iglesia(idClave: string): TJSONObject;
    function updateiglesia(const token: string; const Datos: TJSONObject)
      : TJSONObject;
    function canceliglesia(const idClave: string; const token: string): TJSONObject;
    function acceptiglesia(const token: string; const Datos: TJSONObject)
      : TJSONObject;

{ CRUD: iglesia %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% }
function TMatematicas.iglesia(idClave: string): TJSONObject;
var
  _iglesia: Tiglesia;
begin
  try
    _iglesia := Tiglesia.Create;
    _iglesia.Conexion := Conexion;

    iniciarConexion;

    if idClave = 'all' then
      Result := _iglesia.getAll
    else if idClave = 'model' then
      Result := _iglesia.model
    else
      Result := _iglesia.Get(idClave);

    terminarConexion;

    escribirMensaje('[get] hora:' + TimeToStr(now) + ' = ' +
      Result.ToString, 1);

  except
    on E: Exception do
      escribirMensaje(E.Message, 3);
  end;
end;

function TMatematicas.updateiglesia(const token: string; const Datos: TJSONObject)
  : TJSONObject;
var
  _iglesia: Tiglesia;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _iglesia := Tiglesia.Create;
      _iglesia.Conexion := Conexion;

      iniciarConexion;
      Json := _iglesia.post(Datos);
      terminarConexion;

      escribirMensaje('[post](' + TimeToStr(now) + ') --> ' + Json.ToString, 1);
    end
    else
    begin
      Json.AddPair('respuesta', 'accesso denegado');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 3);
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.acceptiglesia(const token: string; const Datos: TJSONObject)
  : TJSONObject;
var
  _iglesia: Tiglesia;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;
  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _iglesia := Tiglesia.Create;
      _iglesia.Conexion := Conexion;

      iniciarConexion;
      Json := _iglesia.put(Datos);
      terminarConexion;

      escribirMensaje('[put](' + TimeToStr(now) + ') --> ' + Json.ToString, 1);
    end
    else
    begin
      Json.AddPair('respuesta', 'accesso denegado');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 3);
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;

function TMatematicas.canceliglesia(const idClave: string; const token: string)
  : TJSONObject;
var
  _iglesia: Tiglesia;
  Json: TJSONObject;
begin
  Json := TJSONObject.Create;

  try

    if token = FDataSnapMatematicas.obtenerToken then
    begin
      _iglesia := Tiglesia.Create;
      _iglesia.Conexion := Conexion;

      iniciarConexion;
      Json := _iglesia.delete(idClave);
      terminarConexion;

      escribirMensaje('[delete](' + TimeToStr(now) + ') --> ' +
        Json.ToString, 1);
    end
    else
    begin
      Json.AddPair('respuesta', 'accesso denegado');
    end;

  except
    on E: Exception do
    begin
      escribirMensaje(E.Message, 3);
      Json.AddPair('respuesta', E.Message);
    end;
  end;

  Result := Json;
end;
