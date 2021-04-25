unit ufrm1Membro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  JvDBControls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxPC, JvExStdCtrls, JvCombobox, JvDBCombobox;

const
  cAtivo =1;
  cNao =0;

type
  Tfrm1Membro = class(Tfrm1Cadastro)
    dsCidade: TDataSource;
    cdsCidade: TClientDataSet;
    pcInfoMembro: TcxPageControl;
    tbDadosMembro: TcxTabSheet;
    tbDadosComplementares: TcxTabSheet;
    grpInformacoesPessoais: TGroupBox;
    lblNome: TLabel;
    lblCpf: TLabel;
    lblIdentidade: TLabel;
    lblEstadoCivil: TLabel;
    lblDataNascimento: TLabel;
    lblSexo: TLabel;
    lblTelefone: TLabel;
    lblCelular: TLabel;
    lblGrauInstrucao: TLabel;
    lblEmail: TLabel;
    lblProfissao: TLabel;
    edtNome: TDBEdit;
    edtCpf: TDBEdit;
    edtIdentidade: TDBEdit;
    cbbEstadoCivil: TDBComboBox;
    edtDataNascimento: TJvDBDateEdit;
    cbbSexo: TDBComboBox;
    edtTelefone: TDBEdit;
    edtCelular: TDBEdit;
    cbbGrauInstrucao: TDBComboBox;
    edtEmail: TDBEdit;
    lcbProfissao: TDBLookupComboBox;
    grpFamilia: TGroupBox;
    lblNomeMae: TLabel;
    lblNomeConjuge: TLabel;
    lblDataCasamento: TLabel;
    lblNomePai: TLabel;
    edtNomeMae: TDBEdit;
    edtNomePai: TDBEdit;
    edtNomeConjuge: TDBEdit;
    edtDataCasamento: TJvDBDateEdit;
    grpEndereco: TGroupBox;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblEnderecoBairro: TLabel;
    lblCidade: TLabel;
    lblCep: TLabel;
    edtEndereco: TDBEdit;
    edtNumero: TDBEdit;
    edtEnderecoBairro: TDBEdit;
    cbbCidade: TDBLookupComboBox;
    edtCep: TDBEdit;
    grpHistoricoEclesiastico: TGroupBox;
    lblIgrejaDeBatismo: TLabel;
    lblPastorBatismo: TLabel;
    lcbIgrejaBatismo: TDBLookupComboBox;
    lcbPastorBatismo: TDBLookupComboBox;
    lblIgrejasFoiMembro: TLabel;
    edtIgrejasFoiMembro: TDBEdit;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCPF: TStringField;
    cdsRG: TStringField;
    cdsESTADO_CIVIL: TStringField;
    cdsDATA_NASCIMENTO: TDateField;
    cdsTELEFONE: TStringField;
    cdsCELULAR: TStringField;
    cdsGRAU_INSTRUCAO: TStringField;
    cdsEMAIL: TStringField;
    cdsID_PROFISSAO: TIntegerField;
    cdsNOME_MAE: TStringField;
    cdsNOME_PAI: TStringField;
    cdsNOME_CONJUGE: TStringField;
    cdsDATA_CASAMENTO: TDateField;
    cdsENDERECO: TStringField;
    cdsENDERECO_BAIRRO: TStringField;
    cdsENDERECO_NUMERO: TStringField;
    cdsCEP: TStringField;
    cdsID_CIDADE: TIntegerField;
    cdsID_IGREJA_BATISMO: TIntegerField;
    cdsID_PASTOR_BATISMO: TIntegerField;
    cdsMODO_ADMISSAO: TSmallintField;
    cdsIGREJAS_FOI_MEMBRO: TStringField;
    cdsDIZIMISTA: TSmallintField;
    cdsOFERTANTE: TSmallintField;
    cdsFUNCAO_EXERCEU_IGREJA: TIntegerField;
    cdsFUNCAO_GOSTARIA_EXERCER: TIntegerField;
    cdsOBSERVACOES: TMemoField;
    cdsID_UNIDADE: TIntegerField;
    cdsProfissao: TClientDataSet;
    dsProfissao: TDataSource;
    dsIgrejasBatismo: TDataSource;
    cdsIgrejasBatismo: TClientDataSet;
    cdsSEXO: TStringField;
    cdsDATA_ADMISSAO: TDateField;
    cdsPastorBatismo: TClientDataSet;
    dsPastorBatismo: TDataSource;
    dsFuncaoExerceu: TDataSource;
    cdsFuncaoExerceu: TClientDataSet;
    dsFuncaoGostExercer: TDataSource;
    cdsFuncaoGostExercer: TClientDataSet;
    grpNaturalidade: TGroupBox;
    lblNaturalidade: TLabel;
    lcbNaturalidade: TDBLookupComboBox;
    lblNacionalidade: TLabel;
    mmoObservacoes: TDBMemo;
    lblObservacoes: TLabel;
    grpDesativacaoMembro: TGroupBox;
    lblObservacao: TLabel;
    cbbSituacaoMembro: TJvDBComboBox;
    cbbTiposSaidaMembro: TJvDBComboBox;
    lblSituacaoMembro: TLabel;
    lblTiposSaidaMembro: TLabel;
    cdsSITUACAO: TSmallintField;
    cdsTIPOS_SAIDA_MEMBRO: TSmallintField;
    cdsID_NATURALIDADE: TIntegerField;
    cdsNACIONALIDADE: TSmallintField;
    cbbNacionalidade: TJvDBComboBox;
    cdsNaturalidade: TClientDataSet;
    dsNaturalidade: TDataSource;
    edtDataAdmissao: TJvDBDateEdit;
    lblDataAdmissao: TLabel;
    rgModeDeEntrada: TDBRadioGroup;
    cbOfertante: TDBCheckBox;
    cbDizimista: TDBCheckBox;
    lcbFuncaoGostariaExercer: TDBLookupComboBox;
    lblFuncaoGostariaExercer: TLabel;
    lcbFuncaoExerceu: TDBLookupComboBox;
    lblFuncaoJaExercida: TLabel;
    edtDataSaida: TJvDBDateEdit;
    lblDataSaida: TLabel;
    cdsDATA_SAIDA: TDateField;
    btnIncluirIgrejaBatismo: TAdvGlowButton;
    btnIncluirPastorBatismo: TAdvGlowButton;
    btnIncluirFuncaoExerceu: TAdvGlowButton;
    btnIncluirFuncaoGost: TAdvGlowButton;
    btnIncluirProfissao: TAdvGlowButton;
    btnIncluirCidade: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    lblTipoSanguineo: TLabel;
    cbbTipoSanguineo: TDBComboBox;
    cdsTIPO_SANGUINEO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure tbDadosComplementaresShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirIgrejaBatismoClick(Sender: TObject);
    procedure btnIncluirPastorBatismoClick(Sender: TObject);
    procedure btnIncluirFuncaoExerceuClick(Sender: TObject);
    procedure btnIncluirFuncaoGostClick(Sender: TObject);
    procedure btnIncluirProfissaoClick(Sender: TObject);
    procedure btnIncluirCidadeClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    function GetProfissao: string;
    function GetCidade: string;
    function GetFuncao: string;
    function GetIgreja: string;
    function GetPastor: string;
    procedure SetCidade;
    procedure SetIgrejaBatismo;
    procedure SetPastorBatismo;
    procedure SetFuncao;
    procedure SetProfissao;
  public
    { Public declarations }
  end;

