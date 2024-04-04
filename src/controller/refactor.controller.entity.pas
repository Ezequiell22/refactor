unit refactor.controller.entity;

interface

uses
  refactor.controller.interfaces,
  refactor.model.DAO.interfaces,
  refactor.model.entity.user, refactor.model.entity.categoria;

type
  TControllerEntity = class(TInterfacedObject, iControllerEntity)
  private
    Fcategoria: iModelDAOEntity<TCategoria>;
    Fuser: iModelDAOEntity<TUser>;
  public
    constructor create;
    destructor destroy; override;
    class function New: iControllerEntity;
    function categoria: iModelDAOEntity<TCategoria>;
    function user: iModelDAOEntity<TUser>;
  end;

implementation

uses
  refactor.model.DAO.categoria, refactor.model.DAO.user;

{ TControllerEntity }

function TControllerEntity.categoria: iModelDAOEntity<TCategoria>;
begin
  if not assigned(Fcategoria) then
    Fcategoria := TmodelDaoCategoria.New;
  result := Fcategoria;
end;

constructor TControllerEntity.create;
begin

end;

destructor TControllerEntity.destroy;
begin

  inherited;
end;

class function TControllerEntity.New: iControllerEntity;
begin
  result := self.create;
end;

function TControllerEntity.user: iModelDAOEntity<TUser>;
begin
  if not assigned(Fuser) then
    Fuser := TmodelDaoUser.New;
  result := Fuser;
end;

end.
