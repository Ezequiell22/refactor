program refactor;

uses
  Vcl.Forms,
  refator.view.principal in 'view\refator.view.principal.pas' {Form1},
  refactor.model.entity.categoria in 'model\entity\refactor.model.entity.categoria.pas',
  refactor.model.DAO.categoria in 'model\DAO\refactor.model.DAO.categoria.pas',
  refactor.model.behaviors in 'model\behaviors\refactor.model.behaviors.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
