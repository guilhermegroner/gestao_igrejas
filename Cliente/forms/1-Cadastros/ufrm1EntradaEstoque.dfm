inherited frm1EntradaEstoque: Tfrm1EntradaEstoque
  Caption = ''
  ClientHeight = 539
  ClientWidth = 564
  ExplicitWidth = 570
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 564
    Height = 539
    ExplicitWidth = 564
    ExplicitHeight = 539
    inherited pnlBotton: TPanel
      Top = 498
      Width = 564
      ExplicitTop = 498
      ExplicitWidth = 564
      inherited btnSalvar: TAdvGlowButton
        Left = 363
        ExplicitLeft = 363
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 463
        ExplicitLeft = 463
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 564
      LabelCaption = '.: Entrada de Produtos no Estoque'
      ExplicitWidth = 564
    end
    object pnlItensEntrada: TPanel
      Left = 0
      Top = 112
      Width = 564
      Height = 386
      Align = alClient
      TabOrder = 2
      object pnlTopItens: TPanel
        Left = 1
        Top = 50
        Width = 562
        Height = 47
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object grpProduto: TGroupBox
          Left = 0
          Top = 0
          Width = 562
          Height = 88
          Align = alTop
          TabOrder = 0
          object lblProduto: TLabel
            Left = 5
            Top = 6
            Width = 44
            Height = 13
            Caption = '*Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCelular: TLabel
            Left = 399
            Top = 6
            Width = 62
            Height = 13
            Caption = '*Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblValorUnitario: TLabel
            Left = 480
            Top = 6
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object lcbProduto: TDBLookupComboBox
            Left = 5
            Top = 21
            Width = 355
            Height = 21
            Cursor = crHandPoint
            DataField = 'ID_PRODUTO'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsProduto
            ParentFont = False
            TabOrder = 0
          end
          object edtQuantidade: TDBEdit
            Left = 399
            Top = 21
            Width = 78
            Height = 21
            Color = clWhite
            DataField = 'QUANTIDADE'
            DataSource = dsItens
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object btnIncluirProduto: TAdvGlowButton
            Left = 362
            Top = 21
            Width = 33
            Height = 21
            Hint = 'Incluir Produto'
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
            TabOrder = 3
            OnClick = btnIncluirProdutoClick
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
          object edtValorUnitario: TDBEdit
            Left = 480
            Top = 21
            Width = 76
            Height = 21
            DataField = 'VALOR_UNITARIO'
            DataSource = dsItens
            TabOrder = 2
          end
        end
      end
      object cxGrid: TcxGrid
        Left = 1
        Top = 97
        Width = 562
        Height = 288
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object cxGridTV1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsItens
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total de Itens :#'
              Kind = skCount
              Column = cxGridTV_ID
              DisplayText = 'Total de Itens:'
            end
            item
              Format = 'Valor Total R$ :#,##0.00'
              Kind = skSum
              Column = cxGridTV_ValorTotal
              DisplayText = 'Valor Total  R$'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.Footer = True
          OptionsView.FooterAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.ContentEven = cxStyleZebrado
          Styles.Header = cxStyleTituloGrid
          object cxGridTV_ID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Width = 55
          end
          object cxGridTV_Produto: TcxGridDBColumn
            Caption = 'Produto'
            DataBinding.FieldName = 'NOME_PRODUTO'
            Width = 288
          end
          object cxGridTV_Qtde: TcxGridDBColumn
            Caption = 'Qtde'
            DataBinding.FieldName = 'QUANTIDADE'
            Width = 57
          end
          object cxGridTV_ValorUnitario: TcxGridDBColumn
            Caption = 'Valor Unit'#225'rio'
            DataBinding.FieldName = 'VALOR_UNITARIO'
            Width = 78
          end
          object cxGridTV_ValorTotal: TcxGridDBColumn
            Caption = 'Valor Total'
            DataBinding.FieldName = 'VALOR_TOTAL_ITEM'
            Width = 66
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridTV1
        end
      end
      object pnlBotoes: TPanel
        Left = 1
        Top = 1
        Width = 562
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object btnIncluirItem: TAdvGlowButton
          Left = 0
          Top = 21
          Width = 112
          Height = 28
          Align = alLeft
          Action = actIncluirProduto
          ImageIndex = 0
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 0
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
        object btnEditarItem: TAdvGlowButton
          Left = 112
          Top = 21
          Width = 112
          Height = 28
          Align = alLeft
          Action = actEditarProduto
          ImageIndex = 3
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 1
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Enabled = False
        end
        object btnGravarItem: TAdvGlowButton
          Left = 224
          Top = 21
          Width = 112
          Height = 28
          Align = alLeft
          Action = actGravarProduto
          ImageIndex = 6
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 2
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Enabled = False
        end
        object btnCancelarItem: TAdvGlowButton
          Left = 336
          Top = 21
          Width = 112
          Height = 28
          Align = alLeft
          Action = actCancelarProduto
          ImageIndex = 8
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 3
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Enabled = False
        end
        object btnExcluirItem: TAdvGlowButton
          Left = 448
          Top = 21
          Width = 112
          Height = 28
          Align = alLeft
          Action = actExcluirProduto
          ImageIndex = 12
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 4
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
          Enabled = False
        end
        object pnlTituloItensEntrada: TJvGradientHeaderPanel
          Left = 0
          Top = 0
          Width = 562
          Height = 21
          GradientStartColor = clSkyBlue
          GradientEndColor = clSkyBlue
          GradientStyle = grHorizontal
          LabelTop = 5
          LabelCaption = '.: Itens da Entrada'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWhite
          LabelFont.Height = -13
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = [fsBold]
          LabelAlignment = taLeftJustify
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
        end
      end
    end
    object pnlEntrada: TPanel
      Left = 0
      Top = 21
      Width = 564
      Height = 91
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object lblNotaFiscal: TLabel
        Left = 6
        Top = 47
        Width = 67
        Height = 13
        Caption = 'N'#186' Nota Fiscal'
      end
      object lblFornecedor: TLabel
        Left = 6
        Top = 3
        Width = 64
        Height = 13
        Caption = '* Fornecedor'
      end
      object lblDataEmissaoNota: TLabel
        Left = 173
        Top = 47
        Width = 82
        Height = 13
        Caption = 'Data de Emiss'#227'o '
      end
      object lblDataEntrada: TLabel
        Left = 311
        Top = 47
        Width = 88
        Height = 13
        Caption = '* Data da Entrada'
      end
      object lblValorTotalNota: TLabel
        Left = 447
        Top = 47
        Width = 92
        Height = 13
        Caption = 'Valor Total da Nota'
      end
      object edtNumeroNotaFiscal: TDBEdit
        Left = 6
        Top = 63
        Width = 163
        Height = 21
        DataField = 'NUMERO_NOTA_FISCAL'
        DataSource = ds
        TabOrder = 1
      end
      object lcbFornecedor: TDBLookupComboBox
        Left = 6
        Top = 19
        Width = 516
        Height = 21
        Cursor = crHandPoint
        DataField = 'ID_FORNECEDOR'
        DataSource = ds
        ListSource = dsFornecedor
        TabOrder = 0
      end
      object edtDataEmissaoNota: TJvDBDateEdit
        Left = 173
        Top = 63
        Width = 134
        Height = 21
        DataField = 'DATA_EMISSAO_NOTA'
        DataSource = ds
        DialogTitle = 'Selecione uma Data'
        ShowNullDate = False
        TabOrder = 2
      end
      object edtDataEntrada: TJvDBDateEdit
        Left = 311
        Top = 63
        Width = 132
        Height = 21
        DataField = 'DATA_ENTRADA'
        DataSource = ds
        DialogTitle = 'Selecione uma Data'
        ShowNullDate = False
        TabOrder = 3
      end
      object edtValorTotalNota: TDBEdit
        Left = 447
        Top = 63
        Width = 114
        Height = 21
        DataField = 'VALOR'
        DataSource = ds
        TabOrder = 4
      end
      object btnIncluirFornecedor: TAdvGlowButton
        Left = 524
        Top = 19
        Width = 33
        Height = 21
        Hint = 'Incluir Fornecedor'
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
        TabOrder = 5
        OnClick = btnIncluirFornecedorClick
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
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_EST_ENTRADA'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 384
    Top = 8
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDATA_EMISSAO_NOTA: TDateField
      FieldName = 'DATA_EMISSAO_NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVALOR: TFMTBCDField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited ds: TDataSource
    Left = 416
    Top = 8
  end
  object Acoes: TActionList
    Images = DM.ImageList32x32
    Left = 289
    Top = 168
    object actIncluirProduto: TAction
      Caption = 'Incluir'
      ImageIndex = 0
      OnExecute = actIncluirProdutoExecute
    end
    object actEditarProduto: TAction
      Caption = 'Editar'
      ImageIndex = 3
      OnExecute = actEditarProdutoExecute
    end
    object actGravarProduto: TAction
      Caption = 'Gravar'
      ImageIndex = 6
      OnExecute = actGravarProdutoExecute
    end
    object actCancelarProduto: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = actCancelarProdutoExecute
    end
    object actExcluirProduto: TAction
      Caption = 'Excluir'
      ImageIndex = 12
      OnExecute = actExcluirProdutoExecute
    end
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 166
    Top = 25
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 246
    Top = 25
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EST_IENTRADA'
    RemoteServer = DM.DSPConnSM
    AfterInsert = cdsItensAfterInsert
    BeforePost = cdsItensBeforePost
    Left = 112
    Top = 304
    object cdsItensID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsItensID_PRODUTOValidate
    end
    object cdsItensQUANTIDADE: TIntegerField
      Alignment = taCenter
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsItensNOME_PRODUTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object cdsItensVALOR_TOTAL_ITEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_TOTAL_ITEM'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 160
    Top = 304
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 161
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 97
    Top = 161
  end
  object Style: TcxStyleRepository
    Left = 296
    Top = 312
    PixelsPerInch = 96
    object cxStyleZebrado: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clDefault
    end
    object cxStyleTituloGrid: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
end
