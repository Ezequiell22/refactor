unit refactor.model.DAO.user;

interface

uses
  refactor.model.DAO.interfaces,
  refactor.model.entity.user,
  Data.DB,
  refactor.model.components.connections.interfaces;

type
  TModelDAOUser = class(TinterfacedObject, iModelDAOEntity<TUser>)
  private
    FConnection: iModelComponentsConnections;
    FDataSource: TDataSource;
    FEntity: TUser;
  public
    constructor create;
    destructor destroy; override;
    class function New: iModelDAOEntity<TUser>;
    function Delete: iModelDAOEntity<TUser>;
    function DataSet(AValue: TDataSource): iModelDAOEntity<TUser>;
    function Get: iModelDAOEntity<TUser>;
    function Insert: iModelDAOEntity<TUser>;
    function This: TUser;
    function Update: iModelDAOEntity<TUser>;
  end;

implementation

uses
  refactor.model.components.connections.firedac, System.SysUtils;

{ TModelDAOUser }

constructor TModelDAOUser.create;
begin
  FEntity := TUser.create(Self);
  FConnection := TModelCompnentsConnectionsFiredac.New;
end;

function TModelDAOUser.DataSet(AValue: TDataSource): iModelDAOEntity<TUser>;
begin
  result := Self;
  FDataSource := AValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

function TModelDAOUser.Delete: iModelDAOEntity<TUser>;
begin
  result := Self;
  try
    FConnection.active(false).sqlClear.sqlAdd('delete from usuario ')
      .sqlAdd(' where id = :id').addParam('id', FEntity.ID).execSql
  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

destructor TModelDAOUser.destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelDAOUser.Get: iModelDAOEntity<TUser>;
begin
  result := Self;
  try
    FConnection.active(false).sqlClear.sqlAdd('select * from usuario ').Open
  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

function TModelDAOUser.Insert: iModelDAOEntity<TUser>;
begin
  result := Self;
  try
    FConnection.active(false).sqlClear.sqlAdd
      ('insert into usuario ( id, name )').sqlAdd('values ( :id, :name )')
      .addParam('id', FEntity.ID).addParam('name', FEntity.name).execSql

  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

class function TModelDAOUser.New: iModelDAOEntity<TUser>;
begin
  result := Self.create;
end;

function TModelDAOUser.This: TUser;
begin
  result := FEntity;
end;

function TModelDAOUser.Update: iModelDAOEntity<TUser>;
begin
  result := Self;
  try

    FConnection.active(false).sqlClear.sqlAdd
      ('update usuario set name = :name ').sqlAdd(' where id = :id')
      .addParam('id', FEntity.ID).addParam('name', FEntity.name).execSql

  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

end.
