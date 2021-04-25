inherited frm2TransferenciaPatrimonio: Tfrm2TransferenciaPatrimonio
  Caption = ''
  ClientHeight = 536
  ClientWidth = 737
  OnCreate = FormCreate
  ExplicitWidth = 743
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 536
    ExplicitWidth = 737
    ExplicitHeight = 536
    inherited pnlBotton: TPanel
      Top = 495
      Width = 737
      ExplicitTop = 495
      ExplicitWidth = 737
      inherited btnSalvar: TAdvGlowButton
        Left = 536
        ExplicitLeft = 536
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 636
        ExplicitLeft = 636
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 737
      LabelCaption = '.: Transfer'#234'ncia de Patrim'#244'nio'
      ExplicitWidth = 737
    end
    object pnlDadosTransf: TPanel
      Left = 0
      Top = 21
      Width = 737
      Height = 196
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object pnlItens: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 99
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object lblDataTransf: TLabel
          Left = 6
          Top = 6
          Width = 107
          Height = 13
          Caption = 'Data da Transfer'#234'ncia'
        end
        object lblMotivoTransf: TLabel
          Left = 133
          Top = 6
          Width = 116
          Height = 13
          Cursor = crHandPoint
          Caption = 'Motivo da Transfer'#234'ncia'
        end
        object lblSetorOrigem: TLabel
          Left = 6
          Top = 57
          Width = 78
          Height = 13
          Caption = 'Setor de Origem'
        end
        object lblSetorDestino: TLabel
          Left = 318
          Top = 57
          Width = 80
          Height = 13
          Caption = 'Setor de Destino'
        end
        object edtDataTransf: TJvDateEdit
          Left = 6
          Top = 23
          Width = 121
          Height = 21
          DefaultToday = True
          ShowNullDate = False
          TabOrder = 0
        end
        object lcbMotivoTransf: TDBLookupComboBox
          Left = 133
          Top = 23
          Width = 492
          Height = 21
          Cursor = crHandPoint
          ListSource = dsMotivo
          TabOrder = 1
        end
        object lcbSetorOrigem: TDBLookupComboBox
          Left = 6
          Top = 74
          Width = 307
          Height = 21
          Cursor = crHandPoint
          ListSource = dsSetorOrigem
          TabOrder = 2
          OnClick = lcbSetorOrigemClick
        end
        object lcbSetorDestino: TDBLookupComboBox
          Left = 318
          Top = 74
          Width = 307
          Height = 21
          Cursor = crHandPoint
          ListSource = dsSetorDestino
          TabOrder = 3
        end
      end
      object grp1: TGroupBox
        Left = 0
        Top = 103
        Width = 737
        Height = 93
        Align = alBottom
        TabOrder = 1
        object lblNomePatrimonio: TLabel
          Left = 126
          Top = 16
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lblNumeroPatrimonio: TLabel
          Left = 3
          Top = 16
          Width = 90
          Height = 13
          Caption = 'N'#250'mero Patrim'#244'nio'
        end
        object lblBensTransferidos: TLabel
          Left = 3
          Top = 80
          Width = 189
          Height = 13
          Caption = 'Patrim'#244'nios a serem transferidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnAddItemBaixar: TAdvGlowButton
          Left = 617
          Top = 23
          Width = 97
          Height = 46
          Cursor = crHandPoint
          Caption = 'Adicionar'
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
        object edtNomePatrimonio: TcxTextEdit
          Left = 126
          Top = 35
          Enabled = False
          TabOrder = 0
          Width = 482
        end
        object edtCodigoPatrimonio: TcxTextEdit
          Left = 4
          Top = 35
          Style.Color = clSkyBlue
          TabOrder = 1
          OnExit = edtCodigoPatrimonioExit
          OnKeyPress = edtCodigoPatrimonioKeyPress
          Width = 121
        end
      end
    end
    object pnlItensBaixados: TPanel
      Left = 0
      Top = 217
      Width = 737
      Height = 278
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object cxGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 737
        Height = 278
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxGridTV1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = ds
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total :#'
              Kind = skCount
              Column = cxGridTV_NumeroPatrimonio
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
          object cxGridTV_NumeroPatrimonio: TcxGridDBColumn
            Caption = 'N'#250'mero Patrim'#244'nio'
            DataBinding.FieldName = 'NUMERO_PATRIMONIO'
            Width = 129
          end
          object cxGridTV_NomePatrimonio: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'NOME_PATRIMONIO'
            Width = 501
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridTV1
        end
      end
    end
  end
  inherited cds: TClientDataSet
    object cdsNUMERO_PATRIMONIO: TIntegerField
      FieldName = 'NUMERO_PATRIMONIO'
    end
    object cdsNOME_PATRIMONIO: TStringField
      FieldName = 'NOME_PATRIMONIO'
      Size = 120
    end
  end
  object cdsMotivo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 22
  end
  object dsMotivo: TDataSource
    DataSet = cdsMotivo
    Left = 344
    Top = 22
  end
  object dsSetorOrigem: TDataSource
    DataSet = cdsSetorOrigem
    Left = 152
    Top = 73
  end
  object cdsSetorOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 73
  end
  object dsSetorDestino: TDataSource
    DataSet = cdsSetorDestino
    Left = 456
    Top = 77
  end
  object cdsSetorDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 77
  end
end
