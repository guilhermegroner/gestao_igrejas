inherited frm1Fornecedor: Tfrm1Fornecedor
  Caption = ''
  ClientHeight = 432
  ClientWidth = 566
  ExplicitWidth = 572
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 566
    Height = 432
    ExplicitWidth = 566
    ExplicitHeight = 432
    object lblObservacao: TLabel [0]
      Left = 8
      Top = 294
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object lblCelular: TLabel [1]
      Left = 8
      Top = 251
      Width = 33
      Height = 13
      Caption = 'Celular'
    end
    object lblEmail: TLabel [2]
      Left = 173
      Top = 251
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblBairro: TLabel [3]
      Left = 8
      Top = 208
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object lblEndereco: TLabel [4]
      Left = 8
      Top = 164
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblCidade: TLabel [5]
      Left = 8
      Top = 119
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblCnpj: TLabel [6]
      Left = 8
      Top = 75
      Width = 34
      Height = 13
      Caption = '* CNPJ'
    end
    object lblCep: TLabel [7]
      Left = 232
      Top = 75
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object lblNome: TLabel [8]
      Left = 8
      Top = 32
      Width = 36
      Height = 13
      Caption = '* Nome'
    end
    object lblTelefone1: TLabel [9]
      Left = 237
      Top = 208
      Width = 51
      Height = 13
      Caption = 'Telefone 1'
    end
    object lblTelefone2: TLabel [10]
      Left = 401
      Top = 208
      Width = 51
      Height = 13
      Caption = 'Telefone 2'
    end
    object lblNumero: TLabel [11]
      Left = 423
      Top = 164
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    inherited pnlBotton: TPanel
      Top = 391
      Width = 566
      TabOrder = 12
      ExplicitTop = 391
      ExplicitWidth = 566
      inherited btnSalvar: TAdvGlowButton
        Left = 365
        ExplicitLeft = 365
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 465
        ExplicitLeft = 465
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 566
      LabelCaption = '.: Fornecedor'
      TabOrder = 13
      ExplicitWidth = 566
    end
    object mmoObservacao: TDBMemo
      Left = 8
      Top = 312
      Width = 552
      Height = 73
      DataField = 'OBSERVACAO'
      DataSource = ds
      TabOrder = 11
    end
    object edtCelular: TDBEdit
      Left = 8
      Top = 267
      Width = 159
      Height = 21
      DataField = 'CELULAR'
      DataSource = ds
      TabOrder = 9
    end
    object edtEmail: TDBEdit
      Left = 173
      Top = 267
      Width = 387
      Height = 21
      CharCase = ecLowerCase
      DataField = 'EMAIL'
      DataSource = ds
      TabOrder = 10
    end
    object edtBairro: TDBEdit
      Left = 8
      Top = 224
      Width = 223
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO_BAIRRO'
      DataSource = ds
      TabOrder = 6
    end
    object edtEndereco: TDBEdit
      Left = 8
      Top = 181
      Width = 409
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 4
    end
    object cbbCidade: TDBLookupComboBox
      Left = 8
      Top = 136
      Width = 517
      Height = 21
      Cursor = crHandPoint
      DataField = 'ID_CIDADE'
      DataSource = ds
      ListSource = dsCidade
      TabOrder = 3
    end
    object edtCnpj: TDBEdit
      Left = 8
      Top = 92
      Width = 217
      Height = 21
      DataField = 'CNPJ'
      DataSource = ds
      TabOrder = 1
    end
    object edtCep: TDBEdit
      Left = 232
      Top = 92
      Width = 183
      Height = 21
      DataField = 'CEP'
      DataSource = ds
      TabOrder = 2
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 49
      Width = 552
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object edtTelefone: TDBEdit
      Left = 237
      Top = 224
      Width = 159
      Height = 21
      DataField = 'TELEFONE1'
      DataSource = ds
      TabOrder = 7
    end
    object edtTelefone2: TDBEdit
      Left = 401
      Top = 224
      Width = 159
      Height = 21
      DataField = 'TELEFONE2'
      DataSource = ds
      TabOrder = 8
    end
    object edtNumero: TDBEdit
      Left = 423
      Top = 181
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ENDERECO_NUMERO'
      DataSource = ds
      TabOrder = 5
    end
    object btnIncluirCidade: TAdvGlowButton
      Left = 527
      Top = 136
      Width = 33
      Height = 21
      Hint = 'Incluir Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000473424954080808087C086488000000097048597300000B1300000B
        1301009A9C18000001C349444154388DA5533B4B5C41183DDFCCDEF5B158081A
        443008E2AB308FDD5416E96C6C942C621A89C1269DC447A5100B8B588810315D
        50CB80B2B885BF41512C12D1F828522A491412AEBB7BE7CE7C16CB9DDD9BBDD9
        26A71898F39D39E730C300FF098A221FEF4F3E31420C13A10BC630049D1B3299
        E3D4872F550D5287534D9ED69B24C560641C73D657F4FAA47FE5A6C2207538D5
        A4D83F02C9B66A950DF377AAA94D7E7DF4FE16004430C82BB5FDF7E1770F4630
        DF9C0E1908A276E4729FED1E00927BD329E9C49E5734F60DD837152D488A81BE
        83B77DD6C05385996AB5A3C09E9A06801800B0A06430586819B5A2DE786B91AB
        29710B57B6FD336B406C6A03D673F3A514076036212E8061D4951A68F30BC043
        0058BCDE2AA5C55E42B30E71A2DE010090323FAD81CEEB5D99C0D3724151555C
        425CD020A7B240F08C6E6EC5770BBA42F50FA83F057557F0D66C0600746727E6
        E2CD894572A415EADF798000D960AF08EC69783FDC99B3A14FCB210330A82B3B
        FED1694CBC91F5F1C864ED7AD0B777ABDF86D62741E0B041D024F32A4D522E89
        44BC8362020482511ACA5517A4F5ECF98B8D9D727DE46F04837A32639D4CB29B
        98980C9F9DA6372E83D472DC03FF09AAC657E8F5DF0000000049454E44AE4260
        82}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = btnIncluirCidadeClick
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_FORNECEDOR'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 248
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
      Required = True
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object cdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 120
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
    object cdsTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999'
      Size = 15
    end
    object cdsTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999'
      Size = 15
    end
    object cdsCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 99999-9999'
      Size = 15
    end
    object cdsEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
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
    object cdsENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  inherited ds: TDataSource
    Left = 280
    Top = 8
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 120
    Top = 120
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 120
  end
end
