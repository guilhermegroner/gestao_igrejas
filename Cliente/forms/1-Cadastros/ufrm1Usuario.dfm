inherited frm1Usuario: Tfrm1Usuario
  Caption = ''
  ClientHeight = 433
  ClientWidth = 395
  OnCreate = FormCreate
  ExplicitWidth = 401
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 433
    ExplicitWidth = 395
    ExplicitHeight = 433
    object lblNome: TLabel [0]
      Left = 8
      Top = 32
      Width = 87
      Height = 13
      Caption = '*  Nome Completo'
    end
    object lblUsuario: TLabel [1]
      Left = 8
      Top = 79
      Width = 48
      Height = 13
      Caption = '*  Usu'#225'rio'
    end
    object lblSenha: TLabel [2]
      Left = 228
      Top = 80
      Width = 42
      Height = 13
      Caption = '*  Senha'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 126
      Width = 53
      Height = 13
      Caption = '*  Situa'#231#227'o'
    end
    inherited pnlBotton: TPanel
      Top = 392
      Width = 395
      ExplicitTop = 392
      ExplicitWidth = 395
      inherited btnSalvar: TAdvGlowButton
        Left = 194
        ExplicitLeft = 194
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 294
        ExplicitLeft = 294
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 395
      LabelCaption = '.: Usu'#225'rio'
      ExplicitWidth = 395
    end
    object edtNome: TDBEdit
      Left = 8
      Top = 49
      Width = 381
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 2
    end
    object edtUsuario: TDBEdit
      Left = 8
      Top = 96
      Width = 209
      Height = 21
      Color = clWhite
      DataField = 'USUARIO'
      DataSource = ds
      TabOrder = 3
      OnExit = edtUsuarioExit
    end
    object edtSenha: TDBEdit
      Left = 228
      Top = 96
      Width = 161
      Height = 21
      Color = clWhite
      DataField = 'SENHA'
      DataSource = ds
      PasswordChar = '*'
      TabOrder = 4
    end
    object cbAdministrador: TDBCheckBox
      Left = 228
      Top = 146
      Width = 97
      Height = 17
      Caption = 'Administrador'
      DataField = 'ADMINISTRADOR'
      DataSource = ds
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object cbbSituacao: TJvDBComboBox
      Left = 8
      Top = 144
      Width = 209
      Height = 21
      DataField = 'SITUACAO'
      DataSource = ds
      Items.Strings = (
        'Inativo'
        'Ativo'
        'Bloqueado')
      TabOrder = 6
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
    object grpGrid: TGroupBox
      Left = 8
      Top = 176
      Width = 383
      Height = 213
      Caption = 'Unidades que tem acesso'
      TabOrder = 7
      object cxGrid: TcxGrid
        Left = 2
        Top = 15
        Width = 379
        Height = 196
        Align = alClient
        BevelOuter = bvNone
        PopupMenu = pmGrid
        TabOrder = 0
        object cxGridTV1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsUnidades
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.ContentEven = cxStyleZebrado
          object cxGrid_Ativo: TcxGridDBColumn
            Caption = 'X'
            DataBinding.FieldName = 'Marcado'
            Width = 20
          end
          object cxGrid_Nome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            Options.Editing = False
            Width = 316
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridTV1
        end
      end
    end
  end
  inherited cds: TClientDataSet
    ProviderName = 'DSP_USUARIO'
    RemoteServer = DM.DSPConnSM
    OnNewRecord = cdsNewRecord
    Left = 160
    Top = 24
    object cdsID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 480
    end
    object cdsUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 160
    end
    object cdsADMINISTRADOR: TIntegerField
      FieldName = 'ADMINISTRADOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 160
    end
    object cdsSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited ds: TDataSource
    Left = 192
    Top = 24
  end
  object dsUnidades: TDataSource
    DataSet = cdsUnidades
    Left = 216
    Top = 208
  end
  object cdsUnidades: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 208
    object cdsUnidadesID: TIntegerField
      FieldName = 'ID'
    end
    object cdsUnidadesMarcado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'Marcado'
    end
    object cdsUnidadesNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
  end
  object Style: TcxStyleRepository
    Left = 59
    Top = 240
    PixelsPerInch = 96
    object cxStyleZebrado: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clDefault
    end
  end
  object pmGrid: TPopupMenu
    Left = 128
    Top = 232
    object MarcarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = MarcarTodos1Click
    end
    object DesmarcarTodos1: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = DesmarcarTodos1Click
    end
  end
end
