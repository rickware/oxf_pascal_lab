program selecao_bimer;

uses
  Vcl.Forms,
  view in 'view.pas' {FormMain},
  model in 'model.pas' {FormModel},
  ofxreader in 'ofxreader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormModel, FormModel);
  Application.Run;
end.
