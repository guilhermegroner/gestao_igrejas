inherited frm2Patrimonio: Tfrm2Patrimonio
  Caption = 'Patrim'#244'nios'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited hdrTitulo: TJvGradientHeaderPanel
      LabelCaption = '.:Patrim'#244'nios Cadastrados'
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
            Column = cxGrid_ID
            DisplayText = 'Total:'
          end>
        object cxGrid_ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object cxGrid_NOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          Width = 525
        end
        object cxGrid_SITUACAO: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'SITUACAO'
          Width = 129
        end
        object cxGrid_NumeroPatrimonio: TcxGridDBColumn
          Caption = 'N'#250'mero do Patrim'#244'nio'
          DataBinding.FieldName = 'NUMERO_PATRIMONIO'
          Width = 145
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
        object lblNumeroPatrimonio: TLabel
          Left = 387
          Top = 18
          Width = 105
          Height = 13
          Caption = 'N'#250'mero do Patrim'#244'nio'
        end
        object lblSituacaoPatrimonio: TLabel
          Left = 514
          Top = 18
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
        end
        object lblCampo: TcxLabel
          Left = 6
          Top = 14
          Caption = 'Setor'
        end
        object btnLocalizar: TAdvGlowButton
          Left = 671
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
        object lcbSetor: TDBLookupComboBox
          Left = 6
          Top = 32
          Width = 339
          Height = 21
          ListSource = dsSetor
          TabOrder = 0
        end
        object edtNumeroPatrimonio: TEdit
          Left = 387
          Top = 32
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 1
        end
        object cbbSituacaoPatrimonio: TComboBox
          Left = 514
          Top = 32
          Width = 145
          Height = 21
          TabOrder = 2
          OnExit = cbbSituacaoPatrimonioExit
          Items.Strings = (
            'Baixado'
            'Ativo'
            'Transferido')
        end
        object btnLimparSetor: TAdvGlowButton
          Left = 349
          Top = 32
          Width = 33
          Height = 21
          Hint = 'Limpar Setor'
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
          OnClick = btnLimparSetorClick
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
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsSITUACAO: TStringField
      Alignment = taCenter
      FieldName = 'SITUACAO'
      Size = 15
    end
    object cdsNUMERO_PATRIMONIO: TIntegerField
      FieldName = 'NUMERO_PATRIMONIO'
    end
  end
  inherited Style: TcxStyleRepository
    PixelsPerInch = 96
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 30
  end
  object dsSetor: TDataSource
    DataSet = cdsSetor
    Left = 192
    Top = 30
  end
end
