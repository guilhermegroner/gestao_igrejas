unit ufrm1GrupoEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm1GrupoEstoque = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsID_UNIDADE: TIntegerField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1GrupoEstoque: Tfrm1GrupoEstoque;

implementation

uses
  uDataModule, uSegurancaControle, uManipulacaoDados;

{$R *.dfm}

procedure Tfrm1GrupoEstoque.btnSalvarClick(Sender: TObject);
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
       'Cadastro de Grupo do Estoque | Tabela: TBL_EST_GRUPO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Grupo do Estoque | Tabela: TBL_EST_GRUPO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1GrupoEstoque.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_GRUPO_ID');
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1GrupoEstoque.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
