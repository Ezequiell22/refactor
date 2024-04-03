unit refator.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, refactor.model.DAO.categoria, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

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
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure bt_listarClick(Sender: TObject);
    procedure bt_inserirClick(Sender: TObject);
    procedure bt_updateClick(Sender: TObject);
    procedure bt_deletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDAO: TModelDaoCategoria;
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

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   FDAO.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  FDPhysPgDriverLink1.VendorHome := './';
  ReportMemoryLeaksOnShutdown := true;
  FDAO := TModelDaoCategoria.Create(FDConnection1).DataSet(DataSource1)
end;

end.