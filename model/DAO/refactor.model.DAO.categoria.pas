unit refactor.model.DAO.categoria;

interface

uses Data.DB,
  fireDac.comp.Client,
  fireDac.dapt,
  fireDac.Stan.Param,
  refactor.model.entity.categoria;

type
  TModelDaoCategoria = class
  private
    FFDConnection: TFDConnection;
    FFDQuery: TFDQuery;
    FDataSource: TDataSource;
    FEntity: TCategoria;
  public
    constructor Create(aConnection: TFDConnection);
    destructor Destroy; override;
    function Get: TModelDaoCategoria;
    function Insert: TModelDaoCategoria;
    function Update: TModelDaoCategoria;
    function Delete: TModelDaoCategoria;
    function DataSet(AValue: TDataSource): TModelDaoCategoria;
    function This: TCategoria;
  end;

implementation

uses
  System.SysUtils;

{ TModelDaoCategoria }

constructor TModelDaoCategoria.Create(aConnection: TFDConnection);
begin
  FFDConnection := aConnection;
  FFDQuery := TFDQuery.Create(nil);
  FFDQuery.Connection := FFDConnection;
  FEntity := TCategoria.Create;
end;

function TModelDaoCategoria.DataSet(AValue: TDataSource): TModelDaoCategoria;
begin
  result := self;
  FDataSource := AValue;
  FDataSource.DataSet := FFDQuery;
end;

function TModelDaoCategoria.Delete: TModelDaoCategoria;
begin
  result := self;
  try
    FFDQuery.Active := False;
    FFDQuery.sql.Clear;
    FFDQuery.sql.add('delete from categoria ');
    FFDQuery.sql.add(' where id = :id');
    FFDQuery.ParamByName('id').Value := FEntity.ID;
    FFDQuery.ExecSql;
  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

destructor TModelDaoCategoria.Destroy;
begin
  FFDQuery.FREE;
  FEntity.FREE;
  inherited;
end;

function TModelDaoCategoria.Get: TModelDaoCategoria;
begin
  result := self;
  try
    FFDQuery.Active := False;
    FFDQuery.sql.Clear;
    FFDQuery.sql.add('select * from categoria ');
    FFDQuery.Open;
    FFDQuery.Active := True;
  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

function TModelDaoCategoria.Insert: TModelDaoCategoria;
begin
  result := self;
  try
    FFDQuery.Active := False;
    FFDQuery.sql.Clear;
    FFDQuery.sql.add('insert into categoria( id, descricao )');
    FFDQuery.sql.add('values ( :id, :descricao )');
    FFDQuery.ParamByName('id').Value := FEntity.ID;
    FFDQuery.ParamByName('descricao').Value := FEntity.Descricao;
    FFDQuery.ExecSql;
  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

function TModelDaoCategoria.This: TCategoria;
begin
  result := FEntity;
end;

function TModelDaoCategoria.Update: TModelDaoCategoria;
begin
  result := self;
  try
    FFDQuery.Active := False;
    FFDQuery.sql.Clear;
    FFDQuery.sql.add('update categoria set descricao ');
    FFDQuery.sql.add(' = :descricao ');
    FFDQuery.sql.add(' where id = :id');
    FFDQuery.ParamByName('id').Value := FEntity.ID;
    FFDQuery.ParamByName('descricao').Value := FEntity.Descricao;
    FFDQuery.ExecSql;
  except
    on E: Exception do
      raise Exception.Create(E.message);

  end;
end;

end.