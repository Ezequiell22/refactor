unit refactor.controller;

interface

uses
  refactor.controller.interfaces;

type
  TController = class(TInterfacedobject, iController)
  private
    FEntity: iControllerEntity;
    FService : IControllerService;
  public
    constructor create;
    destructor destroy; override;
    class function New: iController;
    function entity: iControllerEntity;
    function service : iControllerService;
  end;

implementation

uses
  refactor.model.DAO.categoria, refactor.model.DAO.user,
  refactor.controller.entity, refactor.controller.service;

{ TController }

constructor TController.create;
begin

end;

destructor TController.destroy;
begin

  inherited;
end;

function TController.entity: iControllerEntity;
begin
  if not Assigned(FEntity) then
    FEntity := TcontrollerEntity.New;

  result := FEntity;
end;

class function TController.New: iController;
begin
  result := self.create
end;

function TController.service: iControllerService;
begin
     if not Assigned(FService) then
      FService := TcontrollerService.New;

  result := FService;
end;

end.
