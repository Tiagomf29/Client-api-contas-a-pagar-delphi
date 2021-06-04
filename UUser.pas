unit UUser;

interface

type

  TUser = class

  private
    Fcode     : Integer;
    FfullName  : String;
    Fcpf      : Integer;
    Flogin    : String;
    Fpassword : String;
    function getCode: Integer;
    function getCpf: Integer;
    function getFullName: String;
    function getLogin: String;
    function getPassword: String;
    procedure setCode(const Value: Integer);
    procedure setCpf(const Value: Integer);
    procedure setFullName(const Value: String);
    procedure setLogin(const Value: String);
    procedure setPassword(const Value: String);

  public

   property code : Integer read getCode write setCode;
   property fullName : String read getFullName write setFullName;
   property cpf : Integer read getCpf write setCpf;
   property login : String read getLogin write setLogin;
   property password : String read getPassword write setPassword;

  end;

implementation

{ TUser }

function TUser.getCode: Integer;
begin
  Result := Fcode;
end;

function TUser.getCpf: Integer;
begin
  Result := Fcpf;
end;

function TUser.getFullName: String;
begin
  Result := FfullName;
end;

function TUser.getLogin: String;
begin
  Result := Flogin;
end;

function TUser.getPassword: String;
begin
  Result := Fpassword;
end;

procedure TUser.setCode(const Value: Integer);
begin
  Fcode := Value;
end;

procedure TUser.setCpf(const Value: Integer);
begin
  Fcpf := Value;
end;

procedure TUser.setFullName(const Value: String);
begin
  FfullName := Value;
end;

procedure TUser.setLogin(const Value: String);
begin
  Flogin := Value;
end;

procedure TUser.setPassword(const Value: String);
begin
  Fpassword := Value;
end;

end.
