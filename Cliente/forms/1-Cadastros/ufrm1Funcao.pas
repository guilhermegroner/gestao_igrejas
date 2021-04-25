unit ufrm1Funcao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm1Funcao = class(Tfrm1Cadastro)
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    edtNome: TDBEdit;
    lblNome: TLabel;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Funcao: Tfrm1Funcao;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle;

{$R *.dfm}

procedure Tfrm1Funcao.btnSalvarClick(Sender: TObject);
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
       'Cadastro de Função | Tabela: TBL_FUNCAO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Função | Tabela: TBL_FUNCAO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Funcao.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_FUNCAO_ID');
end;

procedure Tfrm1Funcao.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
