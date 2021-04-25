inherited frm1Grupo: Tfrm1Grupo
  Caption = ''
  ClientHeight = 421
  ClientWidth = 528
  ScreenSnap = True
  OnCreate = FormCreate
  ExplicitWidth = 534
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 528
    Height = 421
    ExplicitWidth = 528
    ExplicitHeight = 421
    object lblNome: TLabel [0]
      Left = 8
      Top = 30
      Width = 39
      Height = 13
      Caption = '*  Nome'
    end
    inherited pnlBotton: TPanel
      Top = 380
      Width = 528
      ExplicitTop = 380
      ExplicitWidth = 528
      inherited btnSalvar: TAdvGlowButton
        Left = 327
        ExplicitLeft = 327
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 427
        ExplicitLeft = 427
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 528
      LabelCaption = '.: Grupo'
      ExplicitWidth = 528
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 48
      Width = 517
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object pnlMembrosGrupo: TPanel
      Left = 0
      Top = 102
      Width = 528
      Height = 278
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object grpMembrosGrupo: TGroupBox
        Left = 0
        Top = 0
        Width = 528
        Height = 278
        Align = alClient
        Caption = 'Membros do Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cxGrid: TcxGrid
          Left = 2
          Top = 15
          Width = 524
          Height = 261
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridTV1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsMembros
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total :#'
                Kind = skCount
                Column = cxGridTV_ID
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
            object cxGridTV_ID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Width = 71
            end
            object cxGridTV_Nome: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NOME'
              Width = 435
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridTV1
          end
        end
      end
    end
    object btnAddItemBaixar: TAdvGlowButton
      Left = 247
      Top = 75
      Width = 138
      Height = 30
      Cursor = crHandPoint
      Caption = 'Adicionar Membro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      Images = DM.ImageList32x32
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAddItemBaixarClick
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
    object btnRemoverMembro: TAdvGlowButton
      Left = 387
      Top = 75
      Width = 138
      Height = 30
      Caption = 'Remover Membro'
      ImageIndex = 2
      Images = DM.ImageList32x32
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 5
      OnClick = btnRemoverMembroClick
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
  inherited cds: TClientDataSet
    ProviderName = 'DSP_GRUPO'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 152
    Top = 16
    object cdsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 120
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
    Left = 184
    Top = 16
  end
  object cdsMembros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 126
    object cdsMembrosID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
    end
    object cdsMembrosNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dsMembros: TDataSource
    DataSet = cdsMembros
    Left = 408
    Top = 174
  end
  object Style: TcxStyleRepository
    Left = 332
    Top = 176
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
