inherited frm4Estoque: Tfrm4Estoque
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
          'Estoque'
          'Entradas por Per'#237'odo'
          'Sa'#237'das por Per'#237'odo')
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
      Properties.ActivePage = tsSaidasPeriodo
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 9
      ClientRectBottom = 355
      ClientRectRight = 410
      ClientRectTop = 20
      object tsEstoque: TcxTabSheet
        AllowCloseButton = False
        Caption = 'Estoque'
        ImageIndex = 0
        object grpEstoque: TGroupBox
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
          object lcbGrupo: TDBLookupComboBox
            Left = 5
            Top = 43
            Width = 332
            Height = 21
            Cursor = crHandPoint
            ListSource = dsGrupo
            TabOrder = 0
          end
          object btnImpPatPorSetor: TAdvGlowButton
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
            OnClick = btnImpPatPorSetorClick
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
          object pnlEstoque: TJvGradientHeaderPanel
            Left = 1
            Top = 3
            Width = 406
            Height = 23
            GradientStartColor = 15234048
            GradientStyle = grHorizontal
            LabelTop = 5
            LabelCaption = '.: Estoque'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWhite
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            LabelAlignment = taLeftJustify
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
      object tsSaidasPeriodo: TcxTabSheet
        Caption = 'Sa'#237'das Per'#237'odo'
        ImageIndex = 1
        object grpSaidasPeriodo: TGroupBox
          Left = 0
          Top = 0
          Width = 410
          Height = 335
          Align = alClient
          TabOrder = 0
          Visible = False
          object btnImprimirSaidasPeriodo: TAdvGlowButton
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
            TabOrder = 0
            OnClick = btnImprimirSaidasPeriodoClick
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
          object JvGradientHeaderPanel1: TJvGradientHeaderPanel
            Left = 1
            Top = 3
            Width = 406
            Height = 23
            GradientStartColor = 15234048
            GradientStyle = grHorizontal
            LabelTop = 5
            LabelCaption = '.: Sa'#237'das por Per'#237'odo'
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWhite
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = [fsBold]
            LabelAlignment = taLeftJustify
            TabOrder = 1
          end
        end
      end
    end
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 53
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 480
    Top = 53
  end
  object frxReport: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43357.746326180600000000
    ReportOptions.LastChange = 43490.510280312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 25
    Top = 121
    Datasets = <
      item
        DataSet = DM.frxDBDadosUnidade
        DataSetName = 'dsDadosUnidade'
      end
      item
        DataSet = frxDBSaidasPeriodo
        DataSetName = 'dsEstoqueSaidasPeriodo'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PatrimonioPorSetor: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Left = 0.559060000000000000
          Top = 1.000000000000000000
          Width = 714.331170000000000000
          Height = 83.149660000000000000
        end
        object dsDadosUnidadeNOME: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.779530000000001000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsDadosUnidade."NOME"]')
          ParentFont = False
        end
        object dsDadosUnidadeCNPJ: TfrxMemoView
          Left = 294.803340000000000000
          Top = 24.456710000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsDadosUnidade."CNPJ"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 257.008040000000000000
          Top = 24.456710000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.574830000000000000
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
            'Estoque Sa'#237'das por Per'#237'odo')
          ParentFont = False
        end
        object dsDadosUnidadeENDERECO: TfrxMemoView
          Left = 34.015770000000000000
          Top = 41.574830000000000000
          Width = 650.079160000000000000
          Height = 18.897650000000000000
          DataSet = DM.frxDBDadosUnidade
          DataSetName = 'dsDadosUnidade'
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[dsDadosUnidade."ENDERECO"], [dsDadosUnidade."ENDERECO_NUMERO"] ' +
              '- [dsDadosUnidade."ENDERECO_BAIRRO"] - [dsDadosUnidade."CIDADE"]' +
              ' - [dsDadosUnidade."CEP"] - [dsDadosUnidade."UF"]')
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
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 19.553803330000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        DataSet = frxDBSaidasPeriodo
        DataSetName = 'dsEstoqueSaidasPeriodo'
        RowCount = 0
        object Shape1: TfrxShapeView
          Width = 717.354330710000000000
          Height = 18.897650000000000000
        end
        object dsPatrimonioSetorNOME: TfrxMemoView
          Left = 2.645669290000000000
          Top = 2.000000000000000000
          Width = 404.409710000000000000
          Height = 15.118120000000000000
          DataField = 'ITEM'
          DataSet = frxDBSaidasPeriodo
          DataSetName = 'dsEstoqueSaidasPeriodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsEstoqueSaidasPeriodo."ITEM"]')
          ParentFont = False
        end
        object dsPatrimonioSetorSITUACAO: TfrxMemoView
          Left = 409.968770000000000000
          Top = 1.889763780000010000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDBSaidasPeriodo
          DataSetName = 'dsEstoqueSaidasPeriodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsEstoqueSaidasPeriodo."QUANTIDADE"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 630.590910000000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 521.818897640000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
        object Line1: TfrxLineView
          Left = 408.189240000000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        object Memo28: TfrxMemoView
          Left = 16.495980000000000000
          Top = 3.779530000000022000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Geek Software - Gest'#227'o Empresarial')
          ParentFont = False
        end
        object Line44: TfrxLineView
          Left = 186.795300000000000000
          Top = 3.779529999999965000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 186.795300000000000000
          Top = 11.338590000000120000
          Width = 37.795300000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line47: TfrxLineView
          Left = 997.795920000000000000
          Top = 18.897650000000230000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line48: TfrxLineView
          Left = 997.795920000000000000
          Top = 11.338590000000120000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 226.031540000000000000
          Top = 3.779529999999965000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 534.425480000000000000
          Top = 3.779529999999965000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 534.425480000000000000
          Top = 11.338590000000120000
          Width = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line52: TfrxLineView
          Left = 587.338900000000000000
          Top = 3.779529999999965000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo29: TfrxMemoView
          Left = 229.811070000000000000
          Top = 3.779530000000022000
          Width = 298.582870000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque-Saida-Periodo.fr3')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 592.425480000000000000
          Top = 3.779529999999965000
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
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        Condition = '<dsEstoqueSaidasPeriodo."DATA_SAIDA">'
        object frdsBaixaCartoesCSI_NOMSOC: TfrxMemoView
          Left = 116.740260000000000000
          Top = 7.559059999999988000
          Width = 676.535870000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_SAIDA'
          DataSet = frxDBSaidasPeriodo
          DataSetName = 'dsEstoqueSaidasPeriodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsEstoqueSaidasPeriodo."DATA_SAIDA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data da Sa'#237'da:')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 23.359616660000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        Condition = '<dsEstoqueSaidasPeriodo."DATA_SAIDA">'
        StartNewPage = True
        object Shape5: TfrxShapeView
          Left = 0.220470000000000000
          Top = 0.220470000000006000
          Width = 717.354330710000000000
          Height = 22.677180000000000000
          Fill.BackColor = 14211288
        end
        object Memo4: TfrxMemoView
          Left = 631.559060000000000000
          Top = 1.692949999999996000
          Width = 83.149601420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Venda')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 2.606370000000000000
          Top = 2.692949999999996000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 630.590910000000000000
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo6: TfrxMemoView
          Left = 525.000310000000000000
          Top = 2.779529999999994000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Compra')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 521.952755910000000000
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo9: TfrxMemoView
          Left = 410.236794090000000000
          Top = 2.779529999999994000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtde Sa'#237'da')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 408.189240000000000000
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
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
    Left = 25
    Top = 169
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 118
    Top = 137
    object cdsEstoqueID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsEstoqueNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 120
    end
    object cdsEstoqueID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
    object cdsEstoqueNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 120
    end
    object cdsEstoqueUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 120
    end
    object cdsEstoqueQUANTIDADE_ATUAL: TIntegerField
      FieldName = 'QUANTIDADE_ATUAL'
    end
  end
  object frxDBEstoque: TfrxDBDataset
    UserName = 'dsEstoque'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PRODUTO=ID_PRODUTO'
      'NOME_PRODUTO=NOME_PRODUTO'
      'ID_GRUPO=ID_GRUPO'
      'NOME_GRUPO=NOME_GRUPO'
      'UNIDADE=UNIDADE'
      'QUANTIDADE_ATUAL=QUANTIDADE_ATUAL')
    DataSet = cdsEstoque
    BCDToCurrency = False
    Left = 118
    Top = 185
  end
  object frxDBSaidasPeriodo: TfrxDBDataset
    UserName = 'dsEstoqueSaidasPeriodo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ITEM=ITEM'
      'DATA_SAIDA=DATA_SAIDA'
      'QUANTIDADE=QUANTIDADE')
    DataSet = cdsSaidasPeriodo
    BCDToCurrency = False
    Left = 38
    Top = 281
  end
  object cdsSaidasPeriodo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 233
    object cdsSaidasPeriodoITEM: TStringField
      FieldName = 'ITEM'
      Size = 120
    end
    object cdsSaidasPeriodoDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
    end
    object cdsSaidasPeriodoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
end
