program TestATP;

uses
  Vcl.Forms,
  Main in 'Main.pas' {ATP},
  DB in 'DB.pas' {DBForm},
  AddRecord in 'AddRecord.pas' {AddRec},
  Guides in 'Guides.pas' {GuideSForm},
  Auto in 'Auto.pas' {AutoForm},
  uOffice in 'uOffice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TATP, ATP);
  Application.CreateForm(TAddRec, AddRec);
  Application.CreateForm(TGuideSForm, GuideSForm);
  Application.CreateForm(TDBForm, DBForm);
  Application.CreateForm(TAutoForm, AutoForm);
  Application.Run;
end.
