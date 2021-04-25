inherited frm2SaidaEstoque: Tfrm2SaidaEstoque
  Caption = 'Sa'#237'das no Estoque'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited hdrTitulo: TJvGradientHeaderPanel
      LabelCaption = '.: Sa'#237'das no Estoque'
    end
  end
  inherited pnlFundo: TPanel
    inherited pnlBotoes: TPanel
      Top = 65
      Height = 410
      ExplicitTop = 65
      ExplicitHeight = 410
    end
    inherited cxGrid: TcxGrid
      Top = 65
      Width = 711
      Height = 410
      ExplicitTop = 65
      ExplicitWidth = 711
      ExplicitHeight = 410
      inherited cxGridTV1: TcxGridDBTableView
        object cxGridTV_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object cxGridTV_DATA_SAIDA: TcxGridDBColumn
          Caption = 'Data de Sa'#237'da'
          DataBinding.FieldName = 'DATA_SAIDA'
          Width = 282
        end
      end
    end
    inherited pnlFiltros: TPanel
      Height = 65
      ExplicitHeight = 65
      object gbFiltro: TcxGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Align = alClient
        Caption = 'Filtro:'
        TabOrder = 0
        Height = 59
        Width = 893
        object lbl6: TLabel
          Left = 3
          Top = 16
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
        end
        object lbl7: TLabel
          Left = 100
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        object btnLocalizar: TAdvGlowButton
          Left = 197
          Top = 27
          Width = 97
          Height = 26
          Cursor = crHandPoint
          Action = actLocalizar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 5
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
        object edtDataInicial: TJvDateEdit
          Left = 3
          Top = 30
          Width = 91
          Height = 21
          ShowNullDate = False
          TabOrder = 1
        end
        object edtDataFinal: TJvDateEdit
          Left = 100
          Top = 30
          Width = 91
          Height = 21
          ShowNullDate = False
          TabOrder = 2
        end
      end
    end
    inherited pnlPaineis: TPanel
      Left = 896
      Top = 65
      Width = 3
      Height = 410
      ExplicitLeft = 896
      ExplicitTop = 65
      ExplicitWidth = 3
      ExplicitHeight = 410
    end
  end
  inherited Acoes: TActionList
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
  inherited cds: TClientDataSet
    object cdsID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
    end
    object cdsDATA_SAIDA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_SAIDA'
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
  end
end
