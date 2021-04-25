inherited frm1Categoria: Tfrm1Categoria
  Caption = ''
  ClientHeight = 125
  ClientWidth = 380
  ExplicitWidth = 386
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 380
    Height = 125
    ExplicitWidth = 380
    ExplicitHeight = 125
    object lblNome: TLabel [0]
      Left = 8
      Top = 30
      Width = 39
      Height = 13
      Caption = '*  Nome'
    end
    inherited pnlBotton: TPanel
      Top = 84
      Width = 380
      TabOrder = 1
      ExplicitTop = 84
      ExplicitWidth = 380
      inherited btnSalvar: TAdvGlowButton
        Left = 179
        ExplicitLeft = 179
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 279
        ExplicitLeft = 279
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 380
      LabelCaption = '.: Categoria'
      TabOrder = 2
      ExplicitWidth = 380
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
      TabOrder = 0
      OnKeyPress = edtNomeKeyPress
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_CATEGORIA'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 184
    Top = 65534
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
  end
  inherited ds: TDataSource
    Left = 216
    Top = 65534
  end
end