var
  frm1Membro: Tfrm1Membro;

implementation

uses
  uSegurancaControle, uDataModule, uManipulacaoDados, uConsultasSql, ufrm1Profissao, ufrm1Cidade, ufrm1Funcao, ufrm1Igreja, ufrm1Pastor;

{$R *.dfm}

procedure Tfrm1Membro.btnIncluirProfissaoClick(Sender: TObject);
begin
  cdsID_PROFISSAO.AsString :=GetProfissao;
  SetProfissao;
end;

procedure Tfrm1Membro.AdvGlowButton1Click(Sender: TObject);
begin
  cdsID_NATURALIDADE.AsString :=GetCidade;
  SetCidade;
end;

procedure Tfrm1Membro.btnIncluirCidadeClick(Sender: TObject);
begin
  cdsID_CIDADE.AsString :=GetCidade;
  SetCidade;
end;

procedure Tfrm1Membro.btnIncluirFuncaoExerceuClick(Sender: TObject);
begin
  cdsFUNCAO_EXERCEU_IGREJA.AsString :=GetFuncao;
  SetFuncao;
end;

procedure Tfrm1Membro.btnIncluirFuncaoGostClick(Sender: TObject);
begin
  cdsFUNCAO_GOSTARIA_EXERCER.AsString :=GetFuncao;
  SetFuncao;
