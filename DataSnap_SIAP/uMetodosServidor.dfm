object Matematicas: TMatematicas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 492
  Width = 632
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
  object Query: TFDQuery
    Connection = Conexion
    Left = 32
    Top = 120
  end
  object DireccionLibreria: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 'libpq.dll'
    Left = 408
    Top = 32
  end
  object Query2: TFDQuery
    Connection = Conexion
    Left = 32
    Top = 176
  end
  object Query3: TFDQuery
    Connection = Conexion
    Left = 32
    Top = 240
  end
  object SMTP: TIdSMTP
    IOHandler = SSL
    Host = 'smtp.gmail.com'
    Password = 'eventomatematicas'
    Port = 587
    SASLMechanisms = <>
    UseTLS = utUseExplicitTLS
    Username = 'workshop.emem@gmail.com'
    Left = 552
    Top = 248
  end
  object SSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = 'smtp.gmail.com:587'
    Host = 'smtp.gmail.com'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 552
    Top = 192
  end
  object DATA: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 552
    Top = 136
  end
end
