unit ufrm1EntradaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, JvExMask, JvToolEdit, JvDBControls, Vcl.Mask,
  Vcl.DBCtrls, System.Actions, Vcl.ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

const
  SqlBuscaNomeProduto ='SELECT NOME FROM TBL_EST_PRODUTO WHERE ID = %d';

type
  Tfrm1EntradaEstoque = class(Tfrm1Cadastro)
    pnlItensEntrada: TPanel;
    pnlTopItens: TPanel;
    pnlTituloItensEntrada: TJvGradientHeaderPanel;
    grpProduto: TGroupBox;
    lcbProduto: TDBLookupComboBox;
    lblProduto: TLabel;
    lblCelular: TLabel;
    edtQuantidade: TDBEdit;
    Acoes: TActionList;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_Produto: TcxGridDBColumn;
    cxGridTV_ValorUnitario: TcxGridDBColumn;
    cxGridTV_ValorTotal: TcxGridDBColumn;
    cxGridTV_Qtde: TcxGridDBColumn;
    actIncluirProduto: TAction;
    actEditarProduto: TAction;
    actGravarProduto: TAction;
    actCancelarProduto: TAction;
    actExcluirProduto: TAction;
    cdsID: TIntegerField;
    cdsID_FORNECEDOR: TIntegerField;
    cdsDATA_EMISSAO_NOTA: TDateField;
    cdsDATA_ENTRADA: TDateField;
    cdsVALOR: TFMTBCDField;
    cdsID_UNIDADE: TIntegerField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsFornecedor: TClientDataSet;
    dsFornecedor: TDataSource;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensID: TIntegerField;
    cdsItensID_ENTRADA: TIntegerField;
    cdsItensID_PRODUTO: TIntegerField;
    cdsItensQUANTIDADE: TIntegerField;
    cdsItensVALOR_UNITARIO: TFMTBCDField;
    cdsItensNOME_PRODUTO: TStringField;
    cdsItensVALOR_TOTAL_ITEM: TFloatField;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    pnlEntrada: TPanel;
    edtNumeroNotaFiscal: TDBEdit;
    lblNotaFiscal: TLabel;
    lcbFornecedor: TDBLookupComboBox;
    lblFornecedor: TLabel;
    edtDataEmissaoNota: TJvDBDateEdit;
    lblDataEmissaoNota: TLabel;
    edtDataEntrada: TJvDBDateEdit;
    lblDataEntrada: TLabel;
    edtValorTotalNota: TDBEdit;
    lblValorTotalNota: TLabel;
    btnIncluirFornecedor: TAdvGlowButton;
    pnlBotoes: TPanel;
    btnIncluirItem: TAdvGlowButton;
    btnEditarItem: TAdvGlowButton;
    btnGravarItem: TAdvGlowButton;
    btnCancelarItem: TAdvGlowButton;
    btnExcluirItem: TAdvGlowButton;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    cxStyleTituloGrid: TcxStyle;
    btnIncluirProduto: TAdvGlowButton;
    edtValorUnitario: TDBEdit;
    lblValorUnitario: TLabel;
    cdsNUMERO_NOTA_FISCAL: TIntegerField;
    procedure actIncluirProdutoExecute(Sender: TObject);
    procedure actEditarProdutoExecute(Sender: TObject);
    procedure actGravarProdutoExecute(Sender: TObject);
    procedure actCancelarProdutoExecute(Sender: TObject);
    procedure actExcluirProdutoExecute(Sender: TObject);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsItensAfterInsert(DataSet: TDataSet);
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure cdsItensBeforePost(DataSet: TDataSet);
    procedure cdsItensID_PRODUTOValidate(Sender: TField);
  private
    function GetFornecedor: string;
    procedure SetFornecedor;
    function GetProduto: string;
    procedure SetProduto;
    function RetornaNomeProduto(pCodigoProduto: Integer): string;
  public
    { Public declarations }
  end;

var
  frm1EntradaEstoque: Tfrm1EntradaEstoque;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle, uConsultasSql, ufrm1Fornecedor, ufrm1ProdutoEstoque;

{$R *.dfm}

