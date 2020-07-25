unit view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.DBXMSSQL, Data.SqlExpr,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Datasnap.DBClient, Data.FMTBcd, Data.Win.ADODB, Vcl.WinXPickers;

type
  TFormMain = class(TForm)
    LabelSubtituloMovimento: TLabel;
    DBGridMovimento: TDBGrid;
    ShapeDolar: TShape;
    ShapeEuro: TShape;
    ShapeBitcoin: TShape;
    LabelDolarCompra: TLabel;
    LabelDolarVenda: TLabel;
    LabelDolarVaria: TLabel;
    LabelEuroCompra: TLabel;
    LabelEuroVenda: TLabel;
    LabelEuroVaria: TLabel;
    LabelBitcCompra: TLabel;
    LabelBitcVenda: TLabel;
    LabelBitcVaria: TLabel;
    ButtonImportarOFX: TButton;
    LinhaSeparadora: TShape;
    LabelSaldoMovimento: TLabel;
    ButtonAtualizaCotacoes: TButton;
    LabelCotacoesdoDia: TLabel;
    LabelDia: TLabel;
    LabelDolar: TLabel;
    LabelEuro: TLabel;
    LabelBitcoin: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ButtonAtualizaCotacoesClick(Sender: TObject);
    procedure ButtonImportarOFXClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    procedure AtualizaForm;

  public
    { Public declarations }

  end;

var
  FormMain: TFormMain;

implementation
   uses model;

{$R *.dfm}

procedure TFormMain.AtualizaForm;
begin
  with FormModel do begin
    if UltimaCotacao[0] < 1 then begin
      UltimaCotacao[0] := PegaCotacaoVelha('USD', 'Compra');
      UltimaCotacao[1] := PegaCotacaoVelha('USD', 'Venda');
      UltimaCotacao[2] := PegaCotacaoVelha('USD', 'Variacao');
      UltimaCotacao[3] := PegaCotacaoVelha('EUR', 'Compra');
      UltimaCotacao[4] := PegaCotacaoVelha('EUR', 'Venda');
      UltimaCotacao[5] := PegaCotacaoVelha('EUR', 'Variacao');
      UltimaCotacao[6] := PegaCotacaoVelha('BTC', 'Compra');
      UltimaCotacao[7] := PegaCotacaoVelha('BTC', 'Venda');
      UltimaCotacao[8] := PegaCotacaoVelha('BTC', 'Variacao');
    end;
    LabelDolarCompra.Caption := 'Compra: '  + FormatFloat('0.0000', UltimaCotacao[0]);
    LabelDolarVenda.Caption  := 'Venda: '   + FormatFloat('0.0000', UltimaCotacao[1]);
    LabelDolarVaria.Caption  := 'Variação: '+ FormatFloat('0.000', UltimaCotacao[2]);
    LabelEuroCompra.Caption  := 'Compra: '  + FormatFloat('0.0000', UltimaCotacao[3]);
    LabelEuroVenda.Caption   := 'Venda: '   + FormatFloat('0.0000', UltimaCotacao[4]);
    LabelEuroVaria.Caption   := 'Variação: '+ FormatFloat('0.000', UltimaCotacao[5]);
    LabelBitcCompra.Caption  := 'Compra: '  + FormatFloat('0.0000', UltimaCotacao[6]);
    LabelBitcVenda.Caption   := 'Venda: '   + FormatFloat('0.0000', UltimaCotacao[7]);
    LabelBitcVaria.Caption   := 'Variação: '+ FormatFloat('0.000', UltimaCotacao[8]);
    ADOCotacao.Refresh;
    LabelDia.Caption := vDataCotacao;
    PegaSaldoBD;
  end;
  LabelSaldoMovimento.Caption := 'Saldo : R$ ' +  FormatFloat('##,##0.00', FormModel.vSaldo);
end;

procedure TFormMain.ButtonAtualizaCotacoesClick(Sender: TObject);
begin
  With FormModel do begin
    PegaCotacaoNova;
    ComparaCotacoes;
    AtualizaForm;
  end;
end;

procedure TFormMain.ButtonImportarOFXClick(Sender: TObject);
begin
  FormModel.PegaArquivoOFX;
  LabelSaldoMovimento.Caption := 'Saldo: R$ ' + FormatFloat('##,##0.00', FormModel.vSaldo);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  with FormatSettings do begin
    CurrencyString    := 'R$ ';
    DecimalSeparator  := '.';
    ThousandSeparator := '.';
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  AtualizaForm;
end;

procedure TFormMain.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FormModel.Show;
end;

end.
