unit ufrm2Categoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxClasses, Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  cxContainer, cxLabel, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvPageList,
  cxGroupBox, ufrm1Categoria, uManipulacaoDados, uDataModule, uSegurancaControle;

const
  SqlIncluirCategoria ='SELECT * FROM TBL_CATEGORIA WHERE ID = -1';

  SqlBuscaCategorias ='SELECT ID, NOME FROM TBL_CATEGORIA';

  SqlAlterarCategoria ='SELECT * FROM TBL_CATEGORIA WHERE ID = %d';

  SqlDeletarCategoria = 'DELETE FROM TBL_CATEGORIA WHERE ID = %d;';

type
  Tfrm2Categoria = class(Tfrm2Manipulacao)
    cxGridCodCategoria: TcxGridDBColumn;
    cxGridNomeCategoria: TcxGridDBColumn;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    gbFiltro: TcxGroupBox;
    pbBasico: TJvPageList;
    PagFiltro: TJvStandardPage;
    cbbCondicao: TJvComboBox;
    edtFiltro: TEdit;
    lblCampo: TcxLabel;
    lblCondicao: TcxLabel;
    cbbCampoPesquisa: TJvComboBox;
    btnLocalizar: TAdvGlowButton;
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
  private
    procedure GetCategorias;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Categoria: Tfrm2Categoria;
  vFiltros: string;

implementation

uses
  uFiltros, ufrm0Aguarde;

{$R *.dfm}

procedure Tfrm2Categoria.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Categoria;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Categoria.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarCategoria,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Categoria.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlDeletarCategoria,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Deletado! Tela: '+
       'Cadastro de Categoria | Tabela: TBL_CATEGORIA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Categoria.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Categoria;
begin
  loForm :=Tfrm1Categoria.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirCategoria);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Categoria.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Categorias');
  GetCategorias;
  FecharTelaAguarde;
end;

procedure Tfrm2Categoria.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Categoria.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Categoria.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Categoria.GetCategorias;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, SqlBuscaCategorias+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Categoria.SetFiltros: Boolean;
begin
  Result :=False;
  vFiltros :=EmptyStr;

  if (cbbCampoPesquisa.ItemIndex<>-1) and (cbbCondicao.ItemIndex<>-1) and (Trim(edtFiltro.Text)<>EmptyStr) then
  begin
    Result :=True;

    case cbbCampoPesquisa.ItemIndex of
      fID:
      begin
        if cbbCondicao.ItemIndex=fIgualA then
         vFiltros :=' WHERE ID = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' WHERE ID STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

      fNome:
      begin
        if cbbCondicao.ItemIndex=fIgualA then
         vFiltros :=' WHERE NOME = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' WHERE NOME STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

    end;
  end;
end;

end.
