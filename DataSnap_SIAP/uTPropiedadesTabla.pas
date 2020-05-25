unit uTPropiedadesTabla;

interface

uses
  Classes, System.SysUtils, System.Json;

type
  TPropiedadesTabla = class(TObject)
  private
    FListaSQL, FListaJSON: TStringList;
    FDatos: TJSONObject;
  public
    constructor create;
    destructor destroy;

    procedure agregarPropiedad(propiedad: string);
    function obtenerPropiedadSQL(id: integer): string;
    function obtenerPropiedadJSON(id: integer): string;
    function obtenerPropiedadesSQL: string;
    function obtenerValuesSQL: string;
    function obtenerSetSQL: string;

    function cantidad: integer;
  published
  end;

implementation

{ TPropiedadesTabla }

procedure TPropiedadesTabla.agregarPropiedad(propiedad: string);
var
  FListProp: TStringList;
  i: integer;
  prop: string;
begin
  FListProp := TStringList.create;
  FListProp.Delimiter := '_';
  FListProp.DelimitedText := propiedad;

  prop := '';
  for i := 1 to FListProp.Count do
  begin
    if i = 1 then
      prop := FListProp[i - 1];

    if i > 1 then
      prop := prop + UpperCase(FListProp[i - 1][1]) +
        LowerCase(Copy(FListProp[i - 1], 2, length(FListProp[i - 1])));
  end;

  FListaSQL.Add(propiedad);
  FListaJSON.Add(prop);
end;

function TPropiedadesTabla.cantidad: integer;
begin
  Result := FListaSQL.Count;
end;

constructor TPropiedadesTabla.create;
begin
  FListaSQL := TStringList.create;
  FListaJSON := TStringList.create;
end;

destructor TPropiedadesTabla.destroy;
begin

end;

function TPropiedadesTabla.obtenerPropiedadesSQL: string;
var
  i: integer;
begin
  Result := '( ' + FListaSQL.CommaText + ' )';
end;

function TPropiedadesTabla.obtenerPropiedadJSON(id: integer): string;
begin
  Result := FListaJSON[id];
end;

function TPropiedadesTabla.obtenerPropiedadSQL(id: integer): string;
begin
  Result := FListaSQL[id];
end;

function TPropiedadesTabla.obtenerSetSQL: string;
var
  i: integer;
begin
  Result := ' SET ';
  for i := 1 to FListaSQL.Count do
  begin
    if i < FListaSQL.Count then
      Result := Result + FListaSQL[i - 1] + '=:' + FListaSQL[i - 1] + ', '
    else
      Result := Result + FListaSQL[i - 1] + '=:' + FListaSQL[i - 1];
  end;
end;

function TPropiedadesTabla.obtenerValuesSQL: string;
var
  i: integer;
begin
  Result := ' VALUES (';
  for i := 1 to FListaSQL.Count do
  begin
    if i < FListaSQL.Count then
      Result := Result + ':' + FListaSQL[i - 1] + ','
    else
      Result := Result + ':' + FListaSQL[i - 1] + ');';
  end;
end;

end.
