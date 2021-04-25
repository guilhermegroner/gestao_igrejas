inherited frm1Unidade: Tfrm1Unidade
  Caption = ''
  ClientHeight = 261
  ClientWidth = 591
  ExplicitWidth = 597
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 591
    Height = 261
    ExplicitWidth = 591
    ExplicitHeight = 261
    object lblNome: TLabel [0]
      Left = 6
      Top = 28
      Width = 36
      Height = 13
      Caption = '* Nome'
    end
    object lblCidade: TLabel [1]
      Left = 231
      Top = 74
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblNumero: TLabel [2]
      Left = 6
      Top = 164
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lblEndereco: TLabel [3]
      Left = 6
      Top = 120
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblBairro: TLabel [4]
      Left = 149
      Top = 164
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object lblCep: TLabel [5]
      Left = 402
      Top = 120
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object lblTelefone: TLabel [6]
      Left = 402
      Top = 164
      Width = 45
      Height = 13
      Caption = 'Telefone '
    end
    object lblCnpj: TLabel [7]
      Left = 6
      Top = 74
      Width = 34
      Height = 13
      Caption = '* CNPJ'
    end
    inherited pnlBotton: TPanel
      Top = 220
      Width = 591
      TabOrder = 7
      ExplicitTop = 220
      ExplicitWidth = 591
      inherited btnSalvar: TAdvGlowButton
        Left = 390
        ExplicitLeft = 390
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 490
        ExplicitLeft = 490
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 591
      LabelCaption = '.: Unidade'
      TabOrder = 8
      ExplicitWidth = 591
    end
    object edtNome: TDBEdit
      Left = 6
      Top = 47
      Width = 576
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object cbbCidade: TDBLookupComboBox
      Left = 231
      Top = 93
      Width = 351
      Height = 21
      DataField = 'ID_CIDADE'
      DataSource = ds
      ListSource = dsCidade
      TabOrder = 1
    end
    object edtNumero: TDBEdit
      Left = 6
      Top = 181
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO_NUMERO'
      DataSource = ds
      TabOrder = 4
    end
    object edtEndereco: TDBEdit
      Left = 6
      Top = 137
      Width = 390
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 3
    end
    object edtBairro: TDBEdit
      Left = 149
      Top = 183
      Width = 247
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO_BAIRRO'
      DataSource = ds
      TabOrder = 5
    end
    object edtCep: TDBEdit
      Left = 402
      Top = 137
      Width = 180
      Height = 21
      DataField = 'CEP'
      DataSource = ds
      TabOrder = 2
    end
    object edtTelefone: TDBEdit
      Left = 402
      Top = 181
      Width = 180
      Height = 21
      DataField = 'TELEFONE'
      DataSource = ds
      TabOrder = 6
    end
    object edtCnpj: TDBEdit
      Left = 6
      Top = 93
      Width = 217
      Height = 21
      DataField = 'CNPJ'
      DataSource = ds
      TabOrder = 9
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_UNIDADE'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 224
    Top = 8
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 120
    end
    object cdsCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object cdsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)9999-9999'
      Size = 15
    end
    object cdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object cdsENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999-999'
      Size = 15
    end
    object cdsATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited ds: TDataSource
    Left = 256
    Top = 8
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 456
    Top = 72
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 72
  end
end