end;

procedure Tfrm1Membro.btnIncluirIgrejaBatismoClick(Sender: TObject);
begin
  cdsID_IGREJA_BATISMO.AsString :=GetIgreja;
  SetIgrejaBatismo;
end;

procedure Tfrm1Membro.btnIncluirPastorBatismoClick(Sender: TObject);
begin
  cdsID_PASTOR_BATISMO.AsString :=GetPastor;
  SetPastorBatismo;
end;

procedure Tfrm1Membro.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    if edtNome.CanFocus then
     edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Membro | Tabela: TBL_PAST_MEMBRO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Membro | Tabela: TBL_PAST_MEMBRO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
  inherited;
end;

procedure Tfrm1Membro.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_PAST_MEMBRO_ID');
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
  cdsSITUACAO.AsInteger :=cAtivo;
  cdsDIZIMISTA.AsInteger :=cNao;
  cdsOFERTANTE.AsInteger :=cNao;
end;

procedure Tfrm1Membro.FormShow(Sender: TObject);
begin
  inherited;
  pcInfoMembro.ActivePage :=tbDadosMembro;

  if edtNome.CanFocus then
   edtNome.SetFocus;

  SetCidade;
  SetProfissao;
end;

function Tfrm1Membro.GetCidade: string;
begin
  Result :=Consultar(cSqlTodasCidades, 'ID', 1, Tfrm1Cidade, frm1Cidade, 'TBL_CIDADE',
   'ID', 'ID', 'Cadastro de Cidade');
end;

function Tfrm1Membro.GetFuncao: string;
begin
  Result :=Consultar(cSqlTodasFuncoes, 'ID', 1, Tfrm1Funcao, frm1Funcao, 'TBL_FUNCAO',
   'ID', 'ID', 'Cadastro de Função');
end;

function Tfrm1Membro.GetIgreja: string;
begin
  Result :=Consultar(cSqlTodasIgrejas, 'ID', 1, Tfrm1Igreja, frm1Igreja, 'TBL_PAST_IGREJA',
   'ID', 'ID', 'Cadastro de Igreja');
end;

function Tfrm1Membro.GetPastor: string;
begin
  Result :=Consultar(cSqlTodosPastores, 'ID', 1, Tfrm1Pastor, frm1Profissao, 'TBL_PAST_PASTOR',
   'ID', 'ID', 'Cadastro de Pastor');
end;

function Tfrm1Membro.GetProfissao: string;
begin
  Result :=Consultar(cSqlTodasProfissoes, 'ID', 1, Tfrm1Profissao, frm1Profissao, 'TBL_PROFISSAO',
   'ID', 'ID', 'Cadastro de Profissão');
end;

procedure Tfrm1Membro.SetCidade;
begin
  TManipulacaoDados.PopulaCds(cdsCidade, cbbCidade, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasCidades);
  TManipulacaoDados.PopulaCds(cdsNaturalidade, lcbNaturalidade, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasCidades);
end;

procedure Tfrm1Membro.SetFuncao;
begin
  TManipulacaoDados.PopulaCds(cdsFuncaoExerceu, lcbFuncaoExerceu, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasFuncoes);
  TManipulacaoDados.PopulaCds(cdsFuncaoGostExercer, lcbFuncaoGostariaExercer, oAscendente, 'NOME', 'ID', 'NOME' ,
   cSqlTodasFuncoes);
end;

procedure Tfrm1Membro.SetIgrejaBatismo;
begin
  TManipulacaoDados.PopulaCds(cdsIgrejasBatismo, lcbIgrejaBatismo, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasIgrejas);
end;

procedure Tfrm1Membro.SetPastorBatismo;
begin
  TManipulacaoDados.PopulaCds(cdsPastorBatismo, lcbPastorBatismo, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodosPastores);
end;

procedure Tfrm1Membro.SetProfissao;
begin
  TManipulacaoDados.PopulaCds(cdsProfissao, lcbProfissao, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodasProfissoes);
end;

procedure Tfrm1Membro.tbDadosComplementaresShow(Sender: TObject);
begin
  SetIgrejaBatismo;
  SetPastorBatismo;
  SetFuncao;
end;

end.
