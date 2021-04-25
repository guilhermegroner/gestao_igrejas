inherited frm1Cidade: Tfrm1Cidade
  Caption = ''
  ClientHeight = 125
  ClientWidth = 454
  ExplicitWidth = 460
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 454
    Height = 125
    object lblNome: TLabel [0]
      Left = 8
      Top = 30
      Width = 39
      Height = 13
      Caption = '*  Nome'
    end
    object lblUF: TLabel [1]
      Left = 381
      Top = 30
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    inherited pnlBotton: TPanel
      Top = 84
      Width = 454
      inherited btnSalvar: TAdvGlowButton
        Left = 253
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 353
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 454
      LabelCaption = '.: Cidade'
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
    object cbbUF: TDBComboBox
      Left = 381
      Top = 48
      Width = 69
      Height = 21
      Style = csDropDownList
      DataField = 'UF'
      DataSource = ds
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO'
        'EX')
      TabOrder = 3
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_CIDADE'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 192
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
    object cdsUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  inherited ds: TDataSource
    Left = 224
    Top = 0
  end
end
