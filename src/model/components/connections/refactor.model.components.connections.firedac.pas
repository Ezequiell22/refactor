unit refactor.model.components.connections.firedac;

interface

uses refactor.model.components.connections.interfaces,
  firedac.Stan.Intf,
  firedac.Stan.Option,
  firedac.Stan.Error,
  firedac.UI.Intf,
  firedac.Phys.Intf,
  firedac.Stan.Def,
  firedac.Stan.Pool,
  firedac.Stan.Async,
  firedac.Phys,
  firedac.VCLUI.Wait,
  firedac.Comp.Client,
  firedac.Phys.PG,
  firedac.Phys.PGDef,
  firedac.Stan.Param,
  firedac.DApt,
  Data.DB;

type

  TModelCompnentsConnectionsFiredac = class(TInterfacedObject,
    iModelComponentsConnections)
  private
    FFDConnection: TFDConnection;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    FFDQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelComponentsConnections;
    function active(aValue: boolean): iModelComponentsConnections;
    function addParam(aParam: string; aValue: Variant)
      : iModelComponentsConnections;
    function DataSet: TDataSet;
    function execSql: iModelComponentsConnections;
    function open: iModelComponentsConnections;
    function sqlClear: iModelComponentsConnections;
    function sqlAdd(aValue: string): iModelComponentsConnections;

  end;

implementation

{ TModelCompnentsConnectionsFiredac }

function TModelCompnentsConnectionsFiredac.active(aValue: boolean)
  : iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.active := aValue;
end;

function TModelCompnentsConnectionsFiredac.addParam(aParam: string;
  aValue: Variant): iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.ParamByName(aParam).Value := aValue;
end;

constructor TModelCompnentsConnectionsFiredac.Create;
begin
  FFDConnection := TFDConnection.Create(nil);
  FFDQuery := TFDQuery.Create(nil);
  FDPhysPgDriverLink := TFDPhysPgDriverLink.Create(nil);
  FFDQuery.Connection := FFDConnection;

  FDPhysPgDriverLink.VendorHome := './';

  FFDConnection.Params.DriverID := 'PG';
  FFDConnection.Params.Database := 'refactor';
  FFDConnection.Params.UserName := 'postgres';
  FFDConnection.Params.Password := 'root';
  FFDConnection.Connected;
end;

function TModelCompnentsConnectionsFiredac.DataSet: TDataSet;
begin
  result := FFDQuery;
end;

destructor TModelCompnentsConnectionsFiredac.Destroy;
begin
  FFDQuery.Free;
  FFDConnection.Free;
  FDPhysPgDriverLink.Free;
  inherited;
end;

function TModelCompnentsConnectionsFiredac.execSql: iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.execSql;
end;

class function TModelCompnentsConnectionsFiredac.New
  : iModelComponentsConnections;
begin
  result := Self.Create;
end;

function TModelCompnentsConnectionsFiredac.open: iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.open;
end;

function TModelCompnentsConnectionsFiredac.sqlAdd(aValue: string)
  : iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.SQL.Add(aValue);
end;

function TModelCompnentsConnectionsFiredac.sqlClear
  : iModelComponentsConnections;
begin
  result := Self;
  FFDQuery.SQL.Clear;
end;

end.
