unit ufrm0TrocarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm0TrocarSenha = class(Tfrm1Cadastro)
    lblSenhaAtual: TLabel;
    edtSenhaAtual: TEdit;
    lblNovaSenha: TLabel;
    edtNovaSenha: TEdit;
    lbl1: TLabel;
    edtConfNovaSenha: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    cNomeUsuarioTrocarSenha: string;
    cIdUsuarioTrocarSenha: Integer;
  end;

var
  frm0TrocarSenha: Tfrm0TrocarSenha;

implementation

uses
  uDataModule, uSegurancaControle, uManipulacaoDados;

{$R *.dfm}

procedure Tfrm0TrocarSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm0TrocarSenha.btnSalvarClick(Sender: TObject);
var
  vSql : String;
  vCds: TClientDataSet;
begin
  if cIdUsuarioTrocarSenha <=0 then
  begin
   cIdUsuarioTrocarSenha :=DM.IdUsuario;
   cNomeUsuarioTrocarSenha :=DM.NomeUsuario;
  end;

  if edtSenhaAtual.Enabled=True then
  begin
    if Trim(edtSenhaAtual.Text)=EmptyStr then
    begin
      Application.MessageBox('Preencha o campo Senha Atual.','Atenção',MB_OK+MB_ICONWARNING);
      edtSenhaAtual.SetFocus;
      Exit;
    end;
  end;

  if Trim(edtNovaSenha.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nova Senha.','Atenção',MB_OK+MB_ICONWARNING);
    edtNovaSenha.SetFocus;
    Exit;
  end;

  if Trim(edtConfNovaSenha.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Confirmar Nova Senha.','Atenção',MB_OK+MB_ICONWARNING);
    edtConfNovaSenha.SetFocus;
    Exit;
  end;

  if edtNovaSenha.Text<>edtConfNovaSenha.Text then
  begin
    Application.MessageBox('Senhas Informadas não conferem!','Atenção',MB_OK+MB_ICONWARNING);
    edtNovaSenha.SetFocus;
    Exit;
  end;

  vCds := TClientDataSet.Create(nil);
  try
    try
      vSql :='SELECT ID FROM TBL_USUARIO WHERE ID = '+IntToStr(cIdUsuarioTrocarSenha)+
        ' AND SENHA = '+QuotedStr(TSegurancaControle.EncriptaMD5(edtSenhaAtual.Text));

      vCds.Data :=TManipulacaoDados.GetDataDataSet(vSql);

      vCds.Open;
      if ((vCds.RecordCount >0) and (edtSenhaAtual.Enabled=True)) then
      begin
        vSql :='UPDATE TBL_USUARIO SET SENHA = '+QuotedStr(TSegurancaControle.EncriptaMD5(edtNovaSenha.Text))+
         ' WHERE ID = '+IntToStr(cIdUsuarioTrocarSenha)+';';

        TManipulacaoDados.ExecuteSql(vSql);
        TSegurancaControle.GravaLog(nlBaixo,  DM.IdUsuario, DM.IdUnidade, 'Senha de Usuário Alterada! | Usuário: '+cNomeUsuarioTrocarSenha);
        Application.MessageBox('Senha alterada com sucesso!','Informação',MB_OK+MB_ICONINFORMATION);
        Close;
      end
      else
      if edtSenhaAtual.Enabled=False then
      begin
        vSql :='UPDATE TBL_USUARIO SET SENHA = '+QuotedStr(TSegurancaControle.EncriptaMD5(edtNovaSenha.Text))+
         ' WHERE ID = '+IntToStr(cIdUsuarioTrocarSenha)+';';

        TManipulacaoDados.ExecuteSql(vSql);
        TSegurancaControle.GravaLog(nlBaixo,  DM.IdUsuario, DM.IdUnidade, 'Senha de Usuário Alterada! | Usuário: '+cNomeUsuarioTrocarSenha);
        Application.MessageBox('Senha alterada com sucesso!','Informação',MB_OK+MB_ICONINFORMATION);
        Close;
      end
      else
      begin
        Application.MessageBox('Senha Atual incorreta!','Atenção',MB_OK+MB_ICONWARNING);
        edtSenhaAtual.Clear;
        edtSenhaAtual.SetFocus;
      end;
    finally
      FreeAndNil(vCds);
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível alterar a Senha!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
      Close;
    end;
  end;
end;

procedure Tfrm0TrocarSenha.FormShow(Sender: TObject);
begin
  inherited;
  if edtSenhaAtual.Enabled then
   edtSenhaAtual.SetFocus
  else
   edtNovaSenha.SetFocus;
end;

end.
