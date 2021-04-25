unit ufrm1Setor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls, JvExMask, JvToolEdit, uServerUtils.Data,
  JvDBControls;

const
  cAtivo=1;

type
  Tfrm1Setor = class(Tfrm1Cadastro)
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblCidade: TLabel;
    cbbCidade: TDBLookupComboBox;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsENDERECO: TStringField;
    cdsENDERECO_NUMERO: TStringField;
    cdsENDERECO_BAIRRO: TStringField;
    cdsTELEFONE: TStringField;
    cdsID_CIDADE: TIntegerField;
    cdsATIVO: TIntegerField;
    cdsID_UNIDADE: TIntegerField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsRespSetor: TClientDataSet;
    dsRespSetor: TDataSource;
    dsCidade: TDataSource;
    cdsCidade: TClientDataSet;
    cdsID_RESPONSAVEL_ATUAL: TIntegerField;
    grpRespSetor: TGroupBox;
    lcbResponsavelSetor: TDBLookupComboBox;
    lblResponsavelSetor: TLabel;
    btnIncluirCidade: TAdvGlowButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCidadeClick(Sender: TObject);
  private
    procedure SetCidade;
    function GetCidade: string;
    procedure SetResponsavelSetor;
  public
    { Public declarations }
  end;

var
  frm1Setor: Tfrm1Setor;

implementation

uses
  uDataModule, uSegurancaControle, uManipulacaoDados, uConsultasSql, ufrm1Cidade;

{$R *.dfm}

procedure Tfrm1Setor.btnIncluirCidadeClick(Sender: TObject);
begin
  cdsID_CIDADE.AsString :=GetCidade;
  SetCidade;
end;

procedure Tfrm1Setor.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;
  if lcbResponsavelSetor.KeyValue=null then
  begin
    Application.MessageBox('Preencha o campo Responsável pelo Setor.','Atenção',MB_OK+MB_ICONWARNING);
    lcbResponsavelSetor.SetFocus;
    Abort;
  end;

  if TManipulacaoDados.RegistroExiste('TBL_SETOR','NOME','NOME = '+QuotedStr(Trim(edtNome.Text))+
    ' AND ID <> '+cdsID.AsString+' AND ID_UNIDADE = '+IntToStr(DM.IdUnidade)) then
  begin
    Application.MessageBox('Setor já existente.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.Clear;
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Setor | Tabela: TBL_SETOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Setor | Tabela: TBL_SETOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Setor.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_SETOR_ID');
  cdsATIVO.AsInteger :=cAtivo;
end;

procedure Tfrm1Setor.FormShow(Sender: TObject);
begin
  inherited;
  SetCidade;
  SetResponsavelSetor;
end;

function Tfrm1Setor.GetCidade: string;
begin
  Result :=Consultar(cSqlTodasCidades, 'ID', 1, Tfrm1Cidade, frm1Cidade, 'TBL_CIDADE',
   'ID', 'ID', 'Cadastro de Cidade');
end;

procedure Tfrm1Setor.SetCidade;
begin
  TManipulacaoDados.PopulaCds(cdsCidade, cbbCidade, oAscendente, 'NOME', 'ID', 'NOME', cSqlTodasCidades);
end;

procedure Tfrm1Setor.SetResponsavelSetor;
begin
  TManipulacaoDados.PopulaCds(cdsRespSetor, lcbResponsavelSetor, oAscendente, 'NOME', 'ID', 'NOME',
   Format(cSqlTodosResponsaveisUnidade,[DM.IdUnidade]));
end;

end.
