object SM: TSM
  OldCreateOrder = False
  Height = 482
  Width = 1037
  object DSP_USUARIO: TDataSetProvider
    DataSet = TBL_USUARIO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 55
  end
  object TBL_USUARIO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_USUARIO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 32
    Top = 8
  end
  object DSP_CATEGORIA: TDataSetProvider
    DataSet = TBL_CATEGORIA
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 32
    Top = 159
  end
  object TBL_CATEGORIA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_CATEGORIA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 32
    Top = 112
  end
  object DSP_SETOR: TDataSetProvider
    DataSet = TBL_SETOR
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 55
  end
  object TBL_SETOR: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_SETOR WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 120
    Top = 8
  end
  object DSP_RESPONSAVEL: TDataSetProvider
    DataSet = TBL_RESPONSAVEL
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 128
    Top = 159
  end
  object TBL_RESPONSAVEL: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_RESPONSAVEL WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 128
    Top = 112
  end
  object DSP_FORNECEDOR: TDataSetProvider
    DataSet = TBL_FORNECEDOR
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 55
  end
  object TBL_FORNECEDOR: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_FORNECEDOR WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 200
    Top = 8
  end
  object DSP_PATRIMONIO: TDataSetProvider
    DataSet = TBL_PATRIMONIO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 228
    Top = 160
  end
  object TBL_PATRIMONIO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PATRIMONIO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 228
    Top = 113
  end
  object DSP_UNIDADE: TDataSetProvider
    DataSet = TBL_UNIDADE
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 299
    Top = 56
  end
  object TBL_UNIDADE: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_UNIDADE WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 299
    Top = 9
  end
  object DSP_GRUPO: TDataSetProvider
    DataSet = TBL_GRUPO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 20
    Top = 283
  end
  object TBL_GRUPO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PAST_GRUPO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 20
    Top = 236
  end
  object DSP_PASTOR: TDataSetProvider
    DataSet = TBL_PASTOR
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 90
    Top = 283
  end
  object TBL_PASTOR: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PAST_PASTOR WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 90
    Top = 236
  end
  object DSP_IGREJA: TDataSetProvider
    DataSet = TBL_IGREJA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 160
    Top = 283
  end
  object TBL_IGREJA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PAST_IGREJA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 160
    Top = 236
  end
  object DSP_MEMBRO: TDataSetProvider
    DataSet = TBL_MEMBRO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 231
    Top = 283
  end
  object TBL_MEMBRO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PAST_MEMBRO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 231
    Top = 236
  end
  object DSP_PROFISSAO: TDataSetProvider
    DataSet = TBL_PROFISSAO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 31
    Top = 379
  end
  object TBL_PROFISSAO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_PROFISSAO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 31
    Top = 336
  end
  object DSP_CIDADE: TDataSetProvider
    DataSet = TBL_CIDADE
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 109
    Top = 379
  end
  object TBL_CIDADE: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_CIDADE WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 109
    Top = 336
  end
  object DSP_FUNCAO: TDataSetProvider
    DataSet = TB_FUNCAO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 180
    Top = 379
  end
  object TB_FUNCAO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_FUNCAO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 180
    Top = 336
  end
  object DSP_UNIDADE_MEDIDA: TDataSetProvider
    DataSet = TBL_UNIDADE_MEDIDA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 495
    Top = 51
  end
  object TBL_UNIDADE_MEDIDA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_UNIDADE_MEDIDA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 495
    Top = 4
  end
  object DSP_EST_GRUPO: TDataSetProvider
    DataSet = TBL_EST_GRUPO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 495
    Top = 147
  end
  object TBL_EST_GRUPO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_GRUPO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 495
    Top = 100
  end
  object DSP_EST_PRODUTO: TDataSetProvider
    DataSet = TBL_EST_PRODUTO
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 607
    Top = 51
  end
  object TBL_EST_PRODUTO: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_PRODUTO WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 605
    Top = 4
  end
  object DSP_EST_ENTRADA: TDataSetProvider
    DataSet = TBL_EST_ENTRADA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 495
    Top = 251
  end
  object TBL_EST_ENTRADA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_ENTRADA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 495
    Top = 204
  end
  object DSP_EST_IENTRADA: TDataSetProvider
    DataSet = TBL_EST_IENTRADA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 607
    Top = 251
  end
  object TBL_EST_IENTRADA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_ITENS_ENTRADA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 607
    Top = 204
  end
  object DSP_EST_SAIDA: TDataSetProvider
    DataSet = TBL_EST_SAIDA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 591
    Top = 147
  end
  object TBL_EST_SAIDA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_SAIDA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 591
    Top = 100
  end
  object DSP_EST_ISAIDA: TDataSetProvider
    DataSet = TBL_EST_ISAIDA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 685
    Top = 147
  end
  object TBL_EST_ISAIDA: TSQLQuery
    GetMetadata = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TBL_EST_ITENS_SAIDA WHERE ID = -1')
    SQLConnection = frmPrincipalServidor.Conn
    Left = 685
    Top = 100
  end
end
