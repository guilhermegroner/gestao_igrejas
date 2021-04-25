inherited frm2EntradaEstoque: Tfrm2EntradaEstoque
  Caption = 'Entradas no Estoque'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited hdrTitulo: TJvGradientHeaderPanel
      LabelCaption = '.: Entradas no Estoque'
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
        OnDblClick = cxGridTV1DblClick
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total :#'
            Kind = skCount
            Column = cxGridTV_ID
            DisplayText = 'Total:'
          end>
        object cxGridTV_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object cxGridTV_NOME_FORNECEDOR: TcxGridDBColumn
          Caption = 'Fornecedor'
          DataBinding.FieldName = 'NOME_FORNECEDOR'
          Width = 348
        end
        object cxGridTV_NUMERO_NOTA: TcxGridDBColumn
          Caption = 'Nota Fiscal'
          DataBinding.FieldName = 'NUMERO_NOTA_FISCAL'
          Width = 106
        end
        object cxGridTV_DATA_EMISSAO_NOTA: TcxGridDBColumn
          Caption = 'Emitida em:'
          DataBinding.FieldName = 'DATA_EMISSAO_NOTA'
          Width = 90
        end
        object cxGridTV_DATA_ENTRADA: TcxGridDBColumn
          Caption = 'Data da Entrada'
          DataBinding.FieldName = 'DATA_ENTRADA'
          Width = 94
        end
        object cxGridTV_VALOR_NOTA: TcxGridDBColumn
          Caption = 'Valor total da Nota'
          DataBinding.FieldName = 'VALOR'
          Width = 102
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
        object lblNumeroNotaFiscal: TLabel
          Left = 387
          Top = 18
          Width = 107
          Height = 13
          Caption = 'N'#250'mero da Nota Fiscal'
        end
        object lblFornecedor: TcxLabel
          Left = 6
          Top = 14
          Caption = 'Fornecedor'
        end
        object btnLocalizar: TAdvGlowButton
          Left = 518
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
        object lcbFornecedor: TDBLookupComboBox
          Left = 6
          Top = 32
          Width = 339
          Height = 21
          ListSource = dsFornecedor
          TabOrder = 0
        end
        object edtNumeroNotaFiscal: TEdit
          Left = 387
          Top = 32
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 1
        end
        object btnLimparFornecedor: TAdvGlowButton
          Left = 349
          Top = 32
          Width = 33
          Height = 21
          Hint = 'Limpar Fornecedor'
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
          TabOrder = 4
          OnClick = btnLimparFornecedorClick
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
    object cdsNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 120
    end
    object cdsNUMERO_NOTA_FISCAL: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object cdsDATA_EMISSAO_NOTA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_EMISSAO_NOTA'
    end
    object cdsDATA_ENTRADA: TDateField
      Alignment = taCenter
      FieldName = 'DATA_ENTRADA'
    end
    object cdsVALOR: TCurrencyField
      Alignment = taCenter
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 166
    Top = 33
  end
  object dsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 246
    Top = 33
  end
end
