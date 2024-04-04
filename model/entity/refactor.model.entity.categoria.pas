unit refactor.model.entity.categoria;

interface

uses
  refactor.model.DAO.interfaces;

type
  TCategoria = class
  private
    [weak]
    FParent: iModelDAOEntity<TCategoria>;
    FDescricao: string;
    FID: INTEGER;
  public
    constructor Create(aParent: iModelDAOEntity<TCategoria>);
    destructor Destroy; override;
    function id(aValue: INTEGER): TCategoria; overload;
    function id: INTEGER; overload;
    function Descricao(aValue: string): TCategoria; overload;
    function Descricao: string; overload;
    function &End: iModelDAOEntity<TCategoria>;
  end;

implementation

uses
  System.SysUtils;

{ TCategoria }

function TCategoria.&End: iModelDAOEntity<TCategoria>;
begin
  result := FParent;
end;

constructor TCategoria.Create(aParent: iModelDAOEntity<TCategoria>);
begin
  FParent := aParent;
end;

function TCategoria.Descricao(aValue: string): TCategoria;
begin
  result := self;
  FDescricao := aValue;
end;

function TCategoria.Descricao: string;
begin
  if Trim(FDescricao) = '' then
    raise Exception.Create('Descrição vazia');

  result := FDescricao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.id(aValue: INTEGER): TCategoria;
begin
  result := self;
  FID := aValue;
end;

function TCategoria.id: INTEGER;
begin
  result := FID;
end;

end.
