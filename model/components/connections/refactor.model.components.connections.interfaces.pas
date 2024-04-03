unit refactor.model.components.connections.interfaces;

interface

  uses data.DB;

type

  iModelComponentsConnections = interface
    ['{813098B1-470E-441C-B244-06361BB4AFF3}']
    function active(aValue: boolean): iModelComponentsConnections;
    function addParam(aParam: string; aValue: Variant)
      : iModelComponentsConnections;
    function DataSet : TDataSet;
    function execSql: iModelComponentsConnections;
    function open: iModelComponentsConnections;
    function sqlClear: iModelComponentsConnections;
    function sqlAdd(aValue: string): iModelComponentsConnections;
  end;

implementation

end.
