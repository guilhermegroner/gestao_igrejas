unit ufrm2SaidaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Vcl.StdCtrls, Vcl.DBCtrls, cxLabel, cxGroupBox, cxClasses,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit;

Const
  SqlIncluirSaida ='SELECT * FROM TBL_EST_SAIDA WHERE ID = -1';

  SqlIncluirItensSaida ='SELECT * FROM TBL_EST_ITENS_SAIDA WHERE ID = -1';

  SqlBuscaSaidas ='SELECT S.ID, S.DATA_SAIDA FROM TBL_EST_SAIDA S'+
    ' WHERE S.ID_UNIDADE = %d';

  SqlAlterarSaida ='SELECT * FROM TBL_EST_SAIDA WHERE ID = %d';

  SqlAlterarItensSaida ='SELECT * FROM TBL_EST_ITENS_SAIDA WHERE ID_SAIDA = %d';

  SqlDeletarSaida = 'DELETE FROM TBL_EST_SAIDA WHERE ID = %d;';

type
  Tfrm2SaidaEstoque = class(Tfrm2Manipulacao)
    gbFiltro: TcxGroupBox;
    btnLocalizar: TAdvGlowButton;
    cdsID: TIntegerField;
    cdsDATA_SAIDA: TDateField;
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_DATA_SAIDA: TcxGridDBColumn;
    lbl6: TLabel;
    edtDataInicial: TJvDateEdit;
    lbl7: TLabel;
    edtDataFinal: TJvDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
  private
    procedure GetSaidas;
  public
    { Public declarations }
  end;

var
  frm2SaidaEstoque: Tfrm2SaidaEstoque;

implementation

uses
  ufrm1SaidaEstoque, uManipulacaoDados, uSegurancaControle, ufrm0Aguarde, uDataModule, uServerUtils.Data;

{$R *.dfm}

procedure Tfrm2SaidaEstoque.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1SaidaEstoque;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1SaidaEstoque.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarSaida,[cdsID.AsInteger]));
    TManipulacaoDados.Consulta(loForm.cdsItens, Format(SqlAlterarItensSaida,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2SaidaEstoque.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1SaidaEstoque;
begin
  loForm :=Tfrm1SaidaEstoque.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirSaida);
    TManipulacaoDados.Consulta(loForm.cdsItens, SqlIncluirItensSaida);

    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2SaidaEstoque.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Saídas');
  try
    GetSaidas;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2SaidaEstoque.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2SaidaEstoque.GetSaidas;
var
 vFiltroPeriodo: string;
begin
  vFiltroPeriodo :=EmptyStr;

  if (edtDataInicial.Date>0) and (edtDataFinal.Date >0) then
   vFiltroPeriodo :=' AND DATA_SAIDA BETWEEN '+TServerUtilsData.DataToSql(edtDataInicial.Date)+
    ' AND '+TServerUtilsData.DataToSql(edtDataFinal.Date);

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaSaidas,[DM.IdUnidade])+vFiltroPeriodo);

    TManipulacaoDados.OrdenaDataSet(cds, 'ID', oDescendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

end.
