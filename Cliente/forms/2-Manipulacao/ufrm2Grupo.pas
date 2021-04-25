unit ufrm2Grupo;

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
  SqlIncluirGrupo ='SELECT * FROM TBL_PAST_GRUPO WHERE ID = -1';

  SqlBuscaGrupos ='SELECT ID, NOME FROM TBL_PAST_GRUPO'+
    ' WHERE ID_UNIDADE = %d';

  SqlAlterarGrupo ='SELECT * FROM TBL_PAST_GRUPO WHERE ID = %d';

  SqlDeletarGrupo = 'DELETE FROM TBL_PAST_GRUPO WHERE ID = %d;';

type
  Tfrm2Grupo = class(Tfrm2Manipulacao)
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
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_NOME: TcxGridDBColumn;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GetGrupos;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Grupo: Tfrm2Grupo;
  vFiltros: string;

implementation

uses
  ufrm1Grupo, uManipulacaoDados, uFiltros, uSegurancaControle, uDataModule, ufrm0Aguarde;

{$R *.dfm}

procedure Tfrm2Grupo.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Grupo;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Grupo.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarGrupo,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Grupo.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlDeletarGrupo,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Deletado! Tela: '+
       'Cadastro de Grupo | Tabela: TBL_PAST_GRUPO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Grupo.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Grupo;
begin
  loForm :=Tfrm1Grupo.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirGrupo);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Grupo.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Grupos');
  GetGrupos;
  FecharTelaAguarde;
end;

procedure Tfrm2Grupo.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Grupo.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Grupo.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Grupo.GetGrupos;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaGrupos,[DM.IdUnidade])+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Grupo.SetFiltros: Boolean;
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
