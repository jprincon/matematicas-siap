object Matematicas: TMatematicas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 492
  Width = 632
  object Conexion: TFDConnection
    Params.Strings = (
      'Database=matematicas'
      'User_Name=postgres'
      'Password=postgres'
      'CharacterSet=UTF8'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 1000000
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object Query: TFDQuery
    Connection = Conexion
    Left = 144
    Top = 32
  end
  object DireccionLibreria: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 'libpq.dll'
    Left = 456
    Top = 32
  end
  object Query2: TFDQuery
    Connection = Conexion
    Left = 200
    Top = 32
  end
  object Query3: TFDQuery
    Connection = Conexion
    Left = 256
    Top = 32
  end
  object SMTP: TIdSMTP
    IOHandler = SSL
    Host = 'smtp.gmail.com'
    Password = 'eventomatematicas'
    Port = 587
    SASLMechanisms = <>
    UseTLS = utUseExplicitTLS
    Username = 'workshop.emem@gmail.com'
    Left = 200
    Top = 240
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
    Left = 336
    Top = 240
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
    Left = 464
    Top = 200
  end
end
