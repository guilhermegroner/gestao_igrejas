inherited frm1UnidadeMedida: Tfrm1UnidadeMedida
  Caption = ''
  ClientHeight = 125
  ClientWidth = 449
  ExplicitWidth = 455
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 125
    object lblNome: TLabel [0]
      Left = 8
      Top = 30
      Width = 39
      Height = 13
      Caption = '*  Nome'
    end
    object lblAbreviatura: TLabel [1]
      Left = 383
      Top = 30
      Width = 57
      Height = 13
      Caption = 'Abreviatura'
    end
    inherited pnlBotton: TPanel
      Top = 84
      Width = 449
      inherited btnSalvar: TAdvGlowButton
        Left = 248
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 348
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 449
      LabelCaption = '.: Unidade Medida'
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 48
      Width = 369
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object edtAbreviatura: TDBEdit
      Left = 383
      Top = 48
      Width = 62
      Height = 21
      Hint = 'Exemplo: Caixa = CX'
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ABREVIACAO'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_UNIDADE_MEDIDA'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 184
    Top = 0
    object cdsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 120
    end
    object cdsABREVIACAO: TStringField
      FieldName = 'ABREVIACAO'
      FixedChar = True
      Size = 4
    end
  end
  inherited ds: TDataSource
    Left = 216
    Top = 0
  end
end
