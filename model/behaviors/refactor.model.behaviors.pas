unit refactor.model.behaviors;

interface

uses
  System.SysUtils,
  vcl.Forms;

type
  TModelBehaviors = class
  private
    procedure behaviorsException(Sender: TObject; E: Exception);
  public
    constructor create;
    destructor destroy; override;

  end;

var
  modelBehaviors: TModelBehaviors;

implementation

uses
  vcl.Dialogs;

{ TModelBehaviors }

procedure TModelBehaviors.behaviorsException(Sender: TObject; E: Exception);
begin
  MessageDlg(E.Message, mtWarning, [MBOk], 0)
end;

constructor TModelBehaviors.create;
begin
  Application.OnException := behaviorsException;
end;

destructor TModelBehaviors.destroy;
begin

  inherited;
end;

initialization

modelBehaviors := TModelBehaviors.create;

finalization

modelBehaviors.Free;

end.
