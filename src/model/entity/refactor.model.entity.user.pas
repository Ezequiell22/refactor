unit refactor.model.entity.user;

interface

uses
  refactor.model.DAO.interfaces;

type
  TUser = class
  private
    [weak]
    FParent: iModelDAOEntity<TUser>;
    FID: integer;
    FName: String;
  public
    constructor Create(aParent: iModelDAOEntity<TUser>);
    destructor Destroy; override;
    function id(aValue: integer): TUser; overload;
    function id: integer; overload;
    function Name(aValue: string): TUser; overload;
    function Name: string; overload;
    function &End: iModelDAOEntity<TUser>;
  end;

implementation

uses
  System.SysUtils;

{ TUser }

constructor TUser.Create(aParent: iModelDAOEntity<TUser>);
begin
  FParent := aParent;
end;

destructor TUser.Destroy;
begin

  inherited;
end;

function TUser.&End: iModelDAOEntity<TUser>;
begin
  result := FParent;
end;

function TUser.id(aValue: integer): TUser;
begin
  result := self;
  FID := aValue;
end;

function TUser.id: integer;
begin
  if (FID) <= 0 then
    raise Exception.Create('id não pode ser vazio');

  result := FID;
end;

function TUser.Name(aValue: string): TUser;
begin
  result := self;
  FName := aValue;
end;

function TUser.Name: string;
begin
  if trim(FName) = '' then
    raise Exception.Create('Nome não pode ser vazio');

  result := FName;
end;

end.
