inherited frm1Membro: Tfrm1Membro
  Caption = ''
  ClientHeight = 518
  ClientWidth = 800
  ExplicitWidth = 806
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 800
    Height = 518
    ExplicitWidth = 800
    ExplicitHeight = 518
    inherited pnlBotton: TPanel
      Top = 477
      Width = 800
      ExplicitTop = 477
      ExplicitWidth = 800
      inherited btnSalvar: TAdvGlowButton
        Left = 599
        ExplicitLeft = 599
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 699
        ExplicitLeft = 699
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 800
      LabelCaption = '.: Membro'
      ExplicitWidth = 800
    end
    object pcInfoMembro: TcxPageControl
      Left = 0
      Top = 21
      Width = 800
      Height = 456
      Align = alClient
      TabOrder = 2
      Properties.ActivePage = tbDadosMembro
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 9
      ClientRectBottom = 456
      ClientRectRight = 800
      ClientRectTop = 20
      object tbDadosMembro: TcxTabSheet
        Caption = 'Identifica'#231#227'o'
        ImageIndex = 0
        object grpInformacoesPessoais: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 794
          Height = 150
          Align = alTop
          Caption = 'Informa'#231#245'es Pessoais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblNome: TLabel
            Left = 6
            Top = 13
            Width = 36
            Height = 13
            Caption = '* Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCpf: TLabel
            Left = 419
            Top = 13
            Width = 19
            Height = 13
            Caption = 'CPF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblIdentidade: TLabel
            Left = 567
            Top = 13
            Width = 74
            Height = 13
            Caption = 'Identidade(RG)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblEstadoCivil: TLabel
            Left = 6
            Top = 61
            Width = 55
            Height = 13
            Caption = 'Estado Civil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDataNascimento: TLabel
            Left = 125
            Top = 61
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblSexo: TLabel
            Left = 265
            Top = 61
            Width = 24
            Height = 13
            Caption = 'Sexo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblTelefone: TLabel
            Left = 384
            Top = 60
            Width = 42
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCelular: TLabel
            Left = 590
            Top = 60
            Width = 33
            Height = 13
            Caption = 'Celular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblGrauInstrucao: TLabel
            Left = 6
            Top = 107
            Width = 87
            Height = 13
            Caption = 'Grau de Instru'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblEmail: TLabel
            Left = 202
            Top = 107
            Width = 28
            Height = 13
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblProfissao: TLabel
            Left = 525
            Top = 107
            Width = 47
            Height = 13
            Caption = 'Profiss'#227'o '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblTipoSanguineo: TLabel
            Left = 709
            Top = 13
            Width = 73
            Height = 13
            Caption = 'Tipo Sangu'#237'neo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtNome: TDBEdit
            Left = 6
            Top = 32
            Width = 408
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'NOME'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edtCpf: TDBEdit
            Left = 419
            Top = 32
            Width = 142
            Height = 21
            Color = clWhite
            DataField = 'CPF'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtIdentidade: TDBEdit
            Left = 565
            Top = 32
            Width = 138
            Height = 21
            DataField = 'RG'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cbbEstadoCivil: TDBComboBox
            Left = 6
            Top = 77
            Width = 113
            Height = 21
            Style = csDropDownList
            DataField = 'ESTADO_CIVIL'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Solteiro(a)'
              'Casado(a)'
              'Vi'#250'vo(a)'
              'Separado(a)'
              'N'#227'o Informado')
            ParentFont = False
            TabOrder = 4
          end
          object edtDataNascimento: TJvDBDateEdit
            Left = 125
            Top = 77
            Width = 134
            Height = 21
            DataField = 'DATA_NASCIMENTO'
            DataSource = ds
            DialogTitle = 'Selecione uma Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 5
          end
          object cbbSexo: TDBComboBox
            Left = 265
            Top = 77
            Width = 113
            Height = 21
            Style = csDropDownList
            DataField = 'SEXO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Masculino'
              'Feminino')
            ParentFont = False
            TabOrder = 6
          end
          object edtTelefone: TDBEdit
            Left = 384
            Top = 77
            Width = 199
            Height = 21
            Color = clWhite
            DataField = 'TELEFONE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object edtCelular: TDBEdit
            Left = 590
            Top = 77
            Width = 199
            Height = 21
            Color = clWhite
            DataField = 'CELULAR'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object cbbGrauInstrucao: TDBComboBox
            Left = 6
            Top = 124
            Width = 191
            Height = 21
            Style = csDropDownList
            DataField = 'GRAU_INSTRUCAO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Analfabeto'
              'Ensino fundamental incompleto'
              'Ensino fundamental completo'
              'Ensino m'#233'dio incompleto'
              'Ensino m'#233'dio completo'
              'Superior completo (Gradua'#231#227'o)'
              'P'#243's-Gradua'#231#227'o'
              'Mestrado '
              'Doutorado'
              'P'#242's-Doutorado (PhD)')
            ParentFont = False
            TabOrder = 9
          end
          object edtEmail: TDBEdit
            Left = 202
            Top = 124
            Width = 319
            Height = 21
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object lcbProfissao: TDBLookupComboBox
            Left = 525
            Top = 124
            Width = 229
            Height = 21
            Cursor = crHandPoint
            Color = clWhite
            DataField = 'ID_PROFISSAO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsProfissao
            ParentFont = False
            TabOrder = 11
          end
          object btnIncluirProfissao: TAdvGlowButton
            Left = 756
            Top = 124
            Width = 33
            Height = 21
            Hint = 'Incluir Profiss'#227'o'
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
            TabOrder = 12
            OnClick = btnIncluirProfissaoClick
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
          object cbbTipoSanguineo: TDBComboBox
            Left = 709
            Top = 32
            Width = 80
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_SANGUINEO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'A+'
              'A-'
              'B+'
              'B-'
              'AB+'
              'AB-'
              'O+'
              'O-')
            ParentFont = False
            TabOrder = 3
          end
        end
        object grpFamilia: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 159
          Width = 794
          Height = 100
          Align = alTop
          Caption = 'Fam'#237'lia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lblNomeMae: TLabel
            Left = 6
            Top = 13
            Width = 65
            Height = 13
            Caption = 'Nome da M'#227'e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblNomeConjuge: TLabel
            Left = 6
            Top = 55
            Width = 91
            Height = 13
            Caption = 'Nome do Conjugue'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDataCasamento: TLabel
            Left = 317
            Top = 55
            Width = 95
            Height = 13
            Caption = 'Data de Casamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblNomePai: TLabel
            Left = 316
            Top = 13
            Width = 59
            Height = 13
            Caption = 'Nome do Pai'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtNomeMae: TDBEdit
            Left = 6
            Top = 29
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'NOME_MAE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edtNomePai: TDBEdit
            Left = 316
            Top = 29
            Width = 369
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'NOME_PAI'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtNomeConjuge: TDBEdit
            Left = 6
            Top = 72
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'NOME_CONJUGE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edtDataCasamento: TJvDBDateEdit
            Left = 317
            Top = 72
            Width = 132
            Height = 21
            DataField = 'DATA_CASAMENTO'
            DataSource = ds
            DialogTitle = 'Selecione uma Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 3
          end
        end
        object grpEndereco: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 265
          Width = 794
          Height = 105
          Align = alTop
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object lblEndereco: TLabel
            Left = 5
            Top = 16
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblNumero: TLabel
            Left = 419
            Top = 16
            Width = 37
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblEnderecoBairro: TLabel
            Left = 560
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCidade: TLabel
            Left = 5
            Top = 60
            Width = 33
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblCep: TLabel
            Left = 419
            Top = 60
            Width = 19
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtEndereco: TDBEdit
            Left = 5
            Top = 33
            Width = 409
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'ENDERECO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object edtNumero: TDBEdit
            Left = 419
            Top = 33
            Width = 137
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'ENDERECO_NUMERO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtEnderecoBairro: TDBEdit
            Left = 560
            Top = 32
            Width = 229
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'ENDERECO_BAIRRO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cbbCidade: TDBLookupComboBox
            Left = 5
            Top = 77
            Width = 374
            Height = 21
            Cursor = crHandPoint
            DataField = 'ID_CIDADE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsCidade
            ParentFont = False
            TabOrder = 3
          end
          object edtCep: TDBEdit
            Left = 419
            Top = 77
            Width = 183
            Height = 21
            DataField = 'CEP'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object btnIncluirCidade: TAdvGlowButton
            Left = 381
            Top = 77
            Width = 33
            Height = 21
            Hint = 'Incluir Cidade'
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
            OnClick = btnIncluirCidadeClick
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
        object grpNaturalidade: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 376
          Width = 794
          Height = 57
          Align = alTop
          Caption = 'Naturalidade/Nacionalidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object lblNaturalidade: TLabel
            Left = 6
            Top = 16
            Width = 61
            Height = 13
            Caption = 'Naturalidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblNacionalidade: TLabel
            Left = 419
            Top = 16
            Width = 66
            Height = 13
            Caption = 'Nacionalidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lcbNaturalidade: TDBLookupComboBox
            Left = 6
            Top = 31
            Width = 372
            Height = 21
            Cursor = crHandPoint
            DataField = 'ID_NATURALIDADE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsNaturalidade
            ParentFont = False
            TabOrder = 0
          end
          object cbbNacionalidade: TJvDBComboBox
            Left = 419
            Top = 31
            Width = 254
            Height = 21
            DataField = 'NACIONALIDADE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Brasileira'
              'Extrangeira')
            ParentFont = False
            TabOrder = 1
            Values.Strings = (
              '0'
              '1')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object AdvGlowButton1: TAdvGlowButton
            Left = 381
            Top = 31
            Width = 33
            Height = 21
            Hint = 'Incluir Naturalidade'
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
            TabOrder = 2
            OnClick = AdvGlowButton1Click
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
      object tbDadosComplementares: TcxTabSheet
        Caption = 'Dados Complementares'
        ImageIndex = 1
        OnShow = tbDadosComplementaresShow
        object lblObservacoes: TLabel
          Left = 3
          Top = 379
          Width = 73
          Height = 13
          Caption = 'Observa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblObservacao: TLabel
          Left = 6
          Top = 323
          Width = 76
          Height = 13
          Caption = 'Observa'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grpHistoricoEclesiastico: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 794
          Height = 115
          Align = alTop
          Caption = 'Hist'#243'rico '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblIgrejaDeBatismo: TLabel
            Left = 5
            Top = 16
            Width = 84
            Height = 13
            Caption = 'Igreja de Batismo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblPastorBatismo: TLabel
            Left = 403
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Pastor do Batismo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblIgrejasFoiMembro: TLabel
            Left = 6
            Top = 61
            Width = 142
            Height = 13
            Caption = 'Igrejas das quais foi membro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lcbIgrejaBatismo: TDBLookupComboBox
            Left = 5
            Top = 33
            Width = 351
            Height = 21
            Cursor = crHandPoint
            DataField = 'ID_IGREJA_BATISMO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsIgrejasBatismo
            ParentFont = False
            TabOrder = 0
          end
          object lcbPastorBatismo: TDBLookupComboBox
            Left = 403
            Top = 33
            Width = 351
            Height = 21
            Cursor = crHandPoint
            DataField = 'ID_PASTOR_BATISMO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsPastorBatismo
            ParentFont = False
            TabOrder = 1
          end
          object edtIgrejasFoiMembro: TDBEdit
            Left = 5
            Top = 79
            Width = 491
            Height = 21
            CharCase = ecUpperCase
            DataField = 'IGREJAS_FOI_MEMBRO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btnIncluirIgrejaBatismo: TAdvGlowButton
            Left = 358
            Top = 33
            Width = 33
            Height = 21
            Hint = 'Incluir Igreja Batismo'
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
            TabOrder = 3
            OnClick = btnIncluirIgrejaBatismoClick
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
          object btnIncluirPastorBatismo: TAdvGlowButton
            Left = 756
            Top = 33
            Width = 33
            Height = 21
            Hint = 'Incluir Pastor'
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
            TabOrder = 4
            OnClick = btnIncluirPastorBatismoClick
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
        object mmoObservacoes: TDBMemo
          AlignWithMargins = True
          Left = 3
          Top = 337
          Width = 794
          Height = 96
          Align = alBottom
          DataField = 'OBSERVACOES'
          DataSource = ds
          TabOrder = 1
        end
        object grpDesativacaoMembro: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 124
          Width = 794
          Height = 196
          Align = alTop
          Caption = 'Situa'#231#227'o do Membro na Comunidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object lblSituacaoMembro: TLabel
            Left = 5
            Top = 16
            Width = 97
            Height = 13
            Caption = 'Situa'#231#227'o do Membro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblTiposSaidaMembro: TLabel
            Left = 6
            Top = 62
            Width = 125
            Height = 13
            Caption = 'Tipos de Sa'#237'da do Membro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDataAdmissao: TLabel
            Left = 156
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Data de Admiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblFuncaoGostariaExercer: TLabel
            Left = 7
            Top = 149
            Width = 219
            Height = 13
            Caption = 'Fun'#231#227'o que gostaria de exercer nesta Igreja:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblFuncaoJaExercida: TLabel
            Left = 7
            Top = 105
            Width = 192
            Height = 13
            Caption = 'Fun'#231#227'o que j'#225' exerceu em outra Igreja:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblDataSaida: TLabel
            Left = 157
            Top = 62
            Width = 67
            Height = 13
            Caption = 'Data de Sa'#237'da'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cbbSituacaoMembro: TJvDBComboBox
            Left = 5
            Top = 32
            Width = 145
            Height = 21
            DataField = 'SITUACAO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Ativo'
              'Inativo')
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              '1'
              '0')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object cbbTiposSaidaMembro: TJvDBComboBox
            Left = 6
            Top = 78
            Width = 145
            Height = 21
            DataField = 'TIPOS_SAIDA_MEMBRO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Falecimento'
              'Carta(Transfer'#234'ncia)'
              'Evas'#227'o'
              '')
            ParentFont = False
            TabOrder = 1
            Values.Strings = (
              '0'
              '1'
              '2')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object edtDataAdmissao: TJvDBDateEdit
            Left = 156
            Top = 32
            Width = 134
            Height = 21
            DataField = 'DATA_ADMISSAO'
            DataSource = ds
            DialogTitle = 'Selecione uma Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 2
          end
          object rgModeDeEntrada: TDBRadioGroup
            Left = 296
            Top = 16
            Width = 200
            Height = 48
            Caption = 'Modo de Admiss'#227'o'
            Columns = 2
            DataField = 'MODO_ADMISSAO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'Batismo'
              'Carta'
              'Reconcilia'#231#227'o'
              'Aclama'#231#227'o')
            ParentFont = False
            TabOrder = 3
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object cbOfertante: TDBCheckBox
            Left = 507
            Top = 46
            Width = 73
            Height = 17
            Caption = 'Ofertante?'
            DataField = 'OFERTANTE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object cbDizimista: TDBCheckBox
            Left = 507
            Top = 23
            Width = 73
            Height = 17
            Caption = 'Dizimista?'
            DataField = 'DIZIMISTA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object lcbFuncaoGostariaExercer: TDBLookupComboBox
            Left = 7
            Top = 166
            Width = 433
            Height = 21
            Cursor = crHandPoint
            DataField = 'FUNCAO_GOSTARIA_EXERCER'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsFuncaoGostExercer
            ParentFont = False
            TabOrder = 7
          end
          object lcbFuncaoExerceu: TDBLookupComboBox
            Left = 7
            Top = 122
            Width = 433
            Height = 21
            Cursor = crHandPoint
            DataField = 'FUNCAO_EXERCEU_IGREJA'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ListSource = dsFuncaoExerceu
            ParentFont = False
            TabOrder = 6
          end
          object edtDataSaida: TJvDBDateEdit
            Left = 156
            Top = 78
            Width = 134
            Height = 21
            DataField = 'DATA_SAIDA'
            DataSource = ds
            DialogTitle = 'Selecione uma Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowNullDate = False
            TabOrder = 8
          end
          object btnIncluirFuncaoExerceu: TAdvGlowButton
            Left = 443
            Top = 122
            Width = 33
            Height = 21
            Hint = 'Incluir Fun'#231#227'o'
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
            TabOrder = 9
            OnClick = btnIncluirFuncaoExerceuClick
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
          object btnIncluirFuncaoGost: TAdvGlowButton
            Left = 443
            Top = 166
            Width = 33
            Height = 21
            Hint = 'Incluir Fun'#231#227'o'
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
            TabOrder = 10
            OnClick = btnIncluirFuncaoGostClick
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
  inherited cds: TClientDataSet
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 120
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'RG'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'ESTADO_CIVIL'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftDate
      end
      item
        Name = 'SEXO'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'GRAU_INSTRUCAO'
        DataType = ftString
        Size = 29
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ID_PROFISSAO'
        DataType = ftInteger
      end
      item
        Name = 'NOME_MAE'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NOME_PAI'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'NOME_CONJUGE'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DATA_CASAMENTO'
        DataType = ftDate
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'ENDERECO_BAIRRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ENDERECO_NUMERO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_CIDADE'
        DataType = ftInteger
      end
      item
        Name = 'ID_IGREJA_BATISMO'
        DataType = ftInteger
      end
      item
        Name = 'ID_PASTOR_BATISMO'
        DataType = ftInteger
      end
      item
        Name = 'DATA_ADMISSAO'
        DataType = ftDate
      end
      item
        Name = 'MODO_ADMISSAO'
        DataType = ftSmallint
      end
      item
        Name = 'IGREJAS_FOI_MEMBRO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'DIZIMISTA'
        DataType = ftSmallint
      end
      item
        Name = 'OFERTANTE'
        DataType = ftSmallint
      end
      item
        Name = 'FUNCAO_EXERCEU_IGREJA'
        DataType = ftInteger
      end
      item
        Name = 'FUNCAO_GOSTARIA_EXERCER'
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACOES'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'ID_UNIDADE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SITUACAO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'TIPOS_SAIDA_MEMBRO'
        DataType = ftSmallint
      end
      item
        Name = 'ID_NATURALIDADE'
        DataType = ftInteger
      end
      item
        Name = 'NACIONALIDADE'
        DataType = ftSmallint
      end
      item
        Name = 'DATA_SAIDA'
        DataType = ftDate
      end
      item
        Name = 'TIPO_SANGUINEO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MINISTERIO_ENSINO'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_LOUVOR'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_INFANTIL'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_BERCARIO'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_ACOLHIMENTO'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_SURDOS'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_COMUNICACAO'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_ADMINISTRACAO'
        DataType = ftSmallint
      end
      item
        Name = 'MINISTERIO_EVANGELISMO'
        DataType = ftSmallint
      end>
    ProviderName = 'DSP_MEMBRO'
    RemoteServer = DM.DSPConnSM
    StoreDefs = True
    OnNewRecord = cdsNewRecord
    Left = 313
    Top = 16
    object cdsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 120
    end
    object cdsCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999.999.999-99'
      Size = 14
    end
    object cdsRG: TStringField
      FieldName = 'RG'
      EditMask = '9.999.999'
      Size = 9
    end
    object cdsESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 13
    end
    object cdsDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '(99) 9999-9999'
      Size = 15
    end
    object cdsCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '(99) 99999-9999'
      Size = 15
    end
    object cdsGRAU_INSTRUCAO: TStringField
      FieldName = 'GRAU_INSTRUCAO'
      Size = 29
    end
    object cdsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object cdsID_PROFISSAO: TIntegerField
      FieldName = 'ID_PROFISSAO'
    end
    object cdsNOME_MAE: TStringField
      FieldName = 'NOME_MAE'
      Size = 120
    end
    object cdsNOME_PAI: TStringField
      FieldName = 'NOME_PAI'
      Size = 120
    end
    object cdsNOME_CONJUGE: TStringField
      FieldName = 'NOME_CONJUGE'
      Size = 120
    end
    object cdsDATA_CASAMENTO: TDateField
      FieldName = 'DATA_CASAMENTO'
    end
    object cdsENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 120
    end
    object cdsENDERECO_BAIRRO: TStringField
      FieldName = 'ENDERECO_BAIRRO'
      Size = 60
    end
    object cdsENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      Size = 10
    end
    object cdsCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99.999-999'
      Size = 15
    end
    object cdsID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
    object cdsID_IGREJA_BATISMO: TIntegerField
      FieldName = 'ID_IGREJA_BATISMO'
    end
    object cdsID_PASTOR_BATISMO: TIntegerField
      FieldName = 'ID_PASTOR_BATISMO'
    end
    object cdsMODO_ADMISSAO: TSmallintField
      FieldName = 'MODO_ADMISSAO'
    end
    object cdsIGREJAS_FOI_MEMBRO: TStringField
      FieldName = 'IGREJAS_FOI_MEMBRO'
      Size = 120
    end
    object cdsDIZIMISTA: TSmallintField
      FieldName = 'DIZIMISTA'
    end
    object cdsOFERTANTE: TSmallintField
      FieldName = 'OFERTANTE'
    end
    object cdsFUNCAO_EXERCEU_IGREJA: TIntegerField
      FieldName = 'FUNCAO_EXERCEU_IGREJA'
    end
    object cdsFUNCAO_GOSTARIA_EXERCER: TIntegerField
      FieldName = 'FUNCAO_GOSTARIA_EXERCER'
    end
    object cdsOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object cdsSEXO: TStringField
      FieldName = 'SEXO'
      Size = 9
    end
    object cdsDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
    object cdsSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Required = True
    end
    object cdsTIPOS_SAIDA_MEMBRO: TSmallintField
      FieldName = 'TIPOS_SAIDA_MEMBRO'
    end
    object cdsID_NATURALIDADE: TIntegerField
      FieldName = 'ID_NATURALIDADE'
    end
    object cdsNACIONALIDADE: TSmallintField
      FieldName = 'NACIONALIDADE'
    end
    object cdsDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
    end
    object cdsTIPO_SANGUINEO: TStringField
      FieldName = 'TIPO_SANGUINEO'
      Size = 3
    end
  end
  inherited ds: TDataSource
    Left = 361
    Top = 16
  end
  object dsCidade: TDataSource
    DataSet = cdsCidade
    Left = 921
    Top = 157
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 971
    Top = 157
  end
  object cdsProfissao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 906
    Top = 214
  end
  object dsProfissao: TDataSource
    DataSet = cdsProfissao
    Left = 972
    Top = 214
  end
  object dsIgrejasBatismo: TDataSource
    DataSet = cdsIgrejasBatismo
    Left = 895
    Top = 270
  end
  object cdsIgrejasBatismo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 986
    Top = 269
  end
  object cdsPastorBatismo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 886
    Top = 318
  end
  object dsPastorBatismo: TDataSource
    DataSet = cdsPastorBatismo
    Left = 974
    Top = 318
  end
  object dsFuncaoExerceu: TDataSource
    DataSet = cdsFuncaoExerceu
    Left = 976
    Top = 368
  end
  object cdsFuncaoExerceu: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 369
  end
  object dsFuncaoGostExercer: TDataSource
    DataSet = cdsFuncaoGostExercer
    Left = 952
    Top = 57
  end
  object cdsFuncaoGostExercer: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 952
    Top = 105
  end
  object cdsNaturalidade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 891
    Top = 417
  end
  object dsNaturalidade: TDataSource
    DataSet = cdsNaturalidade
    Left = 971
    Top = 417
  end
end
