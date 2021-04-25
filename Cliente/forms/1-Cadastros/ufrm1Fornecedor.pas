unit ufrm1Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Vcl.DBCtrls, Vcl.Mask,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls, uDataModule, uSegurancaControle, uManipulacaoDados;

type
  Tfrm1Fornecedor = class(Tfrm1Cadastro)
    mmoObservacao: TDBMemo;
    lblObservacao: TLabel;
    edtCelular: TDBEdit;
    lblCelular: TLabel;
    edtEmail: TDBEdit;
    lblEmail: TLabel;
    edtBairro: TDBEdit;
    lblBairro: TLabel;
    edtEndereco: TDBEdit;
    lblEndereco: TLabel;
    cbbCidade: TDBLookupComboBox;
    lblCidade: TLabel;
    edtCnpj: TDBEdit;
    lblCnpj: TLabel;
    edtCep: TDBEdit;
    lblCep: TLabel;
    edtNome: TDBEdit;
    lblNome: TLabel;
    edtTelefone: TDBEdit;
    lblTelefone1: TLabel;
    edtTelefone2: TDBEdit;
    lblTelefone2: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCNPJ: TStringField;
    cdsENDERECO: TStringField;
    cdsENDERECO_BAIRRO: TStringField;
    cdsID_CIDADE: TIntegerField;
    cdsCEP: TStringField;
    cdsTELEFONE1: TStringField;
    cdsTELEFONE2: TStringField;
    cdsCELULAR: TStringField;
    cdsEMAIL: TStringField;
    cdsOBSERVACAO: TBlobField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsENDERECO_NUMERO: TStringField;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    dsCidade: TDataSource;
    cdsCidade: TClientDataSet;
    btnIncluirCidade: TAdvGlowButton;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCidadeClick(Sender: TObject);
  private
    procedure SetCidade;
    function GetCidade: string;
  public
    { Public declarations }
  end;

var
  frm1Fornecedor: Tfrm1Fornecedor;

implementation

uses
  uConsultasSql, ufrm1Cidade;

{$R *.dfm}

procedure Tfrm1Fornecedor.btnIncluirCidadeClick(Sender: TObject);
begin
  cdsID_CIDADE.AsString :=GetCidade;
  SetCidade;
end;

procedure Tfrm1Fornecedor.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Fornecedor | Tabela: TBL_FORNECEDOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Fornecedor | Tabela: TBL_FORNECEDOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Fornecedor.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_RESPONSAVEL_ID');
end;

procedure Tfrm1Fornecedor.FormShow(Sender: TObject);
begin
  inherited;
  SetCidade;
end;

function Tfrm1Fornecedor.GetCidade: string;
begin
  Result :=Consultar(cSqlTodasCidades, 'ID', 1, Tfrm1Cidade, frm1Cidade, 'TBL_CIDADE',
   'ID', 'ID', 'Cadastro de Cidade');
end;

procedure Tfrm1Fornecedor.SetCidade;
begin
  TManipulacaoDados.PopulaCds(cdsCidade, cbbCidade, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasCidades);
end;

end.
