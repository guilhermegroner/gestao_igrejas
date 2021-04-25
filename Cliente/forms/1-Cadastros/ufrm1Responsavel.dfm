inherited frm1Responsavel: Tfrm1Responsavel
  Caption = ''
  ClientHeight = 263
  ClientWidth = 567
  ExplicitWidth = 573
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    Height = 263
    ExplicitWidth = 567
    ExplicitHeight = 252
    object lblNome: TLabel [0]
      Left = 8
      Top = 32
      Width = 36
      Height = 13
      Caption = '* Nome'
    end
    object lblCpf: TLabel [1]
      Left = 376
      Top = 32
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblTelefone: TLabel [2]
      Left = 8
      Top = 79
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object lblCelular: TLabel [3]
      Left = 216
      Top = 79
      Width = 33
      Height = 13
      Caption = 'Celular'
    end
    object lblEndereco: TLabel [4]
      Left = 8
      Top = 124
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblNumero: TLabel [5]
      Left = 424
      Top = 124
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lblEnderecoBairro: TLabel [6]
      Left = 8
      Top = 170
      Width = 76
      Height = 13
      Caption = 'Endere'#231'o Bairro'
    end
    inherited pnlBotton: TPanel
      Top = 222
      Width = 567
      ExplicitTop = 211
      ExplicitWidth = 567
      inherited btnSalvar: TAdvGlowButton
        Left = 366
        ExplicitLeft = 366
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 466
        ExplicitLeft = 466
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 567
      LabelCaption = '.: Respons'#225'vel'
      ExplicitWidth = 567
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 51
      Width = 361
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object edtCpf: TDBEdit
      Left = 376
      Top = 51
      Width = 185
      Height = 21
      Color = clWhite
      DataField = 'CPF'
      DataSource = ds
      TabOrder = 3
    end
    object edtTelefone: TDBEdit
      Left = 8
      Top = 96
      Width = 201
      Height = 21
      Color = clWhite
      DataField = 'TELEFONE'
      DataSource = ds
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 216
      Top = 96
      Width = 201
      Height = 21
      Color = clWhite
      DataField = 'CELULAR'
      DataSource = ds
      TabOrder = 5
    end
    object edtEndereco: TDBEdit
      Left = 8
      Top = 141
      Width = 409
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 6
    end
    object edtNumero: TDBEdit
      Left = 424
      Top = 141
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ENDERECO_NUMERO'
      DataSource = ds
      TabOrder = 7
    end
    object edtEnderecoBairro: TDBEdit
      Left = 8
      Top = 187
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ENDERECO_BAIRRO'
      DataSource = ds
      TabOrder = 8
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_RESPONSAVEL'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 152
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
      Size = 480
    end
    object cdsCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99'
      Size = 56
    end
    object cdsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999'
      Size = 60
    end
    object cdsCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 99999-9999'
      Size = 60
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 480
    end
    object cdsENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsSETOR: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SETOR'
      Size = 120
    end
    object cdsDATA_NOMEACAO: TDateField
      FieldKind = fkInternalCalc
      FieldName = 'DATA_NOMEACAO'
    end
  end
  inherited ds: TDataSource
    Left = 184
    Top = 8
  end
end
