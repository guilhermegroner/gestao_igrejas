unit ufrm2EntradaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxClasses, Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  cxContainer, Vcl.StdCtrls, Vcl.DBCtrls, cxLabel, cxGroupBox;

const
  SqlIncluirEntrada ='SELECT * FROM TBL_EST_ENTRADA WHERE ID = -1';

  SqlIncluirItensEntrada ='SELECT * FROM TBL_EST_ITENS_ENTRADA WHERE ID = -1';

  SqlBuscaEntradas ='SELECT E.ID, F.NOME AS NOME_FORNECEDOR, E.NUMERO_NOTA_FISCAL, E.DATA_EMISSAO_NOTA,'+
      ' E.DATA_ENTRADA, E.VALOR'+
     ' FROM TBL_EST_ENTRADA E'+
     ' INNER JOIN TBL_FORNECEDOR F ON (F.ID = E.ID_FORNECEDOR)'+
     ' WHERE E.ID_UNIDADE = %d';

  SqlAlterarEntrada ='SELECT * FROM TBL_EST_ENTRADA WHERE ID = %d';

  SqlAlterarItensEntrada ='SELECT * FROM TBL_EST_ITENS_ENTRADA WHERE ID_ENTRADA = %d';

  SqlDeletarEntrada = 'DELETE FROM TBL_EST_ENTRADA WHERE ID = %d;';

type
  Tfrm2EntradaEstoque = class(Tfrm2Manipulacao)
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_NOME_FORNECEDOR: TcxGridDBColumn;
    cxGridTV_NUMERO_NOTA: TcxGridDBColumn;
    cxGridTV_DATA_EMISSAO_NOTA: TcxGridDBColumn;
    cxGridTV_DATA_ENTRADA: TcxGridDBColumn;
    cxGridTV_VALOR_NOTA: TcxGridDBColumn;
    cdsID: TIntegerField;
    cdsNOME_FORNECEDOR: TStringField;
    cdsNUMERO_NOTA_FISCAL: TIntegerField;
    cdsDATA_EMISSAO_NOTA: TDateField;
    cdsDATA_ENTRADA: TDateField;
    cdsVALOR: TCurrencyField;
    gbFiltro: TcxGroupBox;
    lblNumeroNotaFiscal: TLabel;
    lblFornecedor: TcxLabel;
    btnLocalizar: TAdvGlowButton;
    lcbFornecedor: TDBLookupComboBox;
    edtNumeroNotaFiscal: TEdit;
    btnLimparFornecedor: TAdvGlowButton;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    procedure actIncluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparFornecedorClick(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
  private
    procedure GetEntradas;
    procedure SetFornecedor;
  public
    { Public declarations }
  end;

var
  frm2EntradaEstoque: Tfrm2EntradaEstoque;

implementation

uses
  uSegurancaControle, uManipulacaoDados, ufrm1EntradaEstoque, ufrm0Aguarde, uDataModule, uConsultasSql;

{$R *.dfm}

procedure Tfrm2EntradaEstoque.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1EntradaEstoque;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1EntradaEstoque.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarEntrada,[cdsID.AsInteger]));
    TManipulacaoDados.Consulta(loForm.cdsItens, Format(SqlAlterarItensEntrada,[cdsID.AsInteger]));
    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2EntradaEstoque.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1EntradaEstoque;
begin
  loForm :=Tfrm1EntradaEstoque.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirEntrada);
    TManipulacaoDados.Consulta(loForm.cdsItens, SqlIncluirItensEntrada);

    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2EntradaEstoque.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Entradas');
  try
    GetEntradas;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2EntradaEstoque.btnLimparFornecedorClick(Sender: TObject);
begin
  lcbFornecedor.KeyValue :=Null;
end;

procedure Tfrm2EntradaEstoque.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2EntradaEstoque.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2EntradaEstoque.FormShow(Sender: TObject);
begin
  SetFornecedor;
end;

procedure Tfrm2EntradaEstoque.GetEntradas;
var
  vFiltroFornecedor, vFiltroNumeroNotaFiscal: string;
begin
  vFiltroFornecedor :=EmptyStr;
  vFiltroNumeroNotaFiscal :=EmptyStr;

  if lcbFornecedor.KeyValue<>null then
   vFiltroFornecedor:=' AND ID_FORNECEDOR = '+VarToStr(lcbFornecedor.KeyValue);

  if edtNumeroNotaFiscal.Text<>EmptyStr then
    vFiltroNumeroNotaFiscal :=' AND NUMERO_NOTA_FISCAL = '+edtNumeroNotaFiscal.Text;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaEntradas,[DM.IdUnidade])+
      vFiltroFornecedor+vFiltroNumeroNotaFiscal);

    TManipulacaoDados.OrdenaDataSet(cds, 'ID', oDescendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

procedure Tfrm2EntradaEstoque.SetFornecedor;
begin
  TManipulacaoDados.PopulaCds(cdsFornecedor, lcbFornecedor, oAscendente, 'NOME',
    'ID', 'NOME' ,cSqlTodosFornecedores);
end;

end.
