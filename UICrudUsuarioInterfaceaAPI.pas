unit UICrudUsuarioInterfaceaAPI;

interface

uses
  UUser;

type

  TICrudUsuarioInterfaceaAPI<T> = interface
    function validaLoginByUserAndPassword(ALogin, ASenha: String): Boolean;
    function insertUser(obj: T): Boolean;
    function updateUser(obj: T): Boolean;
    function deleteUser(obj: T): Boolean;
  end;

implementation

end.
