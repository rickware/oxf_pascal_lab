unit model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBGrids, Vcl.DBCtrls,
  System.Net.HttpClient, System.Net.HttpClientComponent, strUtils,
  System.Net.URLClient, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TFormModel = class(TForm)
    ADOConnection: TADOConnection;
    ADOQmovimento: TADOQuery;
    DSmovimento: TDataSource;
    ADOQmovimentoId: TIntegerField;
    ADOQmovimentocliNum: TIntegerField;
    ADOQmovimentodescmov: TWideStringField;
    ADOQmovimentodatamov: TDateField;
    ADOQmovimentovalormov: TFloatField;
    ADOQmovimentosaldomov: TFloatField;
    NetHTTPRequest1: TNetHTTPRequest;
    NetHTTPClient1: TNetHTTPClient;
    resposta: TRichEdit;
    ADOCotacao: TADOQuery;
    DSCotacao: TDataSource;
    ADOCotacaoid: TAutoIncField;
    ADOCotacaodata: TDateTimeField;
    ADOCotacaomoeda: TStringField;
    ADOCotacaooperacao: TStringField;
    ADOCotacaovalor: TFloatField;
    ADOCommand1: TADOCommand;
    DSQuery1: TDataSource;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    DBGridCotacoes: TDBGrid;
    DBNavCotacoes: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    var urlCotacao: string;
    procedure GravaCotacao(referencia: integer; valor:Double );
  protected

  public
    { Public declarations }
    var CotacaoNova, UltimaCotacao : array of real; vSaldo:Double;  vDataCotacao: string;
    function ParseJsonValue(resp:string; param:string):double;
    function PegaCotacaoVelha (Moeda : string; Operacao : string) : real;
    Procedure ComparaCotacoes;
    Procedure PegaCotacaoNova;
    Procedure PegaArquivoOFX;
    Procedure PegaSaldoBD;
  end;

var FormModel: TFormModel;
const pathtofile = 'C:\App\EXTRATO.OFX';

implementation
        uses System.JSON, ofxreader;

{$R *.dfm}

function TFormModel.ParseJsonValue(resp:string; param:string): double;
var JsonValue:TJSonValue; vresult: string; vdouble: double;
begin
   JsonValue := TJSonObject.ParseJSONValue(resp);
   vresult := JsonValue.GetValue<string>(param);
   JsonValue.Free;
   if Length(vresult) > 1 then vdouble := StrToFloat(vresult) else vdouble := 0.0;
   Result := vdouble;
end;

procedure TFormModel.PegaArquivoOFX;
 var tmpReader: TOFXReader;
  nkey, i: Integer; S :string; out: double;  flagminus: Boolean;

begin
  tmpReader := TOFXReader.Create(Self);
  nkey:=0;
  try
    tmpReader.OFXFile := ExpandFileName(pathtofile);
    if not (tmpReader.Import) then
      raise Exception.Create(Format('Import file %s with errors!', [tmpReader.OFXFile]));

    for i := 0 to tmpReader.Count - 1 do begin
      flagminus:=false;
      s:= tmpReader.Get(i).Value;

      if not TryStrToFloat(s, out) then begin  //corrige float invalido
        if AnsiLeftStr(s,1) = '-' then begin
          s:= stringReplace(s, '-', '' ,[rfReplaceAll, rfIgnoreCase]);
          flagminus:=true;
        end;
        if AnsiPos(',',s)   >  0  then s:= StringReplace(s, ',', '.',[rfReplaceAll, rfIgnoreCase]);
        out := StrToFloat(s);
        if flagminus then out:=out*-1;
      end;
      vSaldo := vSaldo + out;
      if ADOQmovimento.RecordCount > 0 then begin       //verifica se existem registros para setar a chave primaria
        ADOQmovimento.Last;
        nkey:= ADOQmovimento.FieldByName('id').Value;
      end;
      ADOQmovimento.InsertRecord([
        nkey+1,
        tmpReader.Get(i).ID,
        tmpReader.Get(i).Description,
        tmpReader.Get(i).MovDate,
        out
       ]);
   end;
  finally
    tmpReader.Free;
  end;
end;

Procedure TFormModel.PegaCotacaoNova;  // busca dados via http
  var strStrm : TStringStream;
begin
   strStrm := TStringStream.Create;
   resposta.Clear;
   try
     NetHTTPRequest1.Get(urlCotacao,strStrm);
     if Length(strStrm.ToString) > 0 then begin
      strStrm.Position := 0;
      resposta.Lines.LoadFromStream(strStrm);
      resposta.Refresh;
      DateTimeToString(vDataCotacao,'DD/MM/YYYY hh:nn:ss', Now);
      vDataCotacao := Concat('( ', vDataCotacao ,' )');
     end;

   finally
     strStrm.Free();
   end;
