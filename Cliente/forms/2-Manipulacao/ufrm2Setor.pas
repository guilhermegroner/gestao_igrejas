unit ufrm2Setor;

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
  cxGroupBox;

const
  SqlIncluirSetor ='SELECT * FROM TBL_SETOR WHERE ID = -1';

  SqlBuscaSetores ='SELECT ID, NOME FROM TBL_SETOR WHERE ID_UNIDADE = %d'+
    ' AND ATIVO = 1';

  SqlAlterarSetor ='SELECT * FROM TBL_SETOR WHERE ID = %d';

  SqlDeletarSetor ='UPDATE TBL_SETOR SET ATIVO = 0 WHERE ID = %d;';

type
  Tfrm2Setor = class(Tfrm2Manipulacao)
    gbFiltro: TcxGroupBox;
    pbBasico: TJvPageList;
    PagFiltro: TJvStandardPage;
    cbbCondicao: TJvComboBox;
    edtFiltro: TEdit;
    lblCampo: TcxLabel;
    lblCondicao: TcxLabel;
    cbbCampoPesquisa: TJvComboBox;
    btnLocalizar: TAdvGlowButton;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_NOME: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
  private
    procedure GetSetores;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Setor: Tfrm2Setor;
  vFiltros: string;

implementation

uses
  ufrm1Setor, uManipulacaoDados, uSegurancaControle, uDataModule, ufrm0Aguarde, uFiltros;

{$R *.dfm}

procedure Tfrm2Setor.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Setor;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Setor.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarSetor,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Setor.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if TManipulacaoDados.RegistroExiste('TBL_PATRIMONIO', 'ID_SETOR', ' ID_SETOR = '+IntToStr(cdsID.Value)) then
  begin
    Application.MessageBox('Este setor possui Patrimônios cadastrados!'+#13+
     'A operação será cancelada.', 'Atenção',MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlDeletarSetor,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Deletado! Tela: '+
       'Cadastro de Setor | Tabela: TBL_SETOR | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Setor.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Setor;
begin
  loForm :=Tfrm1Setor.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirSetor);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Setor.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Setores');
  GetSetores;
  FecharTelaAguarde;
end;

procedure Tfrm2Setor.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Setor.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Setor.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Setor.GetSetores;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaSetores,[DM.IdUnidade])+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Setor.SetFiltros: Boolean;
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
         vFiltros :=' AND ID = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' AND ID STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

      fNome:
      begin
        if cbbCondicao.ItemIndex=fIgualA then
         vFiltros :=' AND NOME = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' AND NOME STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

    end;
  end;
end;

end.
