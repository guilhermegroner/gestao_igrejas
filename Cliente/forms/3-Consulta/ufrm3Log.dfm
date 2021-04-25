inherited frm3Log: Tfrm3Log
  Caption = 'Log'
  ClientWidth = 1019
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1019
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Width = 1019
    ExplicitWidth = 1019
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 1019
      LabelCaption = '.: Log do Sistema'
      ExplicitWidth = 1019
    end
  end
  inherited pnlRight: TPanel
    Left = 1011
    ExplicitLeft = 1011
  end
  inherited pnlBotton: TPanel
    Width = 1019
    ExplicitWidth = 1019
  end
  inherited pnlFundo: TPanel
    Width = 1003
    ExplicitWidth = 1003
    inherited pnlBotoes: TPanel
      Top = 65
      Width = 0
      Height = 410
      ExplicitTop = 65
      ExplicitWidth = 0
      ExplicitHeight = 410
      inherited btnIncluir: TAdvGlowButton
        Width = 0
        ExplicitWidth = 0
      end
      inherited btnEditar: TAdvGlowButton
        Width = 0
        ExplicitWidth = 0
      end
      inherited btnExcluir: TAdvGlowButton
        Width = 0
        ExplicitWidth = 0
      end
    end
    inherited cxGrid: TcxGrid
      Left = 0
      Top = 65
      Width = 1003
      Height = 410
      ExplicitLeft = 0
      ExplicitTop = 65
      ExplicitWidth = 1003
      ExplicitHeight = 410
      inherited cxGridTV1: TcxGridDBTableView
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
        object cxGrid_Descricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 803
        end
        object cxGrid_Data: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'DATA_LOG'
          Width = 131
        end
        object cxGrid_Nivel: TcxGridDBColumn
          Caption = 'N'#237'vel'
          DataBinding.FieldName = 'NIVEL'
          Width = 53
        end
        object cxGrid_NomeUsuario: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO'
          Width = 136
        end
      end
    end
    inherited pnlFiltros: TPanel
      Width = 1003
      Height = 65
      ExplicitWidth = 1003
      ExplicitHeight = 65
      object lbl1: TLabel
        Left = 8
        Top = 3
        Width = 48
        Height = 13
        Caption = 'Legenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shpBaixo: TShape
        Left = 7
        Top = 23
        Width = 20
        Height = 20
        Brush.Color = clLime
      end
      object lbl9: TLabel
        Left = 7
        Top = 26
        Width = 20
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '1'
      end
      object shpAlto: TShape
        Left = 207
        Top = 23
        Width = 20
        Height = 20
        Brush.Color = clRed
      end
      object lbl11: TLabel
        Left = 207
        Top = 26
        Width = 20
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '3'
      end
      object lbl2: TLabel
        Left = 33
        Top = 26
        Width = 52
        Height = 13
        Caption = 'N'#237'vel Baixo'
      end
      object lbl4: TLabel
        Left = 233
        Top = 26
        Width = 45
        Height = 13
        Caption = 'N'#237'vel Alto'
      end
      object shpNormal: TShape
        Left = 103
        Top = 23
        Width = 20
        Height = 20
        Brush.Color = clYellow
      end
      object lbl10: TLabel
        Left = 103
        Top = 26
        Width = 20
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = '2'
      end
      object lbl3: TLabel
        Left = 129
        Top = 26
        Width = 59
        Height = 13
        Caption = 'N'#237'vel Normal'
      end
      object lblFiltrar: TLabel
        Left = 307
        Top = 3
        Width = 29
        Height = 13
        Caption = 'Filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 307
        Top = 26
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object lbl7: TLabel
        Left = 404
        Top = 26
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object lbl15: TLabel
        Left = 568
        Top = 26
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object lbl8: TLabel
        Left = 515
        Top = 26
        Width = 23
        Height = 13
        Caption = 'N'#237'vel'
      end
      object edtDataInicial: TJvDateEdit
        Left = 307
        Top = 41
        Width = 91
        Height = 21
        ShowNullDate = False
        TabOrder = 0
      end
      object edtDataFinal: TJvDateEdit
        Left = 404
        Top = 41
        Width = 91
        Height = 21
        ShowNullDate = False
        TabOrder = 1
      end
      object cbbNivel: TComboBox
        Left = 515
        Top = 41
        Width = 34
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          ''
          '1'
          '2'
          '3')
      end
      object btnLocalizar: TAdvGlowButton
        Left = 800
        Top = 36
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
      object lcbUsuarios: TDBLookupComboBox
        Left = 568
        Top = 41
        Width = 189
        Height = 21
        ListSource = dsUsuarios
        TabOrder = 4
      end
      object btnLimparUsuario: TAdvGlowButton
        Left = 761
        Top = 41
        Width = 33
        Height = 21
        Hint = 'Limpar Usu'#225'rio'
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
        TabOrder = 5
        OnClick = btnLimparUsuarioClick
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
    inherited pnlPaineis: TPanel
      Left = 1003
      Top = 65
      Width = 0
      Height = 410
      ExplicitLeft = 1003
      ExplicitTop = 65
      ExplicitWidth = 0
      ExplicitHeight = 410
    end
    object btnImpPatPorSetor: TAdvGlowButton
      Left = 903
      Top = 36
      Width = 97
      Height = 26
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
      TabOrder = 4
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
    object cdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsNIVEL: TIntegerField
      Alignment = taCenter
      FieldName = 'NIVEL'
    end
    object cdsDATA_LOG: TDateTimeField
      FieldName = 'DATA_LOG'
    end
    object cdsUSUARIO: TStringField
      Alignment = taCenter
      FieldName = 'USUARIO'
      Size = 40
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
  end
  object dsUsuarios: TDataSource
    DataSet = cdsUsuarios
    Left = 632
    Top = 97
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 97
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
    ReportOptions.LastChange = 43392.962811412030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 665
    Top = 313
    Datasets = <
      item
        DataSet = DM.frxDBDadosUnidade
        DataSetName = 'dsDadosUnidade'
      end
      item
        DataSet = frxDBLog
        DataSetName = 'dsLog'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object LogSimples: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 91.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Shape4: TfrxShapeView
          Left = 0.559060000000000000
          Top = 1.000000000000000000
          Width = 1046.929810000000000000
          Height = 90.708720000000000000
        end
        object dsDadosUnidadeNOME: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.779530000000001000
          Width = 1039.370750000000000000
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
          Left = 3.779530000000000000
          Top = 24.456710000000000000
          Width = 1039.370750000000000000
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
            'CNPJ: [dsDadosUnidade."CNPJ"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.574830000000000000
          Width = 1039.370750000000000000
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
            'Log do Sistema')
          ParentFont = False
        end
        object dsDadosUnidadeENDERECO: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000000000
          Width = 1039.370750000000000000
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
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 19.553803330000000000
        Top = 215.433210000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBLog
        DataSetName = 'dsLog'
        RowCount = 0
        object Shape1: TfrxShapeView
          Width = 1046.173440710000000000
          Height = 18.897650000000000000
        end
        object dsPatrimonioSetorNUMERO_PATRIMONIO: TfrxMemoView
          Left = 2.000000000000000000
          Top = 1.889763780000010000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataField = 'ID'
          DataSet = frxDBLog
          DataSetName = 'dsLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsLog."ID"]')
          ParentFont = False
        end
        object dsPatrimonioSetorNOME: TfrxMemoView
          Left = 83.047310000000000000
          Top = 2.000000000000000000
          Width = 714.331170000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBLog
          DataSetName = 'dsLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsLog."DESCRICAO"]')
          ParentFont = False
        end
        object dsPatrimonioSetorSITUACAO: TfrxMemoView
          Left = 847.221090000000000000
          Top = 1.889763780000010000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DataField = 'USUARIO'
          DataSet = frxDBLog
          DataSetName = 'dsLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsLog."USUARIO"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 81.236240010000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 799.771865910000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 803.291900000000000000
          Top = 1.889763780000010000
          Width = 34.015665040000000000
          Height = 15.118120000000000000
          DataField = 'NIVEL'
          DataSet = frxDBLog
          DataSetName = 'dsLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsLog."NIVEL"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 952.780150000000000000
          Top = 2.779529999999994000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          DataField = 'DATA_LOG'
          DataSet = frxDBLog
          DataSetName = 'dsLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsLog."DATA_LOG"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 844.614720000000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 951.410020000000000000
          Height = 19.553803330000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
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
            'Log.fr3')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 592.425480000000000000
          Top = 3.779530000000022000
          Width = 400.630180000000000000
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
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 23.359616660000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        Condition = '<dsDadosUnidade."ID">'
        StartNewPage = True
        object Shape5: TfrxShapeView
          Left = 0.220470000000000000
          Top = 0.220470000000006000
          Width = 1046.173440710000000000
          Height = 22.677180000000000000
          Fill.BackColor = 14211288
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.692949999999996000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ID')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 847.378170000000000000
          Top = 1.692949999999996000
          Width = 102.047251420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Usu'#225'rio')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 83.606370000000000000
          Top = 2.692949999999996000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Line70: TfrxLineView
          Left = 81.236240010000000000
          Top = 0.026283330000012480
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 951.410020000000000000
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo6: TfrxMemoView
          Left = 803.291900000000000000
          Top = 2.779529999999994000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#237'vel')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 799.771865910000000000
          Height = 23.333333330000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo1: TfrxMemoView
          Left = 952.780150000000000000
          Top = 2.779529999999994000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 844.614720000000000000
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
    Left = 665
    Top = 361
  end
  object frxDBLog: TfrxDBDataset
    UserName = 'dsLog'
    CloseDataSource = False
    DataSet = cds
    BCDToCurrency = False
    Left = 728
    Top = 313
  end
end