end;

function TFormModel.PegaCotacaoVelha(Moeda, Operacao: string): real;     // dados persistentes
var ValorApurado, Resultado : real;
    vQuery : string;
begin
    vQuery := 'SELECT TOP 1 id, data, valor FROM Cotacao WHERE moeda = ' +
    QuotedStr(Moeda) + ' AND operacao = ' + QuotedStr(Operacao) + ' ORDER BY id DESC';

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := vQuery;
    ADOQuery1.Open;
    ValorApurado := ADOQuery1.FieldByName('valor').AsFloat;

    vDataCotacao := 'atualizar';
    if ValorApurado <> 0 then begin
        Resultado := ValorApurado;
        DateTimeToString(vDataCotacao,'DD/MM/YYYY hh:nn:ss', ADOQuery1.FieldByName('data').AsDateTime);
        vDataCotacao := Concat('( ', vDataCotacao ,' )');
    end else
        Resultado := 0;

    Result := Resultado;
    ADOQuery1.Close;
end;

procedure TFormModel.PegaSaldoBD; //calcula saldo atualizado
begin
  with ADOQuery1 do begin
    Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'SELECT SUM(Movimento.valormov) AS total FROM Movimento';
    ADOQuery1.Open;
    vSaldo:= ADOQuery1.FieldByName('total').AsFloat;
  end;

end;

procedure TFormModel.Button1Click(Sender: TObject);       // limpa tabela movimento
begin
   ADOCommand1.CommandText :=  'TRUNCATE TABLE movimento ';
   ADOCommand1.Execute;
end;

procedure TFormModel.ComparaCotacoes;  //compara e atualiza o BD caso diferente
var
  I: Integer; resp: string;
begin
  resp:= resposta.Text;
  CotacaoNova[0]  := ParseJsonValue(resp, 'results.currencies.USD.buy');
  CotacaoNova[1]  := ParseJsonValue(resp, 'results.currencies.USD.sell');
  CotacaoNova[2]  := ParseJsonValue(resp, 'results.currencies.USD.variation');
  CotacaoNova[3]  := ParseJsonValue(resp, 'results.currencies.EUR.buy');
  CotacaoNova[4]  := ParseJsonValue(resp, 'results.currencies.EUR.sell');
  CotacaoNova[5]  := ParseJsonValue(resp, 'results.currencies.EUR.variation');
  CotacaoNova[6]  := ParseJsonValue(resp, 'results.currencies.BTC.buy');
  CotacaoNova[7]  := ParseJsonValue(resp, 'results.currencies.BTC.sell');
  CotacaoNova[8]  := ParseJsonValue(resp, 'results.currencies.BTC.variation');

  for I := 0 to 8 do begin
    if CotacaoNova[I] <> UltimaCotacao[I] then
    begin
      UltimaCotacao[I] := CotacaoNova[I];
      GravaCotacao(I,CotacaoNova[I]);
    end;
  end;
end;

procedure TFormModel.GravaCotacao(referencia: integer; valor:Double ); // cadastra nova cotacao no BD
var refmoeda, refoper, refdata, refvalor, sqlString: string;
begin
   case referencia of
     0: begin refmoeda:='USD'; refoper:='Compra'; end;
     1: begin refmoeda:='USD'; refoper:='Venda'; end;
     2: begin refmoeda:='USD'; refoper:='Variacao'; end;
     3: begin refmoeda:='EUR'; refoper:='Compra'; end;
     4: begin refmoeda:='EUR'; refoper:='Venda'; end;
     5: begin refmoeda:='EUR'; refoper:='Variacao'; end;
     6: begin refmoeda:='BTC'; refoper:='Compra'; end;
     7: begin refmoeda:='BTC'; refoper:='Venda'; end;
     8: begin refmoeda:='BTC'; refoper:='Variacao'; end;
   end;

   DateTimeToString(refdata,'YYYY-MM-DD hh:nn:ss', Now);
   refvalor:= FloatToStr(valor);
   sqlString :=  'INSERT INTO Cotacao (data, moeda, operacao, valor) VALUES ' +
     '(' + QuotedStr(refdata) + ', ' + QuotedStr(refmoeda) + ', ' +  QuotedStr(refoper) + ', ' + refvalor + ')';

   ADOCommand1.CommandText :=  sqlString;
   ADOCommand1.Execute;

end;

procedure TFormModel.FormCreate(Sender: TObject);
begin
  urlCotacao := 'https://api.hgbrasil.com/finance';
  SetLength(CotacaoNova, 9);
  SetLength(UltimaCotacao, 9);
end;

end.
