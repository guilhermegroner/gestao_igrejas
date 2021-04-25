inherited frm0TrocarSenha: Tfrm0TrocarSenha
  BorderIcons = []
  Caption = ''
  ClientHeight = 250
  ClientWidth = 306
  ExplicitWidth = 312
  ExplicitHeight = 279
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 306
    Height = 250
    ExplicitWidth = 306
    ExplicitHeight = 250
    object lblSenhaAtual: TLabel [0]
      Left = 6
      Top = 27
      Width = 67
      Height = 13
      Caption = '* Senha Atual'
    end
    object lblNovaSenha: TLabel [1]
      Left = 6
      Top = 80
      Width = 67
      Height = 13
      Caption = '* Nova Senha'
    end
    object lbl1: TLabel [2]
      Left = 6
      Top = 133
      Width = 117
      Height = 13
      Caption = '* Confirmar Nova Senha'
    end
    inherited pnlBotton: TPanel
      Top = 209
      Width = 306
      ExplicitTop = 209
      ExplicitWidth = 306
      inherited btnSalvar: TAdvGlowButton
        Left = 105
        ExplicitLeft = 105
      end
      inherited btnCancelar: TAdvGlowButton
        Left = 205
        ExplicitLeft = 205
      end
    end
    inherited hdrTitulo: TJvGradientHeaderPanel
      Width = 306
      LabelCaption = '.: Trocar Senha'
      ExplicitWidth = 306
    end
    object edtSenhaAtual: TEdit
      Left = 6
      Top = 46
      Width = 291
      Height = 21
      Color = clWhite
      PasswordChar = '*'
      TabOrder = 2
    end
    object edtNovaSenha: TEdit
      Left = 6
      Top = 96
      Width = 291
      Height = 21
      Color = clWhite
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtConfNovaSenha: TEdit
      Left = 6
      Top = 152
      Width = 291
      Height = 21
      Color = clWhite
      PasswordChar = '*'
      TabOrder = 4
    end
  end
  inherited cds: TClientDataSet
    Left = 192
    Top = 0
  end
  inherited ds: TDataSource
    Left = 224
    Top = 0
  end
end
