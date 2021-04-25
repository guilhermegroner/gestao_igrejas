inherited frm1Igreja: Tfrm1Igreja
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
      inherited btnSalvar: TAdvGlowButton
        Left = 179
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 279
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 380
      LabelCaption = '.: Igreja'
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
      OnKeyPress = edtNomeKeyPress
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_IGREJA'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 248
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
  end
  inherited ds: TDataSource
    Left = 280
    Top = 0
  end
end