procedure Tfrm1EntradaEstoque.actCancelarProdutoExecute(Sender: TObject);
begin
  cdsItens.Cancel;

  cxGrid.Enabled      :=True;
  pnlTopItens.Visible :=False;

  btnIncluirItem.Enabled  :=True;
  btnGravarItem.Enabled   :=False;
  btnCancelarItem.Enabled :=False;

  btnEditarItem.Enabled  :=not cdsItens.IsEmpty;
  btnExcluirItem.Enabled :=not cdsItens.IsEmpty;

  if btnIncluirItem.CanFocus then
    btnIncluirItem.SetFocus;
end;

procedure Tfrm1EntradaEstoque.actEditarProdutoExecute(Sender: TObject);
begin
  if cdsItens.IsEmpty then
    Exit;

  cdsItens.Edit;

  cxGrid.Enabled      :=False;
  pnlTopItens.Visible :=True;

  lcbProduto.Enabled        :=False;
  btnIncluirProduto.Enabled :=False;
  btnIncluirItem.Enabled    :=False;
  btnEditarItem.Enabled     :=False;
  btnGravarItem.Enabled     :=True;
  btnCancelarItem.Enabled   :=True;
  btnExcluirItem.Enabled    :=False;

  if lcbProduto.CanFocus then
    lcbProduto.SetFocus;
end;

procedure Tfrm1EntradaEstoque.actExcluirProdutoExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  cdsItens.Delete;

  btnEditarItem.Enabled  :=not cdsItens.IsEmpty;
  btnExcluirItem.Enabled :=not cdsItens.IsEmpty;
end;

procedure Tfrm1EntradaEstoque.actGravarProdutoExecute(Sender: TObject);
begin
  if edtQuantidade.Text=EmptyStr then
  begin
    Application.MessageBox('Informe a Quantidade.','Atenção',MB_OK+MB_ICONWARNING);
    if edtQuantidade.CanFocus then
     edtQuantidade.SetFocus;
    Exit;
  end;

  cdsItens.Post;

  pnlTopItens.Visible :=False;

  btnIncluirItem.Enabled  :=True;
  btnGravarItem.Enabled   :=False;
  btnCancelarItem.Enabled :=False;

  cxGrid.Enabled :=True;

  btnEditarItem.Enabled  :=not cdsItens.IsEmpty;
  btnExcluirItem.Enabled :=not cdsItens.IsEmpty;

  if btnIncluirItem.CanFocus then
    btnIncluirItem.SetFocus;
end;

procedure Tfrm1EntradaEstoque.actIncluirProdutoExecute(Sender: TObject);
begin
  if lcbFornecedor.KeyValue=null then
  begin
    Application.MessageBox('Informe o Fornecedor.','Atenção',MB_OK+MB_ICONWARNING);
    if lcbFornecedor.CanFocus then
     lcbFornecedor.SetFocus;
    Exit;;
  end;
  if edtDataEntrada.Date=0 then
  begin
    Application.MessageBox('Informe a Data de Entrada.','Atenção',MB_OK+MB_ICONWARNING);
    if edtDataEntrada.CanFocus then
     edtDataEntrada.SetFocus;
    Exit;
  end;

  cdsItens.Append;
  pnlTopItens.Visible :=True;

  lcbProduto.Enabled        :=True;
  btnIncluirProduto.Enabled :=True;
  btnIncluirItem.Enabled    :=False;
  btnEditarItem.Enabled     :=False;
  btnGravarItem.Enabled     :=True;
  btnCancelarItem.Enabled   :=True;
  btnExcluirItem.Enabled    :=False;

  if lcbProduto.CanFocus then
    lcbProduto.SetFocus;
end;

procedure Tfrm1EntradaEstoque.btnIncluirFornecedorClick(Sender: TObject);
begin
  cdsID_FORNECEDOR.AsString :=GetFornecedor;
  SetFornecedor;
end;

procedure Tfrm1EntradaEstoque.btnIncluirProdutoClick(Sender: TObject);
begin
  cdsItensID_PRODUTO.AsString :=GetProduto;
  SetProduto;
end;

