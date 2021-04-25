inherited frm2Membro: Tfrm2Membro
  Caption = 'Membros'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited hdrTitulo: TJvGradientHeaderPanel
      LabelCaption = '.: Membros Cadastrados'
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
      object btnImprimirFicha: TAdvGlowButton
        Left = 0
        Top = 96
        Width = 185
        Height = 48
        Align = alTop
        Action = actImprimirFicha
        ImageIndex = 10
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
          Width = 464
        end
        object cxGrid_CPF: TcxGridDBColumn
          DataBinding.FieldName = 'CPF'
          Width = 159
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
              TabOrder = 1
              OnExit = edtFiltroExit
            end
          end
        end
        object lblCampo: TcxLabel
          Left = 6
          Top = 12
          Caption = 'Campo'
        end
        object lblCondicao: TcxLabel
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
            'Nome')
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
    Left = 24
    Top = 288
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
    object actImprimirFicha: TAction
      Caption = 'Imprimir Ficha'
      ImageIndex = 10
      OnExecute = actImprimirFichaExecute
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
    object cdsCPF: TStringField
      Alignment = taCenter
      FieldName = 'CPF'
      Size = 14
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
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
    ReportOptions.LastChange = 43392.898919004630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 113
    Top = 297
    Datasets = <
      item
        DataSet = DM.frxDBDadosUnidade
        DataSetName = 'dsDadosUnidade'
      end
      item
        DataSet = frxDBFichaMembro
        DataSetName = 'dsFichaMembro'
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
          Top = 0.779530000000001200
          Width = 714.331170000000000000
          Height = 94.488250000000000000
        end
        object dsDadosUnidadeNOME: TfrxMemoView
          Left = 5.000000000000000000
          Top = 1.559059999999999000
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
          Top = 56.692949999999990000
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
        Height = 733.228820000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = frxDBFichaMembro
        DataSetName = 'dsFichaMembro'
        RowCount = 0
        object Shape2: TfrxShapeView
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo5: TfrxMemoView
          Left = 1.779530000000000000
          Top = 3.779529999999994000
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
          Top = 30.236239999999980000
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
        object Memo41: TfrxMemoView
          Left = 47.441607380000000000
          Top = 31.188681559999990000
          Width = 445.553673580000000000
          Height = 16.000010330000000000
          DataField = 'NOME'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."NOME"]')
        end
        object Memo6: TfrxMemoView
          Left = 2.338590000000000000
          Top = 52.692950000000030000
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
        object Memo7: TfrxMemoView
          Left = 108.622140000000000000
          Top = 52.692950000000030000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'DATA_NASCIMENTO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."DATA_NASCIMENTO"]')
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
        object Memo9: TfrxMemoView
          Left = 137.622140000000000000
          Top = 77.023622050000000000
          Width = 128.073153580000000000
          Height = 16.000010330000000000
          DataField = 'GRAU_INSTRUCAO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."GRAU_INSTRUCAO"]')
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
        object Memo12: TfrxMemoView
          Left = 345.984540000000000000
          Top = 77.023622050000000000
          Width = 230.120463580000000000
          Height = 16.000010330000000000
          DataField = 'PROFISSAO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."PROFISSAO"]')
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
        object Memo14: TfrxMemoView
          Left = 627.283860000000000000
          Top = 77.133889999999970000
          Width = 86.498323580000000000
          Height = 16.000010330000000000
          DataField = 'SEXO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."SEXO"]')
        end
        object Memo15: TfrxMemoView
          Left = 1.779530000000000000
          Top = 98.590600000000030000
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
          Top = 98.590600000000030000
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
        object Memo18: TfrxMemoView
          Left = 103.047310000000000000
          Top = 99.590600000000030000
          Width = 611.852993580000000000
          Height = 16.000010330000000000
          DataField = 'NOME_PAI'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."NOME_PAI"]')
        end
        object Memo19: TfrxMemoView
          Left = 107.385900000000000000
          Top = 121.488250000000000000
          Width = 608.073463580000000000
          Height = 16.000010330000000000
          DataField = 'NOME_MAE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."NOME_MAE"]')
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
        object Memo21: TfrxMemoView
          Left = 96.267780000000000000
          Top = 143.944960000000000000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'ESTADO_CIVIL'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."ESTADO_CIVIL"]')
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
        object Memo23: TfrxMemoView
          Left = 347.700990000000000000
          Top = 144.165430000000000000
          Width = 366.183543580000000000
          Height = 16.000010330000000000
          DataField = 'NOME_CONJUGE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."NOME_CONJUGE"]')
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
        object Memo25: TfrxMemoView
          Left = 127.063080000000000000
          Top = 164.842610000000000000
          Width = 75.159733580000100000
          Height = 16.000010330000000000
          DataField = 'DATA_CASAMENTO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."DATA_CASAMENTO"]')
        end
        object Memo26: TfrxMemoView
          Left = 204.889920000000000000
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
        object Memo27: TfrxMemoView
          Left = 301.582870000000000000
          Top = 166.622140000000000000
          Width = 218.781873580000000000
          Height = 16.000010330000000000
          DataField = 'NATURALIDADE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."NATURALIDADE"]')
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
        object Memo29: TfrxMemoView
          Left = 631.842920000000000000
          Top = 166.622140000000000000
          Width = 82.718793580000000000
          Height = 16.000010330000000000
          DataField = 'NACIONALIDADE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."NACIONALIDADE"]')
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
        object Memo32: TfrxMemoView
          Left = 79.842610000000000000
          Top = 215.086702050000000000
          Width = 532.482863580000000000
          Height = 16.000010330000000000
          DataField = 'ENDERECO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."ENDERECO"]')
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
        object Memo34: TfrxMemoView
          Left = 655.079160000000000000
          Top = 213.976500000000000000
          Width = 60.041613580000000000
          Height = 16.000010330000000000
          DataField = 'ENDERECO_NUMERO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."ENDERECO_NUMERO"]')
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
        object Memo36: TfrxMemoView
          Left = 56.842610000000000000
          Top = 234.984352050000000000
          Width = 199.884223580000000000
          Height = 16.000010330000000000
          DataField = 'ENDERECO_BAIRRO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."ENDERECO_BAIRRO"]')
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
        object Memo38: TfrxMemoView
          Left = 335.543600000000000000
          Top = 234.984352050000000000
          Width = 120.514093580000000000
          Height = 16.000010330000000000
          DataField = 'TELEFONE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."TELEFONE"]')
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
        object Memo40: TfrxMemoView
          Left = 523.858690000000000000
          Top = 235.984352050000000000
          Width = 120.514093580000000000
          Height = 16.000010330000000000
          DataField = 'CELULAR'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."CELULAR"]')
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
        object Memo43: TfrxMemoView
          Left = 64.472480000000000000
          Top = 257.330860000000000000
          Width = 313.270123580000000000
          Height = 16.000010330000000000
          DataField = 'CIDADE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."CIDADE"]')
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
        object Memo45: TfrxMemoView
          Left = 414.488560000000000000
          Top = 256.661532050000000000
          Width = 120.514093580000000000
          Height = 16.000010330000000000
          DataField = 'UF'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."UF"]')
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
        object Memo47: TfrxMemoView
          Left = 581.449290000000000000
          Top = 256.661532050000000000
          Width = 120.514093580000000000
          Height = 16.000010330000000000
          DataField = 'CEP'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."CEP"]')
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
          Top = 282.008040000000100000
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
          Top = 304.685220000000100000
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
        object Memo50: TfrxMemoView
          Left = 177.858380000000000000
          Top = 306.464750000000000000
          Width = 536.262393580000000000
          Height = 16.000010330000000000
          DataField = 'IGREJA_BATISMO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."IGREJA_BATISMO"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 1.779530000000000000
          Top = 324.582870000000100000
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
        object Memo52: TfrxMemoView
          Left = 158.637910000000000000
          Top = 326.362400000000000000
          Width = 555.160043580000000000
          Height = 16.000010330000000000
          DataField = 'PASTOR_BATISMO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."PASTOR_BATISMO"]')
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
        object Memo54: TfrxMemoView
          Left = 107.283550000000000000
          Top = 347.260050000000000000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'DATA_ADMISSAO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."DATA_ADMISSAO"]')
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
        object Memo56: TfrxMemoView
          Left = 346.732530000000000000
          Top = 347.260050000000000000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'MODO_ADMISSAO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."MODO_ADMISSAO"]')
        end
        object Memo57: TfrxMemoView
          Left = 2.779530000000000000
          Top = 368.937230000000000000
          Width = 218.381243400000000000
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
        object Memo58: TfrxMemoView
          Left = 224.992270000000000000
          Top = 369.937230000000000000
          Width = 490.908033580000000000
          Height = 16.000010330000000000
          DataField = 'IGREJAS_FOI_MEMBRO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."IGREJAS_FOI_MEMBRO"]')
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
          Top = 395.393940000000100000
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
        object Memo61: TfrxMemoView
          Left = 85.063080000000000000
          Top = 420.850650000000000000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'DIZIMISTA'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."DIZIMISTA"]')
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
        object Memo63: TfrxMemoView
          Left = 285.378170000000000000
          Top = 420.850650000000000000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'OFERTANTE'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."OFERTANTE"]')
        end
        object Memo64: TfrxMemoView
          Left = 2.779530000000000000
          Top = 442.307360000000000000
          Width = 233.499363400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o que j'#225' exerceu na Igreja:')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 239.330860000000000000
          Top = 444.086890000000100000
          Width = 475.789913580000000000
          Height = 16.000010330000000000
          DataField = 'FUNCAO_EXERCEU_IGREJA'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."FUNCAO_EXERCEU_IGREJA"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 2.779530000000000000
          Top = 467.205010000000000000
          Width = 233.499363400000000000
          Height = 17.600011370000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Pitch = fpVariable
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o que gostaria de exercer:')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 239.330860000000000000
          Top = 468.984540000000100000
          Width = 475.789913580000000000
          Height = 16.000010330000000000
          DataField = 'FUNCAO_GOSTARIA_EXERCER'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsFichaMembro."FUNCAO_GOSTARIA_EXERCER"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 225.771800000000000000
          Top = 52.535433069999980000
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
        object Memo70: TfrxMemoView
          Left = 267.055350000000000000
          Top = 52.535433069999980000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'CPF'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."CPF"]')
        end
        object Memo71: TfrxMemoView
          Left = 384.764070000000000000
          Top = 52.535433069999980000
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
        object Memo72: TfrxMemoView
          Left = 422.047620000000000000
          Top = 52.535433069999980000
          Width = 112.955033580000000000
          Height = 16.000010330000000000
          DataField = 'RG'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."RG"]')
        end
        object Shape6: TfrxShapeView
          Top = 491.338900000000100000
          Width = 718.110700000000000000
          Height = 24.415763800000000000
          Fill.BackColor = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo73: TfrxMemoView
          Left = 2.779530000000000000
          Top = 495.118430000000000000
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
        object dsFichaMembroOBSERVACAO: TfrxMemoView
          Left = 1.779530000000000000
          Top = 520.354670000000100000
          Width = 714.331170000000000000
          Height = 188.976500000000000000
          DataField = 'OBSERVACAO'
          DataSet = frxDBFichaMembro
          DataSetName = 'dsFichaMembro'
          Memo.UTF8W = (
            '[dsFichaMembro."OBSERVACAO"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.220469999999977000
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
        Top = 1020.473100000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 16.495980000000000000
          Top = 3.779529999999908000
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
          Top = 3.779529999999908000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 186.795300000000000000
          Top = 11.338589999999950000
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
          Top = 11.338589999999950000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 226.031540000000000000
          Top = 3.779529999999908000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 534.425480000000000000
          Top = 3.779529999999908000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 534.425480000000000000
          Top = 11.338589999999950000
          Width = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line52: TfrxLineView
          Left = 587.338900000000000000
          Top = 3.779529999999908000
          Height = 15.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo68: TfrxMemoView
          Left = 229.811070000000000000
          Top = 3.779529999999908000
          Width = 298.582870000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FichaMembro.fr3')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 592.425480000000000000
          Top = 3.779529999999908000
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
    Left = 113
    Top = 345
  end
  object cdsFichaMembro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 393
    object cdsFichaMembroID: TIntegerField
      FieldName = 'ID'
    end
    object cdsFichaMembroNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsFichaMembroDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsFichaMembroGRAU_INSTRUCAO: TStringField
      FieldName = 'GRAU_INSTRUCAO'
      Size = 29
    end
    object cdsFichaMembroPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 120
    end
    object cdsFichaMembroSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object cdsFichaMembroNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 120
    end
    object cdsFichaMembroNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 120
    end
    object cdsFichaMembroESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 13
    end
    object cdsFichaMembroNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      Size = 120
    end
    object cdsFichaMembroDATA_CASAMENTO: TDateField
      FieldName = 'DATA_CASAMENTO'
    end
    object cdsFichaMembroNATURALIDADE: TStringField
      FieldName = 'NATURALIDADE'
      Size = 120
    end
    object cdsFichaMembroNACIONALIDADE: TStringField
      FieldName = 'NACIONALIDADE'
      Size = 11
    end
    object cdsFichaMembroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object cdsFichaMembroENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      Size = 10
    end
    object cdsFichaMembroENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      Size = 60
    end
    object cdsFichaMembroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 120
    end
    object cdsFichaMembroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsFichaMembroCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object cdsFichaMembroCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object cdsFichaMembroUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsFichaMembroIGREJA_BATISMO: TStringField
      FieldName = 'IGREJA_BATISMO'
      Size = 120
    end
    object cdsFichaMembroPASTOR_BATISMO: TStringField
      FieldName = 'PASTOR_BATISMO'
      Size = 120
    end
    object cdsFichaMembroDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
    object cdsFichaMembroMODO_ADMISSAO: TStringField
      FieldName = 'MODO_ADMISSAO'
      Size = 13
    end
    object cdsFichaMembroIGREJAS_FOI_MEMBRO: TStringField
      FieldName = 'IGREJAS_FOI_MEMBRO'
      Size = 120
    end
    object cdsFichaMembroDIZIMISTA: TStringField
      FieldName = 'DIZIMISTA'
      Size = 3
    end
    object cdsFichaMembroOFERTANTE: TStringField
      FieldName = 'OFERTANTE'
      Size = 3
    end
    object cdsFichaMembroFUNCAO_GOSTARIA_EXERCER: TStringField
      FieldName = 'FUNCAO_GOSTARIA_EXERCER'
    end
    object cdsFichaMembroFUNCAO_EXERCEU_IGREJA: TStringField
      FieldName = 'FUNCAO_EXERCEU_IGREJA'
      Size = 120
    end
    object cdsFichaMembroDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
    end
    object cdsFichaMembroCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFichaMembroRG: TStringField
      FieldName = 'RG'
      Size = 9
    end
    object cdsFichaMembroOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 500
    end
  end
  object frxDBFichaMembro: TfrxDBDataset
    UserName = 'dsFichaMembro'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'DATA_NASCIMENTO=DATA_NASCIMENTO'
      'GRAU_INSTRUCAO=GRAU_INSTRUCAO'
      'PROFISSAO=PROFISSAO'
      'SEXO=SEXO'
      'NOME_PAI=NOME_PAI'
      'NOME_MAE=NOME_MAE'
      'ESTADO_CIVIL=ESTADO_CIVIL'
      'NOME_CONJUGE=NOME_CONJUGE'
      'DATA_CASAMENTO=DATA_CASAMENTO'
      'NATURALIDADE=NATURALIDADE'
      'NACIONALIDADE=NACIONALIDADE'
      'ENDERECO=ENDERECO'
      'ENDERECO_NUMERO=ENDERECO_NUMERO'
      'ENDERECO_BAIRRO=ENDERECO_BAIRRO'
      'CIDADE=CIDADE'
      'TELEFONE=TELEFONE'
      'CELULAR=CELULAR'
      'CEP=CEP'
      'UF=UF'
      'IGREJA_BATISMO=IGREJA_BATISMO'
      'PASTOR_BATISMO=PASTOR_BATISMO'
      'DATA_ADMISSAO=DATA_ADMISSAO'
      'MODO_ADMISSAO=MODO_ADMISSAO'
      'IGREJAS_FOI_MEMBRO=IGREJAS_FOI_MEMBRO'
      'DIZIMISTA=DIZIMISTA'
      'OFERTANTE=OFERTANTE'
      'FUNCAO_GOSTARIA_EXERCER=FUNCAO_GOSTARIA_EXERCER'
      'FUNCAO_EXERCEU_IGREJA=FUNCAO_EXERCEU_IGREJA'
      'DATA_SAIDA=DATA_SAIDA'
      'CPF=CPF'
      'RG=RG'
      'OBSERVACAO=OBSERVACAO')
    DataSet = cdsFichaMembro
    BCDToCurrency = False
    Left = 112
    Top = 441
  end
end
