inherited frm1Setor: Tfrm1Setor
  Caption = ''
  ClientHeight = 311
  ClientWidth = 563
  ExplicitWidth = 569
  ExplicitHeight = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 563
    Height = 311
    ExplicitWidth = 563
    ExplicitHeight = 311
    object lblNome: TLabel [0]
      Left = 6
      Top = 32
      Width = 80
      Height = 13
      Caption = '* Nome do Setor'
    end
    object lblCidade: TLabel [1]
      Left = 6
      Top = 80
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblEndereco: TLabel [2]
      Left = 6
      Top = 124
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblNumero: TLabel [3]
      Left = 421
      Top = 124
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lblBairro: TLabel [4]
      Left = 6
      Top = 168
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object lblTelefone: TLabel [5]
      Left = 235
      Top = 168
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    inherited pnlBotton: TPanel
      Top = 270
      Width = 563
      TabOrder = 6
      ExplicitTop = 270
      ExplicitWidth = 563
      inherited btnSalvar: TAdvGlowButton
        Left = 362
        ExplicitLeft = 362
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 462
        ExplicitLeft = 462
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 563
      LabelCaption = '.: Setor'
      TabOrder = 7
      ExplicitWidth = 563
    end
    object edtNome: TDBEdit
      Left = 6
      Top = 49
      Width = 552
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object cbbCidade: TDBLookupComboBox
      Left = 6
      Top = 97
      Width = 515
      Height = 21
      Cursor = crHandPoint
      DataField = 'ID_CIDADE'
      DataSource = ds
      ListSource = dsCidade
      TabOrder = 1
    end
    object edtEndereco: TDBEdit
      Left = 6
      Top = 141
      Width = 409
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = ds
      TabOrder = 2
    end
    object edtNumero: TDBEdit
      Left = 421
      Top = 141
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO_NUMERO'
      DataSource = ds
      TabOrder = 3
    end
    object edtBairro: TDBEdit
      Left = 6
      Top = 184
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO_BAIRRO'
      DataSource = ds
      TabOrder = 4
    end
    object edtTelefone: TDBEdit
      Left = 235
      Top = 184
      Width = 180
      Height = 21
      DataField = 'TELEFONE'
      DataSource = ds
      TabOrder = 5
    end
    object grpRespSetor: TGroupBox
      Left = 0
      Top = 214
      Width = 563
      Height = 56
      Align = alBottom
      TabOrder = 8
      object lblResponsavelSetor: TLabel
        Left = 7
        Top = 6
        Width = 122
        Height = 13
        Caption = '* Respons'#225'vel pelo Setor'
      end
      object lcbResponsavelSetor: TDBLookupComboBox
        Left = 7
        Top = 24
        Width = 552
        Height = 21
        Cursor = crHandPoint
        DataField = 'ID_RESPONSAVEL_ATUAL'
        DataSource = ds
        ListSource = dsRespSetor
        TabOrder = 0
      end
    end
    object btnIncluirCidade: TAdvGlowButton
      Left = 525
      Top = 97
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
      TabOrder = 9
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
    AutoCalcFields = False
    ProviderName = 'DSP_SETOR'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 416
    Top = 0
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
    object cdsENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 240
    end
    object cdsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999'
      Size = 60
    end
    object cdsID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
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
    object cdsID_RESPONSAVEL_ATUAL: TIntegerField
      FieldName = 'ID_RESPONSAVEL_ATUAL'
    end
  end
  inherited ds: TDataSource
    Left = 448
    Top = 0
  end
  object cdsRespSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 176
  end
  object dsRespSetor: TDataSource
    DataSet = cdsRespSetor
    Left = 448
    Top = 176
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 120
    Top = 88
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 88
  end
end
