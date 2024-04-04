unit refactor.model.behaviors;

interface

uses
  System.SysUtils,
  vcl.Forms,
  vcl.Dialogs,
  System.UITypes;

type
  TModelBehaviors = class
  private
    procedure behaviorsException(Sender: TObject; E: Exception);
  public
    constructor create;
  end;

var
  modelBehaviors: TModelBehaviors;

implementation

{ TModelBehaviors }

procedure TModelBehaviors.behaviorsException(Sender: TObject; E: Exception);
begin
  MessageDlg(E.Message, mtWarning, [MBOk], 0)
end;

constructor TModelBehaviors.create;
begin
  ReportMemoryLeaksOnShutdown := true;
  Application.OnException := behaviorsException;
end;

initialization

modelBehaviors := TModelBehaviors.create;

finalization

modelBehaviors.Free;

end.
