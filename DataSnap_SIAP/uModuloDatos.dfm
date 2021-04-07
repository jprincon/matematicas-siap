object moduloDatos: TmoduloDatos
  OldCreateOrder = False
  Height = 735
  Width = 811
  object Conexion: TFDConnection
    Params.Strings = (
      'Database=siap'
      'User_Name=postgres'
      'Password=!40r4c10n713n3.0d3r'
      'CharacterSet=UTF8'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evMode, evRowsetSize]
    FetchOptions.Mode = fmAll
    FetchOptions.RowsetSize = 1000000
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object Encriptador: TMD5
    Left = 640
    Top = 496
  end
end
