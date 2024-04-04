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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  refactor.controller.interfaces;

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
    Fcontroller: iController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  refactor.controller;

{$R *.dfm}

procedure TForm1.bt_deletarClick(Sender: TObject);
begin
  Fcontroller
    .entity
      .categoria
        .This
          .ID(DataSource1.DataSet.FieldByName('id').AsInteger)
        .&End
      .Delete
      .Get;
end;

procedure TForm1.bt_inserirClick(Sender: TObject);
begin
  Fcontroller
  .entity
  .categoria.This.ID(strToint(edt_id.Text))
    .Descricao(edt_descricao.Text).&End.Insert.Get;
end;

procedure TForm1.bt_listarClick(Sender: TObject);
begin
  Fcontroller.entity.categoria.Get;
end;

procedure TForm1.bt_updateClick(Sender: TObject);
begin
  Fcontroller
    .entity
      .categoria
        .This
          .ID(DataSource1.DataSet.FieldByName('id').AsInteger)
          .Descricao(edt_descricao.Text)
        .&End
      .Update
      .Get;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Fcontroller := tController.new;
  Fcontroller.entity.categoria.DataSet(DataSource1)
end;

end.
