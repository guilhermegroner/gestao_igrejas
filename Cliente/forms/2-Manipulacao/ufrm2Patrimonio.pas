unit ufrm2Patrimonio;

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
  cxGroupBox, uManipulacaoDados, uSegurancaControle, uDataModule, ufrm1Patrimonio,
  Vcl.DBCtrls;

const
  cBaixado ='Baixado';

  SqlIncluirPatrimonio ='SELECT * FROM TBL_PATRIMONIO WHERE ID = -1';

  SqlBuscaPatrimonios ='SELECT P.ID, P.NOME,'+
     ' CASE P.SITUACAO'+
      ' WHEN 0 THEN ''Baixado'''+
      ' WHEN 1 THEN ''Em Uso'''+
      ' WHEN 2 THEN ''Transferido'''+
     ' END AS SITUACAO, P.NUMERO_PATRIMONIO'+
    ' FROM TBL_PATRIMONIO P'+
      ' WHERE P.ID_UNIDADE = %d';

  SqlAlterarPatrimonio ='SELECT * FROM TBL_PATRIMONIO WHERE ID = %d';

  SqlDeletarPatrimonio = 'DELETE FROM TBL_PATRIMONIO WHERE ID = %d;';

type
  Tfrm2Patrimonio = class(Tfrm2Manipulacao)
    gbFiltro: TcxGroupBox;
    lblCampo: TcxLabel;
    btnLocalizar: TAdvGlowButton;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsSITUACAO: TStringField;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_NOME: TcxGridDBColumn;
    cxGrid_SITUACAO: TcxGridDBColumn;
    cdsNUMERO_PATRIMONIO: TIntegerField;
    cxGrid_NumeroPatrimonio: TcxGridDBColumn;
    lcbSetor: TDBLookupComboBox;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    lblNumeroPatrimonio: TLabel;
    edtNumeroPatrimonio: TEdit;
    lblSituacaoPatrimonio: TLabel;
    cbbSituacaoPatrimonio: TComboBox;
    btnLimparSetor: TAdvGlowButton;
    procedure actLocalizarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbSituacaoPatrimonioExit(Sender: TObject);
    procedure btnLimparSetorClick(Sender: TObject);
  private
    procedure GetPatrimonios;
  public
    { Public declarations }
  end;

var
  frm2Patrimonio: Tfrm2Patrimonio;

implementation

uses
  uConsultasSql, ufrm0Aguarde;


{$R *.dfm}

{ Tfrm2Patrimonio }

procedure Tfrm2Patrimonio.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Patrimonio;
begin
  if cds.RecordCount=0 then
   Exit;

  if cdsSITUACAO.AsString=cBaixado then
  begin
    Application.MessageBox('Não é possível alterar um Patrimônio Baixado.','Atenção',MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  loForm :=Tfrm1Patrimonio.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarPatrimonio,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Patrimonio.actExcluirExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  if cdsSITUACAO.AsString=cBaixado then
  begin
    Application.MessageBox('Não é possível Excluir um Patrimônio Baixado.','Atenção',MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção',MB_YESNO + MB_ICONWARNING) = IDNO then
   Exit;

  try
    if TManipulacaoDados.ExecuteSql(Format(SqlDeletarPatrimonio,[cdsID.AsInteger])) then
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Deletado! Tela: '+
       'Cadastro de Patrimônio | Tabela: TBL_PATRIMONIO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsNOME.Value);

    actLocalizarExecute(Sender);
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2Patrimonio.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Patrimonio;
begin
  loForm :=Tfrm1Patrimonio.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirPatrimonio);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Patrimonio.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Patrimônios');
  try
    GetPatrimonios;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2Patrimonio.btnLimparSetorClick(Sender: TObject);
begin
  lcbSetor.KeyValue :=null;
end;

procedure Tfrm2Patrimonio.cbbSituacaoPatrimonioExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Patrimonio.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Patrimonio.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Patrimonio.FormShow(Sender: TObject);
begin
  TManipulacaoDados.PopulaCds(cdsSetor, lcbSetor, oAscendente, 'NOME', 'ID', 'NOME', Format(cSqlTodosSetoresUnidade,[DM.IdUnidade]));
end;

procedure Tfrm2Patrimonio.GetPatrimonios;
var
  vFiltroSetor, vFiltroNumeroPatrimonio, vFiltroSitPatrimonio: string;
begin
  vFiltroSetor :=EmptyStr;
  vFiltroNumeroPatrimonio :=EmptyStr;
  vFiltroSitPatrimonio :=EmptyStr;

  if lcbSetor.KeyValue<>null then
   vFiltroSetor:=' AND ID_SETOR = '+VarToStr(lcbSetor.KeyValue);

  if edtNumeroPatrimonio.Text<>EmptyStr then
    vFiltroNumeroPatrimonio :=' AND NUMERO_PATRIMONIO = '+edtNumeroPatrimonio.Text;

  if cbbSituacaoPatrimonio.ItemIndex > -1 then
    vFiltroSitPatrimonio :=' AND SITUACAO = '+IntToStr(cbbSituacaoPatrimonio.ItemIndex);

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaPatrimonios,[DM.IdUnidade])+vFiltroSetor+
     vFiltroNumeroPatrimonio+vFiltroSitPatrimonio);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

end.
