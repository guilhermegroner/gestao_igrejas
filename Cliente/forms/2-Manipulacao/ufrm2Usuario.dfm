inherited frm2Usuario: Tfrm2Usuario
  Caption = 'Usu'#225'rios'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited hdrTitulo: TJvGradientHeaderPanel
      LabelCaption = '.: Usu'#225'rios Cadastrados'
    end
  end
  inherited pnlFundo: TPanel
    inherited pnlBotoes: TPanel
      Top = 65
      Height = 410
      ExplicitTop = 65
      ExplicitHeight = 410
      inherited btnExcluir: TAdvGlowButton
        Top = 144
        Visible = False
        ExplicitTop = 144
      end
      object btnAlterarSenha: TAdvGlowButton
        Left = 0
        Top = 96
        Width = 185
        Height = 48
        Align = alTop
        Action = actAlterarSenha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 23
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
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
      end
    end
    inherited cxGrid: TcxGrid
      Top = 65
      Width = 711
      Height = 410
      ExplicitTop = 65
      ExplicitWidth = 711
      ExplicitHeight = 410
      inherited cxGridTV1: TcxGridDBTableView
        OnDblClick = cxGridTV1DblClick
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total :#'
            Kind = skCount
            Column = cxGrid_ID
            DisplayText = 'Total:'
          end>
        object cxGrid_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object cxGrid_Nome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          Width = 284
        end
        object cxGrid_Usuario: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO'
          Width = 158
        end
        object cxGrid_Situacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          Width = 110
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
        object pbBasico: TJvPageList
          Left = 154
          Top = 30
          Width = 447
          Height = 23
          ActivePage = PagFiltro
          PropagateEnable = False
          object PagFiltro: TJvStandardPage
            Left = 0
            Top = 0
            Width = 447
            Height = 23
            object cbbCondicao: TJvComboBox
              Left = 3
              Top = 2
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              Text = ''
              Items.Strings = (
                'Igual'
                'Come'#231'a Com')
            end
            object edtFiltro: TEdit
              Left = 149
              Top = 2
              Width = 296
              Height = 21
              Color = clWhite
              TabOrder = 1
              OnExit = edtFiltroExit
            end
          end
        end
        object cxLabel2: TcxLabel
          Left = 6
          Top = 12
          Caption = 'Campo'
        end
        object cxLabel3: TcxLabel
          Left = 157
          Top = 12
          Caption = 'Condi'#231#227'o'
        end
        object cbbCampoPesquisa: TJvComboBox
          Left = 6
          Top = 32
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          Text = ''
          Items.Strings = (
            'ID'
            'Usu'#225'rio')
        end
        object btnLocalizar: TAdvGlowButton
          Left = 608
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
    object actAlterarSenha: TAction
      Caption = 'Alterar Senha'
      ImageIndex = 23
      OnExecute = actAlterarSenhaExecute
    end
  end
  inherited cds: TClientDataSet
    object cdsID: TIntegerField
      Alignment = taCenter
      FieldName = 'ID'
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 40
    end
    object cdsSITUACAO: TStringField
      Alignment = taCenter
      FieldName = 'SITUACAO'
      Size = 9
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
  end
end
