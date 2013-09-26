object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 264
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 16
    Width = 48
    Height = 17
    Caption = 'Skolot'#257'ja'
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 264
    Top = 16
    Width = 45
    Height = 17
    Caption = 'Kabinets'
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 536
    Top = 16
    Width = 55
    Height = 17
    Caption = 'Prieksmets'
    TabOrder = 3
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'ASA'
    GetDriverFunc = 'getSQLDriverASA'
    LibraryName = 'sqlite3.dll'
    Params.Strings = (
      'DriverUnit=Data.DBXSybaseASA'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXSybaseASAMetaDataCommandFactory,DbxSyb' +
        'aseASADriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXSybaseASAMetaDataCommand' +
        'Factory,Borland.Data.DbxSybaseASADriver,Version=16.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverASA'
      'LibraryName=dbxasa.dll'
      'LibraryNameOsx=libsqlasa.dylib'
      'VendorLib=dbodbc*.dll'
      'VendorLibWin64=dbodbc*.dll'
      'VendorLibOsx=libdbodbc12.dylib'
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'Port='
      'ConnectionString='
      'BlobSize=-1'
      'ErrorResourceFile=')
    VendorLib = 'dbodbc*.dll'
    Top = 272
  end
  object Table1: TTable
    TableName = 'tabula'
    Left = 24
    Top = 48
    object Table1Pasniedzējs: TStringField
      FieldName = 'Pasniedz'#275'js'
    end
    object Table1Kabinets: TIntegerField
      FieldName = 'Kabinets'
    end
    object Table1Priekšmets: TStringField
      FieldName = 'Priek'#353'mets'
    end
  end
end
