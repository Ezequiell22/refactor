object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 301
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 21
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 80
    Top = 67
    Width = 45
    Height = 13
    Caption = 'descricao'
  end
  object DBGrid1: TDBGrid
    Left = 376
    Top = 16
    Width = 456
    Height = 242
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object bt_listar: TButton
    Left = 757
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = bt_listarClick
  end
  object bt_update: TButton
    Left = 676
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 2
    OnClick = bt_updateClick
  end
  object bt_deletar: TButton
    Left = 595
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 3
    OnClick = bt_deletarClick
  end
  object bt_inserir: TButton
    Left = 126
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = bt_inserirClick
  end
  object edt_id: TEdit
    Left = 80
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edt_descricao: TEdit
    Left = 80
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object DataSource1: TDataSource
    Left = 608
    Top = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=refactor'
      'User_Name=postgres'
      'Password=root'
      'DriverID=PG')
    LoginPrompt = False
    Left = 240
    Top = 136
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\repositorios\REFACTOR\Win32\Debug'
    Left = 240
    Top = 192
  end
end