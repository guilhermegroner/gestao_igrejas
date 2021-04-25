unit ufrm0Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxGDIPlusClasses,
  cxImage, AdvGlowButton, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Data.DB,
  cxCheckBox, cxLabel, AdvSmoothSlider, Registry;

Const
  cUsuarioInativo = 0;
  cUsuarioAtivo = 1;
  cUsuarioBloqueado = 2;

type
  Tfrm0Login = class(Tfrm0Default)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnLogar: TAdvGlowButton;
    imgFundo: TImage;
    btnCancelar: TAdvGlowButton;
    lblVersao: TLabel;
    sliderLembrarDados: TAdvSmoothSlider;
    lblLembrarDados: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLogarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetUsuarioLogin(pArquivo, pSecao, pIdentificador, pValor: string);
    function GetLoginSalvo(pArquivo, pSecao, pIdentificador: string): string;
  public
    { Public declarations }
  end;

var
  frm0Login: Tfrm0Login;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle;

{$R *.dfm}

procedure Tfrm0Login.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm0Login.btnLogarClick(Sender: TObject);
var
  vSql : String;
  vCds: TClientDataSet;
begin
  if DebugHook<>0 then
  begin
    DM.IdUsuario :=1;
    DM.Usuario   :='suporte';
    DM.NomeUsuario :='Suporte Técnico';
    DM.UsuarioAdministrador :=True;

    ModalResult :=mrOk;
  end
  else
  begin
    if edtUsuario.Text=EmptyStr then
    begin
      Application.MessageBox('Usuário não informado!', 'Atenção',MB_OK+MB_ICONINFORMATION);
      edtUsuario.SetFocus;
      Abort;
    end;
    if edtSenha.Text=EmptyStr then
    begin
      Application.MessageBox('Senha não informada!', 'Atenção',MB_OK+MB_ICONINFORMATION);
      edtSenha.SetFocus;
      Abort;
    end;

    vCds := TClientDataSet.Create(nil);
    try
      vSql :='SELECT ID, NOME, USUARIO, ADMINISTRADOR, SITUACAO'+
        ' FROM TBL_USUARIO WHERE USUARIO = '+QuotedStr(edtUsuario.Text)+
        ' AND SENHA = '+QuotedStr(TSegurancaControle.EncriptaMD5(edtSenha.Text));

      vCds.Data :=TManipulacaoDados.GetDataDataSet(vSql);

      vCds.Open;
      if vCds.RecordCount >0 then
      begin
        if vCds.FieldByName('SITUACAO').AsInteger=cUsuarioInativo then
        begin
          Application.MessageBox('Usuário Inativo no Sistema!','Atenção',MB_OK+MB_ICONWARNING);
          edtUsuario.SetFocus;
          ModalResult :=mrNone;
          Exit;
        end
        else
        if vCds.FieldByName('SITUACAO').AsInteger=cUsuarioBloqueado then
        begin
          Application.MessageBox('Usuário Bloqueado no Sistema!','Atenção',MB_OK+MB_ICONWARNING);
          edtUsuario.SetFocus;
          ModalResult :=mrNone;
          Exit;
        end;

        if sliderLembrarDados.State=ssOn then
          SetUsuarioLogin('Login','Registro','Dados',edtUsuario.Text)
        else
          SetUsuarioLogin('Login','Registro','Dados',EmptyStr);

         DM.IdUsuario :=vCds.FieldByName('ID').AsInteger;
         DM.Usuario   :=vCds.FieldByName('USUARIO').AsString;
         DM.NomeUsuario :=vCds.FieldByName('NOME').AsString;
         DM.UsuarioAdministrador :=TManipulacaoDados.IntToBoolean(vCds.FieldByName('ADMINISTRADOR').AsInteger);

         ModalResult :=mrOk;
      end
      else
      begin
        Application.MessageBox('Usuário ou Senha inválidos!','Atenção',MB_OK+MB_ICONWARNING);
        edtSenha.Clear;
        edtSenha.SetFocus;
        ModalResult :=mrNone;
      end;
    finally
      FreeAndNil(vCds);
    end;
  end;
end;

procedure Tfrm0Login.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnLogarClick(Sender);
end;

procedure Tfrm0Login.FormCreate(Sender: TObject);
begin
  Self.ModalResult :=mrNone;

  lblVersao.Caption :='Versão: '+TSegurancaControle.GetVersaoSistema;
end;

procedure Tfrm0Login.FormDestroy(Sender: TObject);
begin
  Application.ShowMainForm :=True;

  if Assigned(Application.MainForm) then
    Application.MainForm.Show;
end;

procedure Tfrm0Login.FormShow(Sender: TObject);
begin
  if not DM.ConnDataSnap.Connected then
    DM.ConectarServidor;

  Brush.Style := BsClear;

  Application.ShowMainForm := False;
  if Assigned(Application.MainForm) then
    Application.MainForm.Hide;

  if sliderLembrarDados.State=ssOn then
  begin
    edtUsuario.Text :=GetLoginSalvo('Login','Registro','Dados');
    if edtUsuario.Text<>EmptyStr then
    begin
     if edtSenha.CanFocus then
      edtSenha.SetFocus;
    end
    else
     btnLogar.SetFocus;
  end;
end;

function Tfrm0Login.GetLoginSalvo(pArquivo, pSecao, pIdentificador: string): string;
var
   vArqRegistro: TRegIniFile;
begin
  vArqRegistro :=TRegIniFile.Create(pArquivo);
  try
    Result := vArqRegistro.ReadString(pSecao, pIdentificador, '');
  finally
    vArqRegistro.Free;
  end;
end;

procedure Tfrm0Login.SetUsuarioLogin(pArquivo, pSecao, pIdentificador, pValor: string);
var
   vArqRegistro: TRegIniFile;
begin
  vArqRegistro :=TRegIniFile.Create(pArquivo);
  try
    vArqRegistro.WriteString(pSecao, pIdentificador, pValor);
  finally
    vArqRegistro.Free;
  end;
end;

end.
