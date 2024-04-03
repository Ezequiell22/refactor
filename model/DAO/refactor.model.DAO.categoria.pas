unit refactor.model.DAO.categoria;

interface

uses Data.DB,
  refactor.model.entity.categoria,
  refactor.model.components.connections.interfaces,
  System.SysUtils,
  refactor.model.components.connections.firedac,
  refactor.model.DAO.interfaces;

type
  TModelDaoCategoria = class(TInterfacedObject, iModelDAOEntity<TCategoria>)
  private
    FConnection: iModelComponentsConnections;
    FDataSource: TDataSource;
    FEntity: TCategoria;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelDAOEntity<TCategoria>;
    function Delete: iModelDAOEntity<TCategoria>;
    function DataSet(AValue: TDataSource): iModelDAOEntity<TCategoria>;
    function Get: iModelDAOEntity<TCategoria>;
    function Insert: iModelDAOEntity<TCategoria>;
    function This: TCategoria;
    function Update: iModelDAOEntity<TCategoria>;
  end;

implementation

{ TModelDaoCategoria }

constructor TModelDaoCategoria.Create;
begin
  FConnection := TModelCompnentsConnectionsFiredac.New;
  FEntity := TCategoria.Create;
end;

function TModelDaoCategoria.DataSet(AValue: TDataSource): iModelDAOEntity<TCategoria>;
begin
  result := self;
  FDataSource := AValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

function TModelDaoCategoria.Delete: iModelDAOEntity<TCategoria>;
begin
  result := self;
  try
    FConnection.active(false).sqlClear.sqlAdd('delete from categoria ')
      .sqlAdd(' where id = :id').addParam('id', FEntity.ID).execSql
  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

destructor TModelDaoCategoria.Destroy;
begin

  FEntity.FREE;
  inherited;
end;

function TModelDaoCategoria.Get: iModelDAOEntity<TCategoria>;
begin
  result := self;
  try

    FConnection.active(false).sqlClear.sqlAdd('select * from categoria ').Open

  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

function TModelDaoCategoria.Insert: iModelDAOEntity<TCategoria>;
begin
  result := self;
  try

    FConnection.active(false).sqlClear.sqlAdd
      ('insert into categoria( id, descricao )')
      .sqlAdd('values ( :id, :descricao )').addParam('id', FEntity.ID)
      .addParam('descricao', FEntity.Descricao).execSql

  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

class function TModelDaoCategoria.New: iModelDAOEntity<TCategoria>;
begin
   result := Self.Create;
end;

function TModelDaoCategoria.This: TCategoria;
begin
  result := FEntity;
end;

function TModelDaoCategoria.Update: iModelDAOEntity<TCategoria>;
begin
  result := self;
  try

    FConnection.active(false).sqlClear.sqlAdd('update categoria set descricao ')
      .sqlAdd(' = :descricao ').sqlAdd(' where id = :id')
      .addParam('id', FEntity.ID).addParam('descricao',
      FEntity.Descricao).execSql

  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

end.
