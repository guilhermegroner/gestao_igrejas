inherited frm4PastoralImpressoes: Tfrm4PastoralImpressoes
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 376
  ClientWidth = 611
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 617
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 376
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object hdrTitulo: TJvGradientHeaderPanel
      Left = 0
      Top = 0
      Width = 611
      Height = 21
      GradientStartColor = clSkyBlue
      GradientEndColor = clSkyBlue
      GradientStyle = grHorizontal
      LabelTop = 5
      LabelCaption = '.: Impress'#245'es'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -13
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = [fsBold]
      LabelAlignment = taLeftJustify
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlLeftOpcoes: TPanel
      Left = 0
      Top = 21
      Width = 201
      Height = 355
      Align = alLeft
      TabOrder = 1
      object pnlModelosRelatorio: TJvItemsPanel
        Left = 1
        Top = 1
        Width = 199
        Height = 353
        Cursor = crHandPoint
        AutoGrow = False
        AutoSize = False
        Items.Strings = (
          'Ficha do Membro(em branco)'
          '-'
          'Membros por Grupo')
        HotTrack = False
        OnItemClick = pnlModelosRelatorioItemClick
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object pcModelosRelatorio: TcxPageControl
      Left = 201
      Top = 21
      Width = 410
      Height = 355
      Align = alClient
      TabOrder = 2
      Properties.ActivePage = tsRelFichaMembro
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 9
      ClientRectBottom = 355
      ClientRectRight = 410
      ClientRectTop = 20
      object tsRelFichaMembro: TcxTabSheet
        AllowCloseButton = False
        Caption = 'Ficha do Membro'
        ImageIndex = 0
        object grpFichaMembro: TGroupBox
          Left = 0
          Top = 0
          Width = 410
          Height = 335
          Align = alClient
          TabOrder = 0
          Visible = False
          object pnlTopFichaMembro: TJvGradientHeaderPanel
            Left = 1
            Top = 3
            Width = 406
            Height = 23
            GradientStartColor = 15234048
            GradientStyle = grHorizontal
            LabelTop = 5
            LabelCaption = '.: Ficha do Membro(em branco)'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWhite
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            LabelAlignment = taLeftJustify
            TabOrder = 0
          end
          object btnFichaEmBranco: TAdvGlowButton
            Left = 1
            Top = 37
            Width = 406
            Height = 48
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 10
            Images = DM.ImageList32x32
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnFichaEmBrancoClick
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
      object tsListagemMembros: TcxTabSheet
        Caption = 'Listagem de Membros'
        ImageIndex = 1
        object grpListagemMembros: TGroupBox
          Left = 0
          Top = 0
          Width = 410
          Height = 335
          Align = alClient
          TabOrder = 0
          Visible = False
          object pnlToListagemMembros: TJvGradientHeaderPanel
            Left = 4
            Top = 3
            Width = 406
            Height = 23
            GradientStartColor = 15234048
            GradientStyle = grHorizontal
            LabelTop = 5
            LabelCaption = '.: Listagem de Membros'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWhite
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            LabelAlignment = taLeftJustify
            TabOrder = 0
          end
          object grpSituacaoMembros: TGroupBox
            Left = 0
            Top = 32
            Width = 404
            Height = 69
            Caption = 'Rela'#231#227'o de Membros'
            TabOrder = 1
            object rgSituacoesMembros: TRadioGroup
              Left = 2
              Top = 15
              Width = 400
              Height = 52
              Align = alClient
              Items.Strings = (
                'Ativos'
                'Inativos')
              TabOrder = 0
            end
          end
          object btnImpListagemMembros: TAdvGlowButton
            Left = 2
            Top = 230
            Width = 406
            Height = 48
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 10
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
          object GroupBox1: TGroupBox
            Left = 2
            Top = 101
            Width = 404
            Height = 67
            Caption = 'Filtrar Aniversariantes'
            TabOrder = 3
            object lblAniversarioDe: TLabel
              Left = 4
              Top = 15
              Width = 73
              Height = 13
              Caption = 'Anivers'#225'rio de:'
            end
            object lbl6: TLabel
              Left = 135
              Top = 16
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
            end
            object lbl7: TLabel
              Left = 232
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Data Final'
            end
            object cbbTiposAniversario: TJvComboBox
              Left = 4
              Top = 31
              Width = 125
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              Text = ''
              Items.Strings = (
                'Nascimento'
                'Casamento'
                'Entrada na Comunidade')
            end
            object edtDataInicial: TJvDateEdit
              Left = 135
              Top = 31
              Width = 91
              Height = 21
              ShowNullDate = False
              TabOrder = 1
            end
            object edtDataFinal: TJvDateEdit
              Left = 232
              Top = 31
              Width = 91
              Height = 21
              ShowNullDate = False
              TabOrder = 2
            end
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 167
            Width = 404
            Height = 55
            Caption = 'Filtrar por Idade'
            TabOrder = 4
            object lblFaixaEtaria: TLabel
              Left = 11
              Top = 26
              Width = 76
              Height = 13
              Caption = 'Faixa Et'#225'ria de:'
            end
            object lblA: TLabel
              Left = 175
              Top = 26
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object cxSpinEdit1: TcxSpinEdit
              Left = 93
              Top = 24
              TabOrder = 0
              Width = 75
            end
            object cxSpinEdit2: TcxSpinEdit
              Left = 187
              Top = 24
              TabOrder = 1
              Width = 75
            end
          end
        end
      end
      object tsMembrosPorGrupo: TcxTabSheet
        Caption = 'Membros por Grupo'
        ImageIndex = 2
        object grpMembrosPorGrupo: TGroupBox
          Left = 0
          Top = 0
          Width = 410
          Height = 335
          Align = alClient
          TabOrder = 0
          Visible = False
          object lblGrupo: TLabel
            Left = 5
            Top = 27
            Width = 29
            Height = 13
            Caption = 'Grupo'
          end
          object pnlTituloMembroGrupo: TJvGradientHeaderPanel
            Left = 4
            Top = 3
            Width = 406
            Height = 23
            GradientStartColor = 15234048
            GradientStyle = grHorizontal
            LabelTop = 5
            LabelCaption = '.: Membros por Grupo'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWhite
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            LabelAlignment = taLeftJustify
            TabOrder = 0
          end
          object btnImpMembroGrupo: TAdvGlowButton
            Left = 5
            Top = 90
            Width = 394
            Height = 48
            Cursor = crHandPoint
            Caption = 'Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 10
            Images = DM.ImageList32x32
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnImpMembroGrupoClick
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
          object lcbMembroGrupo: TDBLookupComboBox
            Left = 5
            Top = 43
            Width = 332
            Height = 21
            Cursor = crHandPoint
            ListSource = dsGrupo
            TabOrder = 2
          end
          object btnLimparGrupo: TAdvGlowButton
            Left = 343
            Top = 43
            Width = 33
            Height = 21
            Hint = 'Limpar Grupo'
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
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000000473424954080808087C086488000000097048597300000B1300000B
              1301009A9C1800000288494441544889ED944F4814511CC7BF6F9BFDF3762B77
              267745C28D42AD63489A081D3A08EA12D1FF4C16A3BD6410D1A94B201D843A06
              D1514D2193103AF467292A22DD4B4294B88482E1E6A610BB8E3B38338E33F33A
              E898EE1F772DBAF9BD0DEF379FCFFBFDDEE301DBF91F69EF79EF2DB6D6B655F8
              B59E912794D853671EBEED29A69E6C051EBC148EDB4BCA2A8C43C701000C78F0
              FC46E3F5CDFED9B115B83C3B55F16B2A0638289CBE00085057DD7CB97422D2F7
              EA9F04C1B615B8AAAAE0380E723C0666B724ACAEAA29E49B8CF4BFFC2B41B02D
              1C977F4E55689A064110E076BBA1EB3AE4F8380CCE05A73F001B2179259B0A5A
              DAC2716515CEF33C085939324A29745D87128FC1B0B9E02A5B953487FC9992BC
              8296D62BD3CAECF780AAAA1004610D6E654DF22386659B132EFF3ED808A9F51C
              3DDD38F761B0DBAACB794D3B7AA3032EFFFE802449608CE5ED90E779504AB1F4
              F90552631F31B7A020AD680DEB6BB2041DBDD101DD342E2E1FA8C7EE86F3D075
              1DA9542AAF88E779381C0E88D1A710DFF5A2C4EDE85ABFBE6144571F451F1BA6
              D13A27A9000087500E780428D363D0340D94D2AC5199A689643209499240FD7B
              87BF7677867277C0988DC1BC60C1ADECAAAC01AD3F074DD3B23A618C21914840
              1445ECAC3E323CFE66E85866877F048498E2A2762FD718BC953570D69DDD2061
              8C61666606F3F3F379E1408EA7E2C4FDD7B70072375771F2DB28B44F43E0380E
              8AA26CBA732B59D77422D23F72B0A95D014163E69A6B4F39969C5EA4274721A5
              D305E139052B92BE91AAA676856448082190EC3CE4B4082AF80AC28102AF69ED
              9D677D8B4B46C83A561380AE1BE03DCEAED1CE93B70BC10B0A00E070D7A08FCA
              1EB7F52D972E2F7CB9794A2C06BE9DA2F21BC3B8211F43AC5FDD000000004945
              4E44AE426082}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnLimparGrupoClick
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
    end
  end
  object frxReport: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43390.990558252300000000
    ReportOptions.LastChange = 43437.830161550930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 22
    Top = 281
    Datasets = <
      item
        DataSet = DM.frxDBDadosUnidade
        DataSetName = 'dsDadosUnidade'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 94.488250000000100000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Left = 1.779530000000000000
          Top = 0.779530000000001000
          Width = 714.331170000000000000
          Height = 94.488250000000000000
        end
        object dsDadosUnidadeNOME: TfrxMemoView
          Left = 5.000000000000000000
          Top = 1.559060000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsDadosUnidade."NOME"]')
          ParentFont = False
        end
        object dsDadosUnidadeENDERECO: TfrxMemoView
          Left = 5.559060000000000000
          Top = 21.236240000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[dsDadosUnidade."ENDERECO"], [dsDadosUnidade."ENDERECO_NUMERO"] ' +
              '- [dsDadosUnidade."ENDERECO_BAIRRO"] - [dsDadosUnidade."TELEFONE' +
              '"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          Left = 5.779530000000000000
          Top = 36.354360000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'CEP: [dsDadosUnidade."CEP"] -  Cx. Postal: 19 - CNPJ: [dsDadosUn' +
              'idade."CNPJ"] ')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo4: TfrxMemoView
          Left = 4.779530000000000000
          Top = 56.692950000000000000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Organizada em 01/07/1954 - Pastor: Izaias Barbosa')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 737.008350000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = DM.frxDBDadosUnidade
        DataSetName = 'dsDadosUnidade'
        RowCount = 0
        object Shape2: TfrxShapeView
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo5: TfrxMemoView
          Left = 1.779530000000000000
          Top = 3.779529999999990000
          Width = 110.997237040000000000
          Height = 19.200012400000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Identifica'#231#227'o:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 1.779530000000000000
          Top = 30.236240000000000000
          Width = 44.522863400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 2.338590000000000000
          Top = 52.692950000000000000
          Width = 101.215813400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data de Nasc.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 1.779530000000000000
          Top = 75.913420000000000000
          Width = 135.231583400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grau de Instru'#231#227'o:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 269.141930000000000000
          Top = 75.913420000000000000
          Width = 74.759103400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profiss'#227'o:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 579.472790000000000000
          Top = 75.913420000000000000
          Width = 44.522863400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sexo:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 1.779530000000000000
          Top = 98.590600000000000000
          Width = 63.420513400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Filia'#231#227'o:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 68.031540000000000000
          Top = 98.590600000000000000
          Width = 33.184273400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pai:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 68.031540000000000000
          Top = 119.488250000000000000
          Width = 36.963803400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'M'#227'e:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 1.779530000000000000
          Top = 142.165430000000000000
          Width = 93.656753400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado Civil:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 210.771800000000000000
          Top = 142.165430000000000000
          Width = 135.231583400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do C'#244'njuge:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 1.779530000000000000
          Top = 164.842610000000000000
          Width = 123.892993400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Casamento:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 206.889920000000000000
          Top = 164.842610000000000000
          Width = 97.436283400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Naturalidade:')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 523.016080000000000000
          Top = 164.842610000000000000
          Width = 108.774873400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nacionalidade:')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Top = 187.519790000000000000
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo30: TfrxMemoView
          Left = 1.779530000000000000
          Top = 190.519790000000000000
          Width = 110.997237040000000000
          Height = 19.200012400000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 2.000000000000000000
          Top = 213.976500000000000000
          Width = 74.759103400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 613.842920000000000000
          Top = 213.976500000000000000
          Width = 40.743333400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Num:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 2.000000000000000000
          Top = 233.874150000000000000
          Width = 52.081923400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 260.787570000000000000
          Top = 233.874150000000000000
          Width = 70.979573400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 461.102660000000000000
          Top = 234.874150000000000000
          Width = 59.640983400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 1.779530000000000000
          Top = 255.551330000000000000
          Width = 59.640983400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 380.732530000000000000
          Top = 255.551330000000000000
          Width = 29.404743400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF:')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 537.693260000000000000
          Top = 255.551330000000000000
          Width = 40.743333400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CEP:')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Top = 278.228510000000000000
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo48: TfrxMemoView
          Left = 1.559060000000000000
          Top = 282.008040000000000000
          Width = 179.028777040000000000
          Height = 19.200012400000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hist'#243'rico Eclesi'#225'stico:')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 2.000000000000000000
          Top = 304.685220000000000000
          Width = 173.026883400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Igreja onde foi batizado:')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 1.779530000000000000
          Top = 324.582870000000000000
          Width = 154.129233400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pastor que o batizou:')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 2.000000000000000000
          Top = 346.260050000000000000
          Width = 101.215813400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Admitido em:')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 222.551330000000000000
          Top = 346.260050000000000000
          Width = 123.892993400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Modo Admiss'#227'o:')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 2.779530000000000000
          Top = 368.937230000000000000
          Width = 214.601713400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Igrejas das quais foi membro:')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          Top = 391.614410000000000000
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo59: TfrxMemoView
          Left = 2.779530000000000000
          Top = 395.393940000000000000
          Width = 186.587837040000000000
          Height = 19.200012400000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Participa'#231#227'o na Causa:')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 2.779530000000000000
          Top = 419.850650000000000000
          Width = 78.538633400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dizimista?')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 203.094620000000000000
          Top = 419.850650000000000000
          Width = 78.538633400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ofertante?')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 2.779530000000000000
          Top = 442.307360000000000000
          Width = 286.412783400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o que j'#225' exerceu em outra Igreja:')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 2.779530000000000000
          Top = 467.205010000000000000
          Width = 320.428553400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o que gostaria de exercer nesta Igreja:')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 225.771800000000000000
          Top = 52.535433070000000000
          Width = 36.963803400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF.')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 394.764070000000000000
          Top = 52.535433070000000000
          Width = 33.184273400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RG.')
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Top = 573.338900000000000000
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo73: TfrxMemoView
          Left = 2.779530000000000000
          Top = 577.118430000000000000
          Width = 110.997237040000000000
          Height = 19.200012400000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Observa'#231#245'es:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 622.472790000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Top = 645.149970000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Top = 667.827150000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Top = 690.504330000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Top = 713.181510000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Top = 735.858690000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 219.771800000000000000
          Top = 385.512060000000000000
          Width = 497.385826771654000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 105.826840000000000000
          Top = 362.834880000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 349.496290000000000000
          Top = 362.834880000000000000
          Width = 367.748031500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 157.740260000000000000
          Top = 341.157700000000000000
          Width = 559.370440000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Left = 178.417440000000000000
          Top = 321.260050000000000000
          Width = 538.960629921260000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Left = 83.149660000000000000
          Top = 436.645950000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 283.464750000000000000
          Top = 435.645950000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 300.110390000000000000
          Top = 459.323130000000000000
          Width = 367.748031500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 328.110390000000000000
          Top = 483.779840000000000000
          Width = 367.748031500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 56.692950000000000000
          Top = 250.448980000000000000
          Width = 200.315090000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          Left = 64.252010000000000000
          Top = 273.126160000000000000
          Width = 313.700990000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 79.370130000000000000
          Top = 231.771800000000000000
          Width = 532.913730000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 333.598640000000000000
          Top = 250.448980000000000000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line22: TfrxLineView
          Left = 411.968770000000000000
          Top = 273.126160000000000000
          Width = 60.472480000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line23: TfrxLineView
          Left = 522.575140000000000000
          Top = 252.448980000000000000
          Width = 147.401670000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          Left = 657.638220000000000000
          Top = 231.551330000000000000
          Width = 56.692950000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          Left = 581.047620000000000000
          Top = 273.126160000000000000
          Width = 136.063080000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line26: TfrxLineView
          Left = 48.133890000000000000
          Top = 48.133890000000000000
          Width = 668.976810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line27: TfrxLineView
          Left = 264.567100000000000000
          Top = 69.031540000000000000
          Width = 128.504020000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line28: TfrxLineView
          Left = 430.866420000000000000
          Top = 69.031540000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line29: TfrxLineView
          Left = 345.937230000000000000
          Top = 93.488250000000000000
          Width = 230.551330000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line30: TfrxLineView
          Left = 139.622140000000000000
          Top = 93.488250000000000000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line31: TfrxLineView
          Left = 98.267780000000000000
          Top = 159.740260000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line32: TfrxLineView
          Left = 128.504020000000000000
          Top = 182.417440000000000000
          Width = 75.590600000000100000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line33: TfrxLineView
          Left = 104.826840000000000000
          Top = 114.606370000000000000
          Width = 423.307360000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line34: TfrxLineView
          Left = 105.826840000000000000
          Top = 137.063080000000000000
          Width = 423.307360000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line35: TfrxLineView
          Left = 347.716760000000000000
          Top = 158.960730000000000000
          Width = 368.881889763780000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line36: TfrxLineView
          Left = 306.141930000000000000
          Top = 181.417440000000000000
          Width = 215.433210000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line37: TfrxLineView
          Left = 633.181510000000000000
          Top = 182.417440000000000000
          Width = 83.149660000000200000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line38: TfrxLineView
          Left = 626.401980000000000000
          Top = 93.488250000000000000
          Width = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line39: TfrxLineView
          Left = 104.826840000000000000
          Top = 70.811070000000000000
          Width = 117.165430000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 544.149970000000000000
          Top = 52.535433070000000000
          Width = 112.554403400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo Sangu'#237'nio')
          ParentFont = False
        end
        object Line40: TfrxLineView
          Left = 660.417750000000000000
          Top = 69.165354330000000000
          Width = 56.692950000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 2.645669290000000000
          Top = 491.338900000000000000
          Width = 237.278893400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Em qual minist'#233'rio(s) atua hoje?')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 2.645669290000000000
          Top = 514.016080000000000000
          Width = 709.720143400000000000
          Height = 51.615781370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              '(  ) Ensino  (  ) Louvor  (  ) Infantil  (  ) Ber'#231'ario  (  ) Aco' +
              'lhimento  (  ) Surdos  (  ) Som e Imagem  '
            ''
            
              '(  ) Administra'#231#227'o  (  ) PGMs  (  ) Homens  (  ) Teatro  (  ) MR' +
              '  (  ) ER  (  ) Motorista  (  ) MCM  (  ) Casais')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.220469999999980000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ficha de Cadastro')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 1024.252630000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 16.495980000000000000
          Top = 3.779529999999910000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Geek Software - Controle Pastoral')
          ParentFont = False
        end
        object Line44: TfrxLineView
          Left = 186.795300000000000000
          Top = 3.779529999999910000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 186.795300000000000000
          Top = 11.338590000000000000
          Width = 37.795300000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line47: TfrxLineView
          Left = 997.795920000000000000
          Top = 18.897650000000200000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line48: TfrxLineView
          Left = 997.795920000000000000
          Top = 11.338590000000000000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 226.031540000000000000
          Top = 3.779529999999910000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 534.425480000000000000
          Top = 3.779529999999910000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 534.425480000000000000
          Top = 11.338590000000000000
          Width = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line52: TfrxLineView
          Left = 587.338900000000000000
          Top = 3.779529999999910000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo68: TfrxMemoView
          Left = 229.811070000000000000
          Top = 3.779529999999910000
          Width = 298.582870000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FichaMembroBranco.fr3')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 592.425480000000000000
          Top = 3.779529999999910000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'gina [PAGE#] de [TOTALPAGES#]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 22
    Top = 329
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 282
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 83
    Top = 330
  end
  object cdsMembrosGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 185
    object cdsMembrosGrupoID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object cdsMembrosGrupoNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 120
    end
    object cdsMembrosGrupoID_MEMBRO: TIntegerField
      FieldName = 'ID_MEMBRO'
    end
    object cdsMembrosGrupoNOME_MEMBRO: TStringField
      FieldName = 'NOME_MEMBRO'
      Size = 120
    end
    object cdsMembrosGrupoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsMembrosGrupoCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
  end
  object frxDBMembrosGrupo: TfrxDBDataset
    UserName = 'dsMembrosGrupo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_GRUPO=ID_GRUPO'
      'NOME_GRUPO=NOME_GRUPO'
      'ID_MEMBRO=ID_MEMBRO'
      'NOME_MEMBRO=NOME_MEMBRO'
      'TELEFONE=TELEFONE'
      'CELULAR=CELULAR')
    DataSet = cdsMembrosGrupo
    BCDToCurrency = False
    Left = 40
    Top = 233
  end
end
