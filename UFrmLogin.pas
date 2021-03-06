unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  Datasnap.DBClient;

type
  TfrmLogin = class(TForm)
    edtusuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure consumirApiLogon();
    function validaCampos():Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses
  UConsomeApiUser;

{$R *.dfm}

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
  if validaCampos then
    consumirApiLogon();
end;

procedure TfrmLogin.consumirApiLogon;
var
  consomeApi : TConsomeApiUser;
begin
  consomeApi  := TConsomeApiUser.Create();
  try
    consomeApi.validaLoginByUserAndPassword(edtusuario.Text,edtSenha.Text);
  finally
    FreeAndNil(consomeApi);
  end;
end;

function TfrmLogin.validaCampos: Boolean;
begin
  Result := True;
  if Trim(edtusuario.Text) = '' then
  begin
    MessageDlg('Usu?rio n?o informado!',mtInformation,[mbOK],0);
    Result := False;
    edtusuario.SetFocus;
  end
  else
  if Trim(edtSenha.Text) = '' then
  begin
    MessageDlg('Senha n?o informada!',mtInformation,[mbOK],0);
    Result := False;
    edtSenha.SetFocus;
  end;
end;

end.
