unit ufrm1Unidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, JvExControls,
  JvGradientHeaderPanel, AdvGlowButton, Vcl.ExtCtrls;

const
  cAtivo=1;

type
  Tfrm1Unidade = class(Tfrm1Cadastro)
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblCidade: TLabel;
    cbbCidade: TDBLookupComboBox;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    edtCep: TDBEdit;
    lblCep: TLabel;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCNPJ: TStringField;
    cdsTELEFONE: TStringField;
    cdsENDERECO: TStringField;
    cdsENDERECO_NUMERO: TStringField;
    cdsENDERECO_BAIRRO: TStringField;
    cdsID_CIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsATIVO: TIntegerField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;

    dsCidade: TDataSource;
    cdsCidade: TClientDataSet;
    lblCnpj: TLabel;
    edtCnpj: TDBEdit;    procedure cdsNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Unidade: Tfrm1Unidade;

implementation

uses
  uDataModule, uManipulacaoDados, uConsultasSql, uSegurancaControle;

{$R *.dfm}

procedure Tfrm1Unidade.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Unidade | Tabela: TBL_UNIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Unidade | Tabela: TBL_UNIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Unidade.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_UNIDADE_ID');
  cdsATIVO.AsInteger :=cAtivo;
end;

procedure Tfrm1Unidade.FormShow(Sender: TObject);
begin
  inherited;
  TManipulacaoDados.PopulaCds(cdsCidade, cbbCidade, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasCidades);
end;

end.
