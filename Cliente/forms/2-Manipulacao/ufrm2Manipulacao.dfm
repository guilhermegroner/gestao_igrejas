inherited frm2Manipulacao: Tfrm2Manipulacao
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frm2Manipulacao'
  ClientHeight = 507
  ClientWidth = 915
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 915
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object hdrTitulo: TJvGradientHeaderPanel
      Left = 0
      Top = 0
      Width = 915
      Height = 25
      GradientStartColor = clSkyBlue
      GradientEndColor = clSkyBlue
      GradientStyle = grHorizontal
      LabelTop = 5
      LabelCaption = '.: Titulo'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -13
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taLeftJustify
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 25
    Width = 8
    Height = 475
    Align = alLeft
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
  end
  object pnlRight: TPanel
    Left = 907
    Top = 25
    Width = 8
    Height = 475
    Align = alRight
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 500
    Width = 915
    Height = 7
    Align = alBottom
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 3
  end
  object pnlFundo: TPanel
    Left = 8
    Top = 25
    Width = 899
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    object pnlBotoes: TPanel
      Left = 0
      Top = 40
      Width = 185
      Height = 435
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object btnIncluir: TAdvGlowButton
        Left = 0
        Top = 0
        Width = 185
        Height = 48
        Align = alTop
        Action = actIncluir
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      object btnEditar: TAdvGlowButton
        Left = 0
        Top = 48
        Width = 185
        Height = 48
        Align = alTop
        Action = actEditar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 3
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      end
      object btnExcluir: TAdvGlowButton
        Left = 0
        Top = 96
        Width = 185
        Height = 48
        Align = alTop
        Action = actExcluir
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 29
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      end
    end
    object cxGrid: TcxGrid
      Left = 185
      Top = 40
      Width = 471
      Height = 435
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cxGridTV1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total :#'
            Kind = skCount
            DisplayText = 'Total:'
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
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridTV1
      end
    end
    object pnlFiltros: TPanel
      Left = 0
      Top = 0
      Width = 899
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
    end
    object pnlPaineis: TPanel
      Left = 656
      Top = 40
      Width = 243
      Height = 435
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object Acoes: TActionList
    Images = DM.ImageList32x32
    Left = 88
    Top = 328
    object actIncluir: TAction
      Caption = 'Incluir'
      ImageIndex = 0
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      ImageIndex = 3
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 29
      OnExecute = actExcluirExecute
    end
    object actAtualizar: TAction
      Caption = 'Atualizar'
      ImageIndex = 1
      OnExecute = actAtualizarExecute
    end
    object actFechar: TAction
      Caption = 'Fechar'
      ImageIndex = 8
      OnExecute = actFecharExecute
    end
    object actLocalizar: TAction
      Caption = 'Localizar'
      ImageIndex = 5
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 546
    Top = 312
  end
  object ds: TDataSource
    DataSet = cds
    Left = 544
    Top = 360
  end
  object Style: TcxStyleRepository
    Left = 592
    Top = 360
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
