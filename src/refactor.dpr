program refactor;

uses
  Vcl.Forms,
  refator.view.principal in 'view\refator.view.principal.pas' {Form1},
  refactor.model.entity.categoria in 'model\entity\refactor.model.entity.categoria.pas',
  refactor.model.DAO.categoria in 'model\DAO\refactor.model.DAO.categoria.pas',
  refactor.model.behaviors in 'model\behaviors\refactor.model.behaviors.pas',
  refactor.model.components.connections.interfaces in 'model\components\connections\refactor.model.components.connections.interfaces.pas',
  refactor.model.components.connections.firedac in 'model\components\connections\refactor.model.components.connections.firedac.pas',
  refactor.model.DAO.interfaces in 'model\DAO\refactor.model.DAO.interfaces.pas',
  refactor.model.entity.user in 'model\entity\refactor.model.entity.user.pas',
  refactor.model.DAO.user in 'model\DAO\refactor.model.DAO.user.pas',
  refactor.controller.interfaces in 'controller\refactor.controller.interfaces.pas',
  refactor.controller in 'controller\refactor.controller.pas',
  refactor.controller.entity in 'controller\refactor.controller.entity.pas',
  refactor.controller.service in 'controller\refactor.controller.service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
