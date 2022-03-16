object frmDados: TfrmDados
  OldCreateOrder = False
  Height = 460
  Width = 845
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    Left = 80
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = '01001000/json/'
    Response = RESTResponse1
    Left = 160
    Top = 16
  end
  object RESTResponse1: TRESTResponse
    Left = 224
    Top = 16
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = CEPTable
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 288
    Top = 16
  end
  object CEPTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 392
    Top = 16
  end
  object qGeral: TFDQuery
    Left = 168
    Top = 88
  end
  object dsqGeral: TDataSource
    DataSet = qGeral
    Left = 240
    Top = 88
  end
end
