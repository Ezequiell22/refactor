unit refactor.model.entity.user;

interface

type
  TUser = class
  private
    FID: integer;
    FName: String;
    procedure setId(const Value: integer);
    procedure setName(const Value: string);
    function getName: string;
  public
    property id: integer read FID write setId;
    property name: string read getName write setName;
  end;

implementation

uses
  System.SysUtils;

{ TUser }

function TUser.getName: string;
begin

  if trim(FName) = '' then
    raise Exception.Create('Nome não pode ser vazio');

  result := FName;
end;

procedure TUser.setId(const Value: integer);
begin
  FID := Value;
end;

procedure TUser.setName(const Value: string);
begin
  FName := Value;
end;

end.
