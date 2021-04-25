inherited frm2BaixaPatrimonio: Tfrm2BaixaPatrimonio
  Caption = ''
  ClientHeight = 464
  ClientWidth = 718
  OnCreate = FormCreate
  ExplicitWidth = 724
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 718
    Height = 464
    ExplicitWidth = 718
    ExplicitHeight = 464
    inherited pnlBotton: TPanel
      Top = 423
      Width = 718
      ExplicitTop = 423
      ExplicitWidth = 718
      inherited btnSalvar: TAdvGlowButton
        Left = 517
        ExplicitLeft = 517
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 617
        ExplicitLeft = 617
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 718
      LabelCaption = '.: Baixa de Patrim'#244'nio'
      ExplicitWidth = 718
    end
    object pnlDadosBaixa: TPanel
      Left = 0
      Top = 21
      Width = 718
      Height = 124
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object grpDados: TGroupBox
        Left = 0
        Top = 0
        Width = 718
        Height = 124
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object lblDataBaixa: TLabel
          Left = 6
          Top = 6
          Width = 76
          Height = 13
          Caption = '* Data da Baixa'
        end
        object lblNumeroPatrimonio: TLabel
          Left = 6
          Top = 54
          Width = 90
          Height = 13
          Caption = 'N'#250'mero Patrim'#244'nio'
        end
        object lblBensBaixados: TLabel
          Left = 3
          Top = 108
          Width = 174
          Height = 13
          Caption = 'Patrim'#244'nios a serem baixados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNomePatrimonio: TLabel
          Left = 128
          Top = 54
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object lblMotivoBaixa: TLabel
          Left = 133
          Top = 6
          Width = 85
          Height = 13
          Caption = '* Motivo da Baixa'
          Visible = False
        end
        object btnAddItemBaixar: TAdvGlowButton
          Left = 614
          Top = 60
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
          OnClick = btnAddItemBaixarClick
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
        object edtCodigoPatrimonio: TcxTextEdit
          Left = 6
          Top = 72
          Style.Color = clSkyBlue
          TabOrder = 1
          OnExit = edtCodigoPatrimonioExit
          OnKeyPress = edtCodigoPatrimonioKeyPress
          Width = 121
        end
        object edtNomePatrimonio: TcxTextEdit
          Left = 128
          Top = 72
          Enabled = False
          TabOrder = 3
          Width = 482
        end
        object edtDataBaixa: TJvDateEdit
          Left = 6
          Top = 23
          Width = 121
          Height = 21
          DefaultToday = True
          ShowNullDate = False
          TabOrder = 0
        end
        object lcbMotivoBaixa: TDBLookupComboBox
          Left = 133
          Top = 23
          Width = 388
          Height = 21
          ListSource = dsMotivoBaixa
          TabOrder = 4
          Visible = False
        end
        object btnIncluirMotivo: TAdvGlowButton
          Left = 523
          Top = 23
          Width = 33
          Height = 21
          Cursor = crHandPoint
          Hint = 'Incluir Motivo'
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
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000000473424954080808087C086488000000097048597300000B1300000B
            1301009A9C18000001C349444154388DA5533B4B5C41183DDFCCDEF5B158081A
            443008E2AB308FDD5416E96C6C942C621A89C1269DC447A5100B8B588810315D
            50CB80B2B885BF41512C12D1F828522A491412AEBB7BE7CE7C16CB9DDD9BBDD9
            26A71898F39D39E730C300FF098A221FEF4F3E31420C13A10BC630049D1B3299
            E3D4872F550D5287534D9ED69B24C560641C73D657F4FAA47FE5A6C2207538D5
            A4D83F02C9B66A950DF377AAA94D7E7DF4FE16004430C82BB5FDF7E1770F4630
            DF9C0E1908A276E4729FED1E00927BD329E9C49E5734F60DD837152D488A81BE
            83B77DD6C05385996AB5A3C09E9A06801800B0A06430586819B5A2DE786B91AB
            29710B57B6FD336B406C6A03D673F3A514076036212E8061D4951A68F30BC043
            0058BCDE2AA5C55E42B30E71A2DE010090323FAD81CEEB5D99C0D3724151555C
            425CD020A7B240F08C6E6EC5770BBA42F50FA83F057557F0D66C0600746727E6
            E2CD894572A415EADF798000D960AF08EC69783FDC99B3A14FCB210330A82B3B
            FED1694CBC91F5F1C864ED7AD0B777ABDF86D62741E0B041D024F32A4D522E89
            44BC8362020482511ACA5517A4F5ECF98B8D9D727DE46F04837A32639D4CB29B
            98980C9F9DA6372E83D472DC03FF09AAC657E8F5DF0000000049454E44AE4260
            82}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
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
    object pnlItensBaixados: TPanel
      Left = 0
      Top = 145
      Width = 718
      Height = 278
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object cxGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 718
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
          Styles.ContentEven = cxStyleZebrado
          Styles.Header = cxStyleTituloGrid
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
    Left = 144
    Top = 288
    object cdsNUMERO_PATRIMONIO: TIntegerField
      Alignment = taCenter
      FieldName = 'NUMERO_PATRIMONIO'
    end
    object cdsNOME_PATRIMONIO: TStringField
      FieldName = 'NOME_PATRIMONIO'
      Size = 120
    end
  end
  inherited ds: TDataSource
    Left = 176
    Top = 288
  end
  object Style: TcxStyleRepository
    Left = 520
    Top = 184
    PixelsPerInch = 96
    object cxStyleZebrado: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clDefault
    end
    object cxStyleTituloGrid: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
  object cdsMotivoBaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 24
  end
  object dsMotivoBaixa: TDataSource
    DataSet = cdsMotivoBaixa
    Left = 356
    Top = 23
  end
end
