unit ufrm2Unidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxClasses,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  cxContainer, cxLabel, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvPageList,
  cxGroupBox;

const
  cAtivo ='Ativo';
  cInativo ='Inativo';

  SqlIncluirUnidade ='SELECT * FROM TBL_UNIDADE WHERE ID = -1';

  SqlBuscaUnidade ='SELECT ID, NOME, CASE ATIVO'+
       ' WHEN 0 THEN ''Inativo'''+
       ' WHEN 1 THEN ''Ativo'''+
    ' END AS SITUACAO FROM TBL_UNIDADE';

  SqlAlterarUnidade ='SELECT * FROM TBL_UNIDADE WHERE ID = %d';

  SqlInativarUnidade ='UPDATE TBL_UNIDADE SET ATIVO = 0 WHERE ID = %d;';

  SqlAtivarUnidade ='UPDATE TBL_UNIDADE SET ATIVO = 1 WHERE ID = %d;';

type
  Tfrm2Unidade = class(Tfrm2Manipulacao)
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
    cxGrid_Nome: TcxGridDBColumn;
    cdsSITUACAO: TStringField;
    cxGrid_Situacao: TcxGridDBColumn;
    actAtivar: TAction;
    btnAtivar: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actAtivarExecute(Sender: TObject);
  private
    procedure GetUnidades;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Unidade: Tfrm2Unidade;
  vFiltros: string;

implementation

uses
  uManipulacaoDados, uSegurancaControle, uDataModule, ufrm1Unidade, ufrm0Aguarde, uFiltros;

{$R *.dfm}

{ Tfrm2Unidade }

procedure Tfrm2Unidade.actAtivarExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if cdsSITUACAO.AsString=cAtivo then
   Exit;

  if Application.MessageBox('Deseja Reativar esta Unidade?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlAtivarUnidade,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Reativado! Tela: '+
       'Cadastro de Unidade | Tabela: TBL_UNIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Unidade.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Unidade;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Unidade.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarUnidade,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Unidade.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if cdsSITUACAO.AsString=cInativo then
   Exit;

  if Application.MessageBox('Deseja Inativar esta Unidade?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlInativarUnidade,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Inativado! Tela: '+
       'Cadastro de Unidade | Tabela: TBL_UNIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Unidade.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Unidade;
begin
  loForm :=Tfrm1Unidade.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirUnidade);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Unidade.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Unidades');
  try
    GetUnidades;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2Unidade.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Unidade.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Unidade.GetUnidades;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, SqlBuscaUnidade+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Unidade.SetFiltros: Boolean;
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
