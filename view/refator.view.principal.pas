unit refator.view.principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  refactor.model.DAO.categoria,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  refactor.model.DAO.interfaces,
  refactor.model.entity.categoria;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    bt_listar: TButton;
    bt_update: TButton;
    bt_deletar: TButton;
    bt_inserir: TButton;
    edt_id: TEdit;
    edt_descricao: TEdit;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bt_listarClick(Sender: TObject);
    procedure bt_inserirClick(Sender: TObject);
    procedure bt_updateClick(Sender: TObject);
    procedure bt_deletarClick(Sender: TObject);
  private
    { Private declarations }
    FDAO: iModelDAOEntity<TCategoria>;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bt_deletarClick(Sender: TObject);
begin
  FDAO.This.ID := DataSource1.DataSet.FieldByName('id').AsInteger;
  FDAO.Delete;
  FDAO.Get;
end;

procedure TForm1.bt_inserirClick(Sender: TObject);
begin
  FDAO.This.ID := strToint(edt_id.Text);
  FDAO.This.Descricao := edt_descricao.Text;
  FDAO.Insert;
  FDAO.Get;
end;

procedure TForm1.bt_listarClick(Sender: TObject);
begin
  FDAO.Get;
end;

procedure TForm1.bt_updateClick(Sender: TObject);
begin
  FDAO.This.ID := DataSource1.DataSet.FieldByName('id').AsInteger;
  FDAO.This.Descricao := edt_descricao.Text;
  FDAO.Update;
  FDAO.Get;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  FDAO := TModelDaoCategoria.New.DataSet(DataSource1)
end;

end.
