inherited frm1Patrimonio: Tfrm1Patrimonio
  Caption = ''
  ClientHeight = 405
  ClientWidth = 632
  ExplicitWidth = 638
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    Height = 405
    ExplicitWidth = 632
    ExplicitHeight = 405
    object lblSetor: TLabel [0]
      Left = 6
      Top = 30
      Width = 35
      Height = 13
      Caption = '* Setor'
    end
    object lblNumeroPatrimonio: TLabel [1]
      Left = 6
      Top = 79
      Width = 131
      Height = 13
      Caption = '* N'#250'mera'#231#227'o do Patrimonio'
    end
    object lblNome: TLabel [2]
      Left = 244
      Top = 79
      Width = 104
      Height = 13
      Caption = '* Nome do Patrimonio'
    end
    object lblMarca: TLabel [3]
      Left = 6
      Top = 127
      Width = 29
      Height = 13
      Caption = 'Marca'
    end
    object lblTipoAquisicao: TLabel [4]
      Left = 244
      Top = 127
      Width = 83
      Height = 13
      Caption = 'Tipo de Aquisi'#231#227'o'
    end
    object lblEstado: TLabel [5]
      Left = 437
      Top = 127
      Width = 42
      Height = 13
      Caption = '* Estado'
    end
    object lblFornecedor: TLabel [6]
      Left = 6
      Top = 174
      Width = 64
      Height = 13
      Caption = '* Fornecedor'
    end
    object Label1: TLabel [7]
      Left = 389
      Top = 174
      Width = 67
      Height = 13
      Caption = 'N'#186' Nota Fiscal'
    end
    object lblCategoria: TLabel [8]
      Left = 6
      Top = 220
      Width = 56
      Height = 13
      Caption = '* Categoria'
    end
    object lblDataAquisicao: TLabel [9]
      Left = 210
      Top = 220
      Width = 71
      Height = 13
      Caption = 'Data Aquisi'#231#227'o'
    end
    object lblDataImplantacao: TLabel [10]
      Left = 350
      Top = 220
      Width = 109
      Height = 13
      Caption = '* Data de Implanta'#231#227'o'
    end
    object lblDataFinalGarantia: TLabel [11]
      Left = 490
      Top = 220
      Width = 107
      Height = 13
      Caption = 'Data Final da Garantia'
    end
    object lblObservacao: TLabel [12]
      Left = 6
      Top = 266
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    inherited pnlBotton: TPanel
      Top = 364
      Width = 632
      TabOrder = 13
      ExplicitTop = 364
      ExplicitWidth = 632
      inherited btnSalvar: TAdvGlowButton
        Left = 431
        ExplicitLeft = 431
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 531
        ExplicitLeft = 531
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 632
      LabelCaption = '.: Patrim'#244'nio'
      TabOrder = 14
      ExplicitWidth = 632
    end
    object lcbSetor: TDBLookupComboBox
      Left = 6
      Top = 48
      Width = 313
      Height = 21
      Cursor = crHandPoint
      DataField = 'ID_SETOR'
      DataSource = ds
      ListSource = dsSetor
      TabOrder = 0
    end
    object edtNumeroPatrimonio: TDBEdit
      Left = 6
      Top = 96
      Width = 232
      Height = 21
      DataField = 'NUMERO_PATRIMONIO'
      DataSource = ds
      TabOrder = 1
      OnExit = edtNumeroPatrimonioExit
    end
    object edtNome: TDBEdit
      Left = 244
      Top = 96
      Width = 380
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object edtMarca: TDBEdit
      Left = 6
      Top = 144
      Width = 232
      Height = 21
      CharCase = ecUpperCase
      DataField = 'MARCA'
      DataSource = ds
      TabOrder = 3
    end
    object lcbFornecedor: TDBLookupComboBox
      Left = 6
      Top = 192
      Width = 377
      Height = 21
      Cursor = crHandPoint
      DataField = 'ID_FORNECEDOR'
      DataSource = ds
      ListSource = dsFornecedor
      TabOrder = 6
    end
    object edtNumeroNotaFiscal: TDBEdit
      Left = 389
      Top = 192
      Width = 235
      Height = 21
      DataField = 'NUMERO_NOTA_FISCAL'
      DataSource = ds
      TabOrder = 7
    end
    object lcbCategoria: TDBLookupComboBox
      Left = 6
      Top = 237
      Width = 198
      Height = 21
      Cursor = crHandPoint
      DataField = 'ID_CATEGORIA'
      DataSource = ds
      ListSource = dsCategoria
      TabOrder = 8
    end
    object mmoObservacao: TDBMemo
      Left = 6
      Top = 284
      Width = 618
      Height = 73
      DataField = 'OBSERVACOES'
      DataSource = ds
      TabOrder = 12
    end
    object edtDataImplantacao: TJvDBDateEdit
      Left = 350
      Top = 237
      Width = 132
      Height = 21
      DataField = 'DATA_IMPLANTACAO'
      DataSource = ds
      DialogTitle = 'Selecione uma Data'
      ShowNullDate = False
      TabOrder = 10
    end
    object edtDataAquisicao: TJvDBDateEdit
      Left = 210
      Top = 237
      Width = 134
      Height = 21
      DataField = 'DATA_AQUISICAO'
      DataSource = ds
      DialogTitle = 'Selecione uma Data'
      ShowNullDate = False
      TabOrder = 9
    end
    object edtDataFinalGarantia: TJvDBDateEdit
      Left = 490
      Top = 237
      Width = 134
      Height = 21
      DataField = 'DATA_FINAL_GARANTIA'
      DataSource = ds
      DialogTitle = 'Selecione uma Data'
      ShowNullDate = False
      TabOrder = 11
    end
    object cbbTipoAquisicao: TJvDBComboBox
      Left = 244
      Top = 144
      Width = 187
      Height = 21
      DataField = 'TIPO_AQUISICAO'
      DataSource = ds
      Items.Strings = (
        'Comprado'
        'Doa'#231#227'o')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object cbbEstadoPatrimonio: TJvDBComboBox
      Left = 440
      Top = 144
      Width = 184
      Height = 21
      DataField = 'ESTADO'
      DataSource = ds
      Items.Strings = (
        'Novo'
        'Bom'
        'Regular')
      TabOrder = 5
      Values.Strings = (
        '0'
        '1'
        '2')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object grpSituacao: TGroupBox
      Left = 325
      Top = 28
      Width = 299
      Height = 41
      Caption = 'Situa'#231#227'o do Patrim'#244'nio'
      TabOrder = 15
      object rpSituacao: TJvDBRadioPanel
        Left = 2
        Top = 15
        Width = 295
        Height = 24
        Align = alClient
        BevelOuter = bvNone
        Columns = 3
        DataField = 'SITUACAO'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Baixado'
          'Ativo'
          'Transferido')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1'
          '2')
      end
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_PATRIMONIO'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 72
    Top = 8
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNUMERO_PATRIMONIO: TIntegerField
      FieldName = 'NUMERO_PATRIMONIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 120
    end
    object cdsTIPO_AQUISICAO: TIntegerField
      FieldName = 'TIPO_AQUISICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object cdsESTADO: TIntegerField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDATA_AQUISICAO: TDateField
      FieldName = 'DATA_AQUISICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsDATA_IMPLANTACAO: TDateField
      FieldName = 'DATA_IMPLANTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsDATA_FINAL_GARANTIA: TDateField
      FieldName = 'DATA_FINAL_GARANTIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOBSERVACOES: TBlobField
      FieldName = 'OBSERVACOES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object cdsNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object cdsDATA_BAIXA: TDateField
      FieldName = 'DATA_BAIXA'
    end
  end
  inherited ds: TDataSource
    Left = 104
    Top = 8
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 24
  end
  object dsSetor: TDataSource
    DataSet = cdsSetor
    Left = 216
    Top = 24
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 238
    Top = 169
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 318
    Top = 169
  end
  object cdsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 224
  end
  object dsCategoria: TDataSource
    DataSet = cdsCategoria
    Left = 152
    Top = 224
  end
end
