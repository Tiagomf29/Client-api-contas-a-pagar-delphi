unit UConsomeApiUser;

interface
uses
  UUser, UICrudUsuarioInterfaceaAPI, Rest.Json, Rest.Response.Adapter, Rest.Client,
  System.SysUtils, Vcl.Dialogs, System.Generics.Collections, Datasnap.DBClient;

type

  TConsomeApiUser = class(TInterfacedObject, TICrudUsuarioInterfaceaAPI<TUser>)

  FRestClient                  : TRESTClient;
  FRestResponse                : TRESTResponse;
  FRestRequest                 : TRESTRequest;

  procedure carregaComponentesRest(AUrl : String);

  private
    procedure CarregaDbGrid;

  public

    function validaLoginByUserAndPassword(ALogin, ASenha : String): Boolean;
    function insertUser(obj: TUser): Boolean;
    function updateUser(obj: TUser): Boolean;
    function deleteUser(obj: TUser): Boolean;

    constructor Create();
    destructor Destroy();

  end;

implementation

{ TConsomeApiUser }

uses UFrmLogin;

procedure TConsomeApiUser.carregaComponentesRest(AUrl:String);
begin
  FRestClient.BaseURL   := AUrl;
  FRestRequest.Client   := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

procedure TConsomeApiUser.CarregaDbGrid;
begin

end;

constructor TConsomeApiUser.Create;
var
  lListUser : TUser;

begin
  FRestClient   := TRESTClient.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);
  FRestRequest  := TRESTRequest.Create(nil);
  //
  carregaComponentesRest('http://localhost:8080');
end;

function TConsomeApiUser.deleteUser(obj: TUser): Boolean;
begin

end;

destructor TConsomeApiUser.Destroy;
begin
  FreeAndNil(FRestClient);
  FreeAndNil(FRestResponse);
  FreeAndNil(FRestRequest);
end;

function TConsomeApiUser.insertUser(obj: TUser): Boolean;
begin

end;

function TConsomeApiUser.updateUser(obj: TUser): Boolean;
begin

end;

function TConsomeApiUser.validaLoginByUserAndPassword(ALogin, ASenha : String): Boolean;
begin
  FRestRequest.Resource := '/user/login/'+ALogin+'/senha/'+ASenha;
  try
    FRestRequest.Execute;
  except
    on e:Exception do
      raise Exception.Create('O servi?o n?o conseguiu receber a requisi??o. Comunique o administrador do sistema!');
  end;

  try
    if not StrToBool(FRestResponse.Content) then
    begin
      MessageDlg('Usu?rio ou senha incorreto. Verifique!',mtWarning,[mbOK],0);
      Exit;
    end
    else
      MessageDlg('OK Usuario e senha correto!',mtWarning,[mbOK],0);
  except
    on e:Exception do
      MessageDlg('Problema no retorno da API. Comunique o adminstrador do sistema.'+#13+#13 + e.Message,mtInformation, [mbOK],0);
  end;

end;

end.
