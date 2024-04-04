unit refactor.controller.interfaces;

interface

uses
  refactor.model.DAO.interfaces,
  refactor.model.entity.categoria,
  refactor.model.entity.user;

type
  iControllerEntity = interface;
  iControllerService = interface;

  iController = interface
    ['{7C276AC1-0385-4CFE-8395-319A67F573E2}']
    function entity: iControllerEntity;
    function service : iControllerService;
  end;

  iControllerEntity = interface
    ['{9EDCA6E3-A329-454A-8755-67C9919C0B29}']
    function categoria: iModelDAOEntity<TCategoria>;
    function user: iModelDAOEntity<TUser>;
  end;

  iControllerServiceGeneric = interface
    ['{FE50C75C-9793-499B-B468-381D3703AFFB}']
    function consultar: iControllerServiceGeneric;
    function enviar: iControllerServiceGeneric;
  end;

  iControllerService = interface
    ['{D64C6AAD-C4A3-46BC-BBE4-3CF753379DA5}']
    function mercadolivre: iControllerServiceGeneric;
    function nfse: iControllerServiceGeneric;
  end;

implementation

end.
