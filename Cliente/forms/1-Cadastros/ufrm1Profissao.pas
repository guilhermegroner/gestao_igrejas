unit ufrm1Profissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls;

type
  Tfrm1Profissao = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Profissao: Tfrm1Profissao;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle;

{$R *.dfm}

procedure Tfrm1Profissao.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
    begin
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Profissão | Tabela: TBL_PROFISSAO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Profissão | Tabela: TBL_PROFISSAO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Profissao.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_PROFISSAO_ID');
end;

procedure Tfrm1Profissao.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
