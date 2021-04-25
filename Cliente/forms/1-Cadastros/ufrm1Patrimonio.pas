unit ufrm1Patrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  Vcl.Mask, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls, JvExMask, JvToolEdit, JvDBControls, uDataModule,
  uSegurancaControle, uManipulacaoDados, JvExStdCtrls, JvCombobox, JvDBCombobox, uConsultasSql,
  JvExExtCtrls, JvExtComponent, JvDBRadioPanel;

const
  cAtivo =1;

type
  Tfrm1Patrimonio = class(Tfrm1Cadastro)
    lblSetor: TLabel;
    lcbSetor: TDBLookupComboBox;
    lblNumeroPatrimonio: TLabel;
    edtNumeroPatrimonio: TDBEdit;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblMarca: TLabel;
    edtMarca: TDBEdit;
    lblTipoAquisicao: TLabel;
    lblEstado: TLabel;
    lblFornecedor: TLabel;
    lcbFornecedor: TDBLookupComboBox;
    Label1: TLabel;
    edtNumeroNotaFiscal: TDBEdit;
    lblCategoria: TLabel;
    lcbCategoria: TDBLookupComboBox;
    lblDataAquisicao: TLabel;
    lblDataImplantacao: TLabel;
    lblDataFinalGarantia: TLabel;
    lblObservacao: TLabel;
    mmoObservacao: TDBMemo;
    edtDataImplantacao: TJvDBDateEdit;
    edtDataAquisicao: TJvDBDateEdit;
    edtDataFinalGarantia: TJvDBDateEdit;
    cdsID: TIntegerField;
    cdsNUMERO_PATRIMONIO: TIntegerField;
    cdsNOME: TStringField;
    cdsTIPO_AQUISICAO: TIntegerField;
    cdsMARCA: TStringField;
    cdsESTADO: TIntegerField;
    cdsVALOR: TFMTBCDField;
    cdsID_CATEGORIA: TIntegerField;
    cdsID_FORNECEDOR: TIntegerField;
    cdsDATA_AQUISICAO: TDateField;
    cdsDATA_IMPLANTACAO: TDateField;
    cdsDATA_FINAL_GARANTIA: TDateField;
    cdsID_SETOR: TIntegerField;
    cdsOBSERVACOES: TBlobField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsSITUACAO: TIntegerField;
    cbbTipoAquisicao: TJvDBComboBox;
    cbbEstadoPatrimonio: TJvDBComboBox;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    cdsCategoria: TClientDataSet;
    dsCategoria: TDataSource;
    grpSituacao: TGroupBox;
    rpSituacao: TJvDBRadioPanel;
    cdsID_UNIDADE: TIntegerField;
    cdsNUMERO_NOTA_FISCAL: TIntegerField;
    cdsDATA_BAIXA: TDateField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumeroPatrimonioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Patrimonio: Tfrm1Patrimonio;

implementation

{$R *.dfm}

procedure Tfrm1Patrimonio.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;
  if Trim(edtNumeroPatrimonio.Text)=EmptyStr then
  begin
    Application.MessageBox('Informe o número do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    edtNumeroPatrimonio.SetFocus;
    Abort;
  end;
  if cbbEstadoPatrimonio.ItemIndex= -1 then
  begin
    Application.MessageBox('Informe o Estado do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    cbbEstadoPatrimonio.SetFocus;
    Abort;
  end;
  if lcbSetor.KeyValue=null then
  begin
    Application.MessageBox('Informe o Setor do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    lcbSetor.SetFocus;
    Abort;
  end;
  if lcbCategoria.KeyValue=null then
  begin
    Application.MessageBox('Informe a Categoria do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    lcbCategoria.SetFocus;
    Abort;
  end;
  if lcbFornecedor.KeyValue=null then
  begin
    Application.MessageBox('Informe o Fornecedor do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    lcbFornecedor.SetFocus;
    Abort;
  end;
  if edtDataImplantacao.Date=0 then
  begin
    Application.MessageBox('Informe a Data de Implantação do Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    edtDataImplantacao.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Patrimônio | Tabela: TBL_PATRIMONIO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Patrimônio | Tabela: TBL_PATRIMONIO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Patrimonio.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_PATRIMONIO_ID');
  cdsSITUACAO.AsInteger :=cAtivo;
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1Patrimonio.edtNumeroPatrimonioExit(Sender: TObject);
begin
  if StrToIntDef(edtNumeroPatrimonio.Text,0)<=0then
  begin
    Application.MessageBox('Número do Patrimônio deve ser superior a 0.','Atenção',MB_OK+MB_ICONWARNING);
    edtNumeroPatrimonio.Clear;
    edtNumeroPatrimonio.SetFocus;
    Exit;
  end;

  if TManipulacaoDados.RegistroExiste('TBL_PATRIMONIO','NUMERO_PATRIMONIO','NUMERO_PATRIMONIO = '+
    edtNumeroPatrimonio.Text+' AND ID_UNIDADE = '+IntToStr(DM.IdUnidade)+
    ' AND ID <> '+cdsID.AsString) then
  begin
    Application.MessageBox('Patrimônio já existente.','Atenção',MB_OK+MB_ICONWARNING);
    edtNumeroPatrimonio.Clear;
    edtNumeroPatrimonio.SetFocus;
    Exit;
  end;
end;

procedure Tfrm1Patrimonio.FormShow(Sender: TObject);
begin
  inherited;
  TManipulacaoDados.PopulaCds(cdsSetor, lcbSetor, oAscendente, 'NOME', 'ID', 'NOME', Format(cSqlTodosSetoresUnidade,[DM.IdUnidade]));
  TManipulacaoDados.PopulaCds(cdsFornecedor, lcbFornecedor, oAscendente, 'NOME', 'ID', 'NOME', cSqlTodosFornecedores);
  TManipulacaoDados.PopulaCds(cdsCategoria, lcbCategoria, oAscendente, 'NOME', 'ID', 'NOME', cSqlTodasCategorias);

  lcbSetor.Enabled :=cds.State=dsInsert;
end;

end.
