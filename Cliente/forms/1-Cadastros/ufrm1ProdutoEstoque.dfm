inherited frm1ProdutoEstoque: Tfrm1ProdutoEstoque
  Caption = ''
  ClientHeight = 170
  ClientWidth = 486
  ExplicitWidth = 492
  ExplicitHeight = 199
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    Height = 170
    ExplicitWidth = 486
    ExplicitHeight = 170
    object lblNome: TLabel [0]
      Left = 8
      Top = 30
      Width = 39
      Height = 13
      Caption = '*  Nome'
    end
    object lblUnidadeMedida: TLabel [1]
      Left = 8
      Top = 75
      Width = 91
      Height = 13
      Caption = 'Unidade de Medida'
    end
    object lblGrupo: TLabel [2]
      Left = 237
      Top = 75
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object lblQtdeMinima: TLabel [3]
      Left = 400
      Top = 30
      Width = 59
      Height = 13
      Caption = 'Qtde M'#237'nima'
    end
    inherited pnlBotton: TPanel
      Top = 129
      Width = 486
      TabOrder = 4
      ExplicitTop = 129
      ExplicitWidth = 486
      inherited btnSalvar: TAdvGlowButton
        Left = 285
        ExplicitLeft = 285
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 385
        ExplicitLeft = 385
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 486
      LabelCaption = '.: Produto'
      TabOrder = 5
      ExplicitWidth = 486
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 48
      Width = 386
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object lcbUnidadeMedida: TDBLookupComboBox
      Left = 8
      Top = 92
      Width = 185
      Height = 21
      DataField = 'ID_UNIDADE_MEDIDA'
      DataSource = ds
      ListSource = dsUnidadeMedida
      TabOrder = 2
    end
    object btnIncluirUnidadeMedida: TAdvGlowButton
      Left = 195
      Top = 92
      Width = 33
      Height = 21
      Hint = 'Incluir Unidade Medida'
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
      TabOrder = 6
      OnClick = btnIncluirUnidadeMedidaClick
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
    object lcbGrupo: TDBLookupComboBox
      Left = 237
      Top = 92
      Width = 209
      Height = 21
      DataField = 'ID_GRUPO'
      DataSource = ds
      ListSource = dsGrupo
      TabOrder = 3
    end
    object btnIncluirGrupo: TAdvGlowButton
      Left = 448
      Top = 92
      Width = 33
      Height = 21
      Hint = 'Incluir Grupo'
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
      TabOrder = 7
      OnClick = btnIncluirGrupoClick
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
    object edtQtdeMinima: TDBEdit
      Left = 400
      Top = 48
      Width = 81
      Height = 21
      DataField = 'QUANTIDADE_MINIMA'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_EST_PRODUTO'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 82
    Top = 24
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
    object cdsID_UNIDADE_MEDIDA: TIntegerField
      FieldName = 'ID_UNIDADE_MEDIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsQUANTIDADE_MINIMA: TIntegerField
      FieldName = 'QUANTIDADE_MINIMA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Required = True
    end
    object cdsID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
  end
  inherited ds: TDataSource
    Left = 114
    Top = 24
  end
  object cdsUnidadeMedida: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 124
  end
  object dsUnidadeMedida: TDataSource
    DataSet = cdsUnidadeMedida
    Left = 107
    Top = 92
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 92
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 312
    Top = 92
  end
end
