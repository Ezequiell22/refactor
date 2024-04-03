unit refactor.model.DAO.interfaces;

interface

uses
  Data.DB;

type
  iModelDAOEntity<t> = interface
    ['{20C172F2-01EA-4515-93CD-1740F4767933}']
    function Delete: iModelDAOEntity<t>;
    function DataSet(AValue: TDataSource): iModelDAOEntity<t>;
    function Get: iModelDAOEntity<t>;
    function Insert: iModelDAOEntity<t>;
    function This: t;
    function Update: iModelDAOEntity<t>;

  end;

implementation

end.
