unit ufrm1SaidaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.DBCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  JvDBControls, System.Actions, Vcl.ActnList;

const
  SqlBuscaNomeProduto ='SELECT NOME FROM TBL_EST_PRODUTO WHERE ID = %d';

type
  Tfrm1SaidaEstoque = class(Tfrm1Cadastro)
    pnlSaida: TPanel;
    lblDataMovimento: TLabel;
    edtDataMovimento: TJvDBDateEdit;
    pnlItensEntrada: TPanel;
    pnlTopItens: TPanel;
    grpProduto: TGroupBox;
    lblProduto: TLabel;
    lblCelular: TLabel;
    lcbProduto: TDBLookupComboBox;
    edtQuantidade: TDBEdit;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_Produto: TcxGridDBColumn;
    cxGridTV_Qtde: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlBotoes: TPanel;
    btnIncluirItem: TAdvGlowButton;
    btnEditarItem: TAdvGlowButton;
    btnGravarItem: TAdvGlowButton;
    btnCancelarItem: TAdvGlowButton;
    btnExcluirItem: TAdvGlowButton;
    pnlTituloItensSaida: TJvGradientHeaderPanel;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    cxStyleTituloGrid: TcxStyle;
    Acoes: TActionList;
    actIncluirProduto: TAction;
    actEditarProduto: TAction;
    actGravarProduto: TAction;
    actCancelarProduto: TAction;
    actExcluirProduto: TAction;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsID: TIntegerField;
    cdsDATA_SAIDA: TDateField;
    cdsOBSERVACOES: TMemoField;
    cdsID_UNIDADE: TIntegerField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsItensID: TIntegerField;
    cdsItensID_SAIDA: TIntegerField;
    cdsItensID_PRODUTO: TIntegerField;
    cdsItensQUANTIDADE: TIntegerField;
    cdsItensNOME_PRODUTO: TStringField;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actIncluirProdutoExecute(Sender: TObject);
    procedure actEditarProdutoExecute(Sender: TObject);
    procedure actGravarProdutoExecute(Sender: TObject);
    procedure actCancelarProdutoExecute(Sender: TObject);
    procedure cdsItensID_PRODUTOValidate(Sender: TField);
    procedure cdsItensAfterInsert(DataSet: TDataSet);
    procedure actExcluirProdutoExecute(Sender: TObject);
  private
    function RetornaNomeProduto(pCodigoProduto: Integer): string;
    procedure SetProduto;
  public
    { Public declarations }
  end;

var
  frm1SaidaEstoque: Tfrm1SaidaEstoque;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle, uConsultasSql;

{$R *.dfm}

procedure Tfrm1SaidaEstoque.actCancelarProdutoExecute(Sender: TObject);
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

procedure Tfrm1SaidaEstoque.actEditarProdutoExecute(Sender: TObject);
begin
  if cdsItens.IsEmpty then
    Exit;

  cdsItens.Edit;

  cxGrid.Enabled      :=False;
  pnlTopItens.Visible :=True;

  lcbProduto.Enabled       :=False;
  btnIncluirItem.Enabled   :=False;
  btnEditarItem.Enabled    :=False;
  btnGravarItem.Enabled    :=True;
  btnCancelarItem.Enabled  :=True;
  btnExcluirItem.Enabled   :=False;

  if lcbProduto.CanFocus then
    lcbProduto.SetFocus;
end;

procedure Tfrm1SaidaEstoque.actExcluirProdutoExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  cdsItens.Delete;

  btnEditarItem.Enabled  :=not cdsItens.IsEmpty;
  btnExcluirItem.Enabled :=not cdsItens.IsEmpty;
end;

procedure Tfrm1SaidaEstoque.actGravarProdutoExecute(Sender: TObject);
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

procedure Tfrm1SaidaEstoque.actIncluirProdutoExecute(Sender: TObject);
begin
  if edtDataMovimento.Date=0 then
  begin
    Application.MessageBox('Informe a Data do Movimento.','Atenção',MB_OK+MB_ICONWARNING);
    if edtDataMovimento.CanFocus then
     edtDataMovimento.SetFocus;
    Exit;
  end;

  cdsItens.Append;
  pnlTopItens.Visible :=True;

  lcbProduto.Enabled        :=True;
  btnIncluirItem.Enabled    :=False;
  btnEditarItem.Enabled     :=False;
  btnGravarItem.Enabled     :=True;
  btnCancelarItem.Enabled   :=True;
  btnExcluirItem.Enabled    :=False;

  if lcbProduto.CanFocus then
    lcbProduto.SetFocus;
end;

procedure Tfrm1SaidaEstoque.btnSalvarClick(Sender: TObject);
begin
  if edtDataMovimento.Date=0 then
  begin
    Application.MessageBox('Informe a Data do Movimento.','Atenção',MB_OK+MB_ICONWARNING);
    if edtDataMovimento.CanFocus then
     edtDataMovimento.SetFocus;
    Exit;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Saída de Produtos do Estoque | Tabela: TBL_EST_SAIDA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Data do Movimento: '+edtDataMovimento.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Saída de Produtos do Estoque | Tabela: TBL_EST_SAIDA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Data do Movimento: '+edtDataMovimento.Text);

  inherited;
  try
    if cdsItens.ApplyUpdates(0)=0 then
    begin
      Application.MessageBox('Saída de Estoque realizada com Sucesso.','Atenção',MB_OK+MB_ICONINFORMATION);
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

procedure Tfrm1SaidaEstoque.cdsItensAfterInsert(DataSet: TDataSet);
begin
  cdsItensID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_ITENS_SAIDA_ID');
  cdsItensID_SAIDA.AsInteger :=cdsID.AsInteger;
end;

procedure Tfrm1SaidaEstoque.cdsItensID_PRODUTOValidate(Sender: TField);
var
  vNomeProduto: string;
begin
  vNomeProduto :=RetornaNomeProduto(StrToIntDef(Sender.AsString,-1));

  if vNomeProduto<>EmptyStr then
   cdsItensNOME_PRODUTO.AsString :=vNomeProduto;
end;

procedure Tfrm1SaidaEstoque.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_SAIDA_ID');
  cdsID_USUARIO.AsInteger :=DM.IdUsuario;
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1SaidaEstoque.FormShow(Sender: TObject);
begin
  inherited;
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

function Tfrm1SaidaEstoque.RetornaNomeProduto(pCodigoProduto: Integer): string;
begin
  Result :=Trim(TManipulacaoDados.RetornaCampo(Format(SqlBuscaNomeProduto,[pCodigoProduto])));
end;

procedure Tfrm1SaidaEstoque.SetProduto;
begin
  TManipulacaoDados.PopulaCds(cdsProduto, lcbProduto, oAscendente, 'NOME', 'ID', 'NOME' ,
   Format(cSqlTodosProdutosEstoque,[DM.IdUnidade]));
end;

end.
