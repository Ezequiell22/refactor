unit refactor.model.entity.categoria;

interface

type
  TCategoria = class
  private
    FDescricao: string;
    FID: INTEGER;
    function getDescricao: string;
    function getId: INTEGER;
  public
    constructor Create;
    destructor Destroy; override;
    property ID : integer read getId write FId;
    property Descricao : string read getDescricao write FDescricao;
  end;

implementation

uses
  System.SysUtils;

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.getDescricao: string;
begin

  if Trim(FDescricao) = '' then
    raise Exception.Create('Descrição vazia');

  result := FDescricao;
end;

function TCategoria.getId: INTEGER;
begin

  result := FID;

end;

end.
