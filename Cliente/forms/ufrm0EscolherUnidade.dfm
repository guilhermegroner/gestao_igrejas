inherited frm0EscolherUnidade: Tfrm0EscolherUnidade
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 132
  ClientWidth = 478
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 484
  ExplicitHeight = 161
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblUnidade: TLabel
      Left = 6
      Top = 30
      Width = 48
      Height = 13
      Caption = '* Unidade'
    end
    object pnlBotton: TPanel
      Left = 0
      Top = 91
      Width = 478
      Height = 41
      Align = alBottom
      TabOrder = 0
      object lblAvisoCampoRequerido: TLabel
        Left = 6
        Top = 16
        Width = 94
        Height = 13
        Caption = '* Campo Requerido'
      end
      object btnSelecionar: TAdvGlowButton
        Left = 320
        Top = 1
        Width = 157
        Height = 39
        Align = alRight
        Caption = 'Selecionar'
        ImageIndex = 9
        Images = DM.ImageList32x32
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 0
        OnClick = btnSelecionarClick
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
    object hdrTitulo: TJvGradientHeaderPanel
      Left = 0
      Top = 0
      Width = 478
      Height = 21
      GradientStartColor = clSkyBlue
      GradientEndColor = clSkyBlue
      GradientStyle = grHorizontal
      LabelTop = 5
      LabelCaption = '.: Escolha uma unidade'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -13
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taLeftJustify
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object lcbUnidade: TDBLookupComboBox
      Left = 6
      Top = 47
      Width = 467
      Height = 21
      Cursor = crHandPoint
      ListSource = dsUnidade
      TabOrder = 2
      OnKeyPress = lcbUnidadeKeyPress
    end
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 40
    object cdsUnidadeID: TIntegerField
      FieldName = 'ID'
    end
    object cdsUnidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object dsUnidade: TDataSource
    DataSet = cdsUnidade
    Left = 208
    Top = 40
  end
end
