unit ufrm1ProdutoEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  Tfrm1ProdutoEstoque = class(Tfrm1Cadastro)
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblUnidadeMedida: TLabel;
    lblGrupo: TLabel;
    lcbUnidadeMedida: TDBLookupComboBox;
    btnIncluirUnidadeMedida: TAdvGlowButton;
    lcbGrupo: TDBLookupComboBox;
    btnIncluirGrupo: TAdvGlowButton;
    cdsUnidadeMedida: TClientDataSet;
    dsUnidadeMedida: TDataSource;
    cdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsID_UNIDADE_MEDIDA: TIntegerField;
    cdsID_GRUPO: TIntegerField;
    cdsID_UNIDADE: TIntegerField;
    edtQtdeMinima: TDBEdit;
    lblQtdeMinima: TLabel;
    cdsQUANTIDADE_MINIMA: TIntegerField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirUnidadeMedidaClick(Sender: TObject);
    procedure btnIncluirGrupoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetUnidadeMedida;
    procedure SetGrupo;
    function GetUnidadeMedida: string;
    function GetGrupo: string;
  public
    { Public declarations }
  end;

var
  frm1ProdutoEstoque: Tfrm1ProdutoEstoque;

implementation

uses
  uDataModule, uConsultasSql, uSegurancaControle, uManipulacaoDados, ufrm1UnidadeMedida, ufrm1GrupoEstoque;

{$R *.dfm}

procedure Tfrm1ProdutoEstoque.btnIncluirGrupoClick(Sender: TObject);
begin
  cdsID_GRUPO.AsString :=GetGrupo;
  SetGrupo;
end;

procedure Tfrm1ProdutoEstoque.btnIncluirUnidadeMedidaClick(Sender: TObject);
begin
  cdsID_UNIDADE_MEDIDA.AsString :=GetUnidadeMedida;
  SetUnidadeMedida;
end;

procedure Tfrm1ProdutoEstoque.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    if edtNome.CanFocus then
     edtNome.SetFocus;
    Exit;
  end;

  if cds.State=dsInsert then
    begin
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Produto | Tabela: TBL_EST_PRODUTO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Produto | Tabela: TBL_EST_PRODUTO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
  inherited;
end;

procedure Tfrm1ProdutoEstoque.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_EST_PRODUTO_ID');
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1ProdutoEstoque.FormShow(Sender: TObject);
begin
  inherited;
  SetUnidadeMedida;
  SetGrupo;
end;

function Tfrm1ProdutoEstoque.GetGrupo: string;
begin
  Result :=Consultar(Format(cSqlTodosGruposEstoque,[DM.IdUnidade]), 'ID', 1, Tfrm1GrupoEstoque, frm1GrupoEstoque, 'TBL_EST_GRUPO',
   'ID', 'ID', 'Cadastro de Grupo do Estoque');
end;

function Tfrm1ProdutoEstoque.GetUnidadeMedida: string;
begin
  Result :=Consultar(cSqlTodasUnidadesMedida, 'ID', 1, Tfrm1UnidadeMedida, frm1UnidadeMedida, 'TBL_EST_UNIDADE_MEDIDA',
   'ID', 'ID', 'Cadastro de Unidade de Medida');
end;

procedure Tfrm1ProdutoEstoque.SetGrupo;
begin
  TManipulacaoDados.PopulaCds(cdsGrupo, lcbGrupo, oAscendente, 'NOME', 'ID', 'NOME' ,Format(cSqlTodosGruposEstoque,[DM.IdUnidade]));
end;

procedure Tfrm1ProdutoEstoque.SetUnidadeMedida;
begin
  TManipulacaoDados.PopulaCds(cdsUnidadeMedida, lcbUnidadeMedida, oAscendente, 'NOME', 'ID', 'NOME' ,
   cSqlTodasUnidadesMedida);
end;

end.
