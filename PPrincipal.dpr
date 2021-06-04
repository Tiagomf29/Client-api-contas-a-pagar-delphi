program PPrincipal;

uses
  Vcl.Forms,
  UFrmLogin in 'UFrmLogin.pas' {frmLogin},
  UUser in 'UUser.pas',
  UICrudUsuarioInterfaceaAPI in 'UICrudUsuarioInterfaceaAPI.pas',
  UConsomeApiUser in 'UConsomeApiUser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
