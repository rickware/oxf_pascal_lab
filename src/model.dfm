object FormModel: TFormModel
  Left = 0
  Top = 0
  Caption = 'Model'
  ClientHeight = 460
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object resposta: TRichEdit
    Left = 113
    Top = 399
    Width = 305
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'leResponse')
    ParentFont = False
    TabOrder = 0
    Visible = False
    Zoom = 100
  end
  object Button1: TButton
    Left = 165
    Top = 368
    Width = 206
    Height = 25
    Caption = 'Limpa tabela movimento'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGridCotacoes: TDBGrid
    Left = 101
    Top = 173
    Width = 346
    Height = 158
    DataSource = DSCotacao
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'moeda'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'operacao'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end>
  end
  object DBNavCotacoes: TDBNavigator
    Left = 147
    Top = 337
    Width = 240
    Height = 25
    DataSource = DSCotacao
    TabOrder = 3
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=SelecaoBimerRicardo;Data So' +
      'urce=RCOB-2019\SQLEXPRESS;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 24
    Top = 5
  end
  object ADOQmovimento: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from movimento')
    Left = 96
    Top = 5
    object ADOQmovimentoId: TIntegerField
      FieldName = 'Id'
    end
    object ADOQmovimentocliNum: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'cliNum'
      DisplayFormat = '0000'
    end
    object ADOQmovimentodescmov: TWideStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descmov'
      Size = 50
    end
    object ADOQmovimentodatamov: TDateField
      DisplayLabel = 'Data'
      FieldName = 'datamov'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ADOQmovimentovalormov: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valormov'
      DisplayFormat = 'R$ ,0.00;R$ ,0.00 (-)'
      currency = True
    end
    object ADOQmovimentosaldomov: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'saldomov'
      currency = True
    end
  end
  object DSmovimento: TDataSource
    DataSet = ADOQmovimento
    Left = 176
    Top = 5
  end
  object NetHTTPRequest1: TNetHTTPRequest
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    Client = NetHTTPClient1
    Left = 432
    Top = 56
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 328
    Top = 56
  end
  object ADOCotacao: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cotacao ORDER BY id DESC')
    Left = 95
    Top = 59
    object ADOCotacaoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOCotacaodata: TDateTimeField
      FieldName = 'data'
    end
    object ADOCotacaomoeda: TStringField
      FieldName = 'moeda'
      FixedChar = True
      Size = 10
    end
    object ADOCotacaooperacao: TStringField
      FieldName = 'operacao'
      FixedChar = True
      Size = 10
    end
    object ADOCotacaovalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '##,##0.0000'
    end
  end
  object DSCotacao: TDataSource
    DataSet = ADOCotacao
    Left = 176
    Top = 59
  end
  object ADOCommand1: TADOCommand
    CommandText = 
      'INSERT INTO Cotacao (id, data, moeda, operacao, valor) VALUES'#13#10'(' +
      'NULL, NOW(), "MOEDA", "OPER", 1);'
    Connection = ADOConnection
    Parameters = <>
    Left = 20
    Top = 61
  end
  object DSQuery1: TDataSource
    DataSet = ADOQuery1
    Left = 178
    Top = 117
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Cotacao ORDER BY id DESC')
    Left = 97
    Top = 116
  end
end
