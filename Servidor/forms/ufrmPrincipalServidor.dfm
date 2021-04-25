object frmPrincipalServidor: TfrmPrincipalServidor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Servidor'
  ClientHeight = 155
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Conn: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=D:\Sistema\Desktop\Geek Software\GS Patrimonio\Banco\BA' +
        'NCOMATRIZ.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet=ISO8859_1'
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 16
    Top = 8
  end
  object TrayIcon: TTrayIcon
    PopupMenu = pmOpcoes
    Visible = True
    Left = 16
    Top = 64
  end
  object pmOpcoes: TPopupMenu
    Left = 72
    Top = 64
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = Abrir1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FinalizarServidor1: TMenuItem
      Caption = 'Finalizar Servidor'
      OnClick = FinalizarServidor1Click
    end
  end
end