procedure Tfrm1EntradaEstoque.btnSalvarClick(Sender: TObject);
begin
  if edtDataEntrada.Date=0 then
  begin
    Application.MessageBox('Informe a Data de Entrada.','Atenção',MB_OK+MB_ICONWARNING);
    if edtDataEntrada.CanFocus then
     edtDataEntrada.SetFocus;
    Exit;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Entrada de Produtos no Estoque | Tabela: TBL_EST_ENTRADA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Fornecedor: '+lcbFornecedor.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Entrada de Produtos no Estoque | Tabela: TBL_EST_ENTRADA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Fornecedor: '+lcbFornecedor.Text);

  inherited;
  try
    if cdsItens.ApplyUpdates(0)=0 then
    begin
      Application.MessageBox('Entrada no Estoque realizada com Sucesso.','Atenção',MB_OK+MB_ICONINFORMATION);
      Close;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Problemas ao Salvar! Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  end;
end;

procedure Tfrm1EntradaEstoque.cdsItensAfterInsert(DataSet: TDataSet);
begin
  cdsItensID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_ITENS_ENTRADA_ID');
  cdsItensID_ENTRADA.AsInteger :=cdsID.AsInteger;
  cdsItensVALOR_UNITARIO.AsFloat :=0;
end;

procedure Tfrm1EntradaEstoque.cdsItensBeforePost(DataSet: TDataSet);
begin
  cdsItensVALOR_TOTAL_ITEM.AsFloat :=cdsItensQUANTIDADE.AsFloat*cdsItensVALOR_UNITARIO.AsFloat;
end;

procedure Tfrm1EntradaEstoque.cdsItensID_PRODUTOValidate(Sender: TField);
var
  vNomeProduto: string;
begin
  vNomeProduto :=RetornaNomeProduto(StrToIntDef(Sender.AsString,-1));

  if vNomeProduto<>EmptyStr then
   cdsItensNOME_PRODUTO.AsString :=vNomeProduto;
end;

procedure Tfrm1EntradaEstoque.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_ENTRADA_ID');
  cdsID_USUARIO.AsInteger :=DM.IdUsuario;
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1EntradaEstoque.FormShow(Sender: TObject);
begin
  inherited;
  SetFornecedor;
  SetProduto;

  btnEditarItem.Enabled  :=not cdsItens.IsEmpty;
  btnExcluirItem.Enabled :=not cdsItens.IsEmpty;

  cdsItens.DisableControls;
  cxGrid.BeginUpdate();
  try
    cdsItens.First;
    while not cdsItens.Eof do
    begin
      cdsItens.Edit;

      cdsItensNOME_PRODUTO.AsString :=RetornaNomeProduto(StrToIntDef(cdsItensID_PRODUTO.AsString,-1));;

      cdsItens.Post;
      cdsItens.Next;
    end;
  finally
    cdsItens.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm1EntradaEstoque.GetFornecedor: string;
begin
  Result :=Consultar(cSqlTodosFornecedores, 'ID', 1, Tfrm1Fornecedor, frm1Fornecedor, 'TBL_FORNECEDOR',
   'ID', 'ID', 'Cadastro de Fornecedor');
end;

function Tfrm1EntradaEstoque.GetProduto: string;
begin
  Result :=Consultar(Format(cSqlTodosProdutosEstoque,[DM.IdUnidade]), 'ID', 1, Tfrm1ProdutoEstoque, frm1ProdutoEstoque, 'TBL_EST_PRODUTO',
   'ID', 'ID', 'Cadastro de Produto do Estoque');
end;

function Tfrm1EntradaEstoque.RetornaNomeProduto(pCodigoProduto: Integer): string;
begin
  Result :=Trim(TManipulacaoDados.RetornaCampo(Format(SqlBuscaNomeProduto,[pCodigoProduto])));
end;

procedure Tfrm1EntradaEstoque.SetFornecedor;
begin
  TManipulacaoDados.PopulaCds(cdsFornecedor, lcbFornecedor, oAscendente, 'NOME', 'ID', 'NOME' ,cSqlTodosFornecedores);
end;

procedure Tfrm1EntradaEstoque.SetProduto;
begin
  TManipulacaoDados.PopulaCds(cdsProduto, lcbProduto, oAscendente, 'NOME', 'ID', 'NOME' ,Format(cSqlTodosProdutosEstoque,[DM.IdUnidade]));
end;

end.
