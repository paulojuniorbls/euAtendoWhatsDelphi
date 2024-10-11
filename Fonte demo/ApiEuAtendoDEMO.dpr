program ApiEuAtendoDEMO;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form9},
  Functions in 'Functions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
