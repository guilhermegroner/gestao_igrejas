unit ufrm2Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxClasses, Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls, uDataModule,
  uSegurancaControle, uManipulacaoDados, cxContainer, cxLabel, Vcl.StdCtrls,
  JvExStdCtrls, JvCombobox, JvPageList, cxGroupBox, ufrm1Fornecedor;

const
  SqlIncluirFornecedor ='SELECT * FROM TBL_FORNECEDOR WHERE ID = -1;';

  SqlBuscaFornecedores ='SELECT ID, NOME, CNPJ FROM TBL_FORNECEDOR';

  SqlAlterarFornecedor ='SELECT * FROM TBL_FORNECEDOR WHERE ID = %d;';

  SqlDeletarFornecedor = 'DELETE FROM TBL_FORNECEDOR WHERE ID = %d;';

type
  Tfrm2Fornecedor = class(Tfrm2Manipulacao)
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCNPJ: TStringField;
    gbFiltro: TcxGroupBox;
    pbBasico: TJvPageList;
    PagFiltro: TJvStandardPage;
    cbbCondicao: TJvComboBox;
    edtFiltro: TEdit;
    lblCampo: TcxLabel;
    lblCondicao: TcxLabel;
    cbbCampoPesquisa: TJvComboBox;
    btnLocalizar: TAdvGlowButton;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_NOME: TcxGridDBColumn;
    cxGrid_CNPJ: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
  private
    procedure GetFornecedores;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Fornecedor: Tfrm2Fornecedor;
  vFiltros: string;

implementation

uses
  uFiltros, ufrm0Aguarde;

{$R *.dfm}

{ Tfrm2Fornecedor }

procedure Tfrm2Fornecedor.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Fornecedor;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Fornecedor.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarFornecedor,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Fornecedor.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlDeletarFornecedor,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Deletado! Tela: '+
       'Cadastro de Responsável | Tabela: TBL_FORNECEDOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Fornecedor.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Fornecedor;
begin
  loForm :=Tfrm1Fornecedor.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirFornecedor);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Fornecedor.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Fornecedores');
  GetFornecedores;
  FecharTelaAguarde;
end;

procedure Tfrm2Fornecedor.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Fornecedor.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Fornecedor.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Fornecedor.GetFornecedores;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, SqlBuscaFornecedores+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Fornecedor.SetFiltros: Boolean;
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
