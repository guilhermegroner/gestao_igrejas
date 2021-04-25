inherited frm1SaidaEstoque: Tfrm1SaidaEstoque
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
      LabelCaption = '.: Sa'#237'da de Produto do Estoque'
      ExplicitWidth = 564
    end
    object pnlSaida: TPanel
      Left = 0
      Top = 21
      Width = 564
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblDataMovimento: TLabel
        Left = 6
        Top = 7
        Width = 99
        Height = 13
        Caption = '*Data do Movimento'
      end
      object edtDataMovimento: TJvDBDateEdit
        Left = 6
        Top = 23
        Width = 134
        Height = 21
        DataField = 'DATA_SAIDA'
        DataSource = ds
        DialogTitle = 'Selecione uma Data'
        ShowNullDate = False
        TabOrder = 0
      end
    end
    object pnlItensEntrada: TPanel
      Left = 0
      Top = 73
      Width = 564
      Height = 425
      Align = alClient
      TabOrder = 3
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
          Height = 83
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
            Left = 401
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
          object lcbProduto: TDBLookupComboBox
            Left = 5
            Top = 21
            Width = 393
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
            Left = 401
            Top = 21
            Width = 121
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
        end
      end
      object cxGrid: TcxGrid
        Left = 1
        Top = 97
        Width = 562
        Height = 327
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
            Width = 360
          end
          object cxGridTV_Qtde: TcxGridDBColumn
            Caption = 'Qtde'
            DataBinding.FieldName = 'QUANTIDADE'
            Width = 57
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
        object pnlTituloItensSaida: TJvGradientHeaderPanel
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
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_EST_SAIDA'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 240
    Top = 24
    object cdsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Required = True
    end
    object cdsOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
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
    Left = 272
    Top = 24
  end
  object Style: TcxStyleRepository
    Left = 368
    Top = 248
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
  object Acoes: TActionList
    Images = DM.ImageList32x32
    Left = 281
    Top = 248
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
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_EST_ISAIDA'
    RemoteServer = DM.DSPConnSM
    AfterInsert = cdsItensAfterInsert
    Left = 56
    Top = 248
    object cdsItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsItensID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      Required = True
    end
    object cdsItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
      OnValidate = cdsItensID_PRODUTOValidate
    end
    object cdsItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object cdsItensNOME_PRODUTO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOME_PRODUTO'
      Size = 120
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 104
    Top = 248
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 169
    Top = 137
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 225
    Top = 137
  end
end
