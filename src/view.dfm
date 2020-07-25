object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Consulta de aplica'#231#227'o financeira'
  ClientHeight = 429
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    750
    429)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelSubtituloMovimento: TLabel
    Left = 24
    Top = 18
    Width = 165
    Height = 19
    Caption = 'Movimenta'#231#227'o Banc'#225'ria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ShapeDolar: TShape
    Left = 32
    Top = 315
    Width = 225
    Height = 100
  end
  object ShapeEuro: TShape
    Left = 259
    Top = 315
    Width = 225
    Height = 100
  end
  object ShapeBitcoin: TShape
    Left = 487
    Top = 315
    Width = 225
    Height = 100
  end
  object LinhaSeparadora: TShape
    Left = 24
    Top = 265
    Width = 696
    Height = 1
  end
  object LabelSaldoMovimento: TLabel
    Left = 589
    Top = 234
    Width = 123
    Height = 19
    Alignment = taRightJustify
    Anchors = [akRight]
    Caption = 'Saldo : R$ 0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelCotacoesdoDia: TLabel
    Left = 30
    Top = 283
    Width = 125
    Height = 19
    Caption = 'Cota'#231#245'es do Dia :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelDia: TLabel
    Left = 161
    Top = 283
    Width = 60
    Height = 19
    Caption = 'LabelDia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelDolar: TLabel
    Left = 53
    Top = 319
    Width = 50
    Height = 19
    Caption = 'D'#243'lar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelEuro: TLabel
    Left = 277
    Top = 319
    Width = 43
    Height = 19
    Caption = 'Euro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelBitcoin: TLabel
    Left = 505
    Top = 319
    Width = 62
    Height = 19
    Caption = 'Bitcoin:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDolarCompra: TLabel
    Left = 53
    Top = 344
    Width = 67
    Height = 19
    Caption = 'Compra: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelDolarVaria: TLabel
    Left = 53
    Top = 382
    Width = 71
    Height = 19
    Caption = 'Varia'#231#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelDolarVenda: TLabel
    Left = 53
    Top = 363
    Width = 55
    Height = 19
    Caption = 'Venda: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelEuroCompra: TLabel
    Left = 277
    Top = 344
    Width = 67
    Height = 19
    Caption = 'Compra: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelEuroVaria: TLabel
    Left = 277
    Top = 382
    Width = 71
    Height = 19
    Caption = 'Varia'#231#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelEuroVenda: TLabel
    Left = 277
    Top = 363
    Width = 55
    Height = 19
    Caption = 'Venda: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelBitcCompra: TLabel
    Left = 505
    Top = 344
    Width = 67
    Height = 19
    Caption = 'Compra: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelBitcVaria: TLabel
    Left = 505
    Top = 382
    Width = 71
    Height = 19
    Caption = 'Varia'#231#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelBitcVenda: TLabel
    Left = 505
    Top = 363
    Width = 55
    Height = 19
    Caption = 'Venda: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 727
    Top = 8
    Width = 15
    Height = 13
    Hint = 'ADMIN'
    Brush.Color = clMoneyGreen
    ParentShowHint = False
    Shape = stCircle
    ShowHint = True
    OnMouseDown = Shape1MouseDown
  end
  object DBGridMovimento: TDBGrid
    Left = 24
    Top = 43
    Width = 696
    Height = 174
    DataSource = FormModel.DSmovimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clLime
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'datamov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descmov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o'
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 450
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'valormov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 110
        Visible = True
      end>
  end
  object ButtonImportarOFX: TButton
    Left = 24
    Top = 223
    Width = 200
    Height = 30
    Caption = 'Importar arquivo Ofx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonImportarOFXClick
  end
  object ButtonAtualizaCotacoes: TButton
    Left = 496
    Top = 272
    Width = 224
    Height = 30
    Caption = 'Atualizar cota'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonAtualizaCotacoesClick
  end
end
