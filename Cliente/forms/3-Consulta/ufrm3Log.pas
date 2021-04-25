unit ufrm3Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxClasses, Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, Vcl.DBCtrls, uManipulacaoDados, uServerUtils.Data,
  uConsultasSql, frxClass, frxExportPDF, frxDBSet;

  Const
    SqlBuscaLogs = 'SELECT L.ID, L.DESCRICAO, L.DATA_LOG, L.NIVEL, U.USUARIO  FROM TBL_LOG L '+
      ' INNER JOIN TBL_USUARIO U ON (U.ID = L.ID_USUARIO)'+
      ' WHERE ID_UNIDADE = %d';

type
  Tfrm3Log = class(Tfrm2Manipulacao)
    lbl1: TLabel;
    shpBaixo: TShape;
    lbl9: TLabel;
    shpAlto: TShape;
    lbl11: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    shpNormal: TShape;
    lbl10: TLabel;
    lbl3: TLabel;
    lblFiltrar: TLabel;
    edtDataInicial: TJvDateEdit;
    lbl6: TLabel;
    edtDataFinal: TJvDateEdit;
    lbl7: TLabel;
    lbl15: TLabel;
    lbl8: TLabel;
    cbbNivel: TComboBox;
    btnLocalizar: TAdvGlowButton;
    cdsID: TIntegerField;
    cdsDESCRICAO: TStringField;
    cdsNIVEL: TIntegerField;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_Descricao: TcxGridDBColumn;
    cxGrid_Nivel: TcxGridDBColumn;
    cxGrid_NomeUsuario: TcxGridDBColumn;
    cxGrid_Data: TcxGridDBColumn;
    cdsDATA_LOG: TDateTimeField;
    cdsUSUARIO: TStringField;
    lcbUsuarios: TDBLookupComboBox;
    dsUsuarios: TDataSource;
    cdsUsuarios: TClientDataSet;
    btnLimparUsuario: TAdvGlowButton;
    btnImpPatPorSetor: TAdvGlowButton;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxDBLog: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure btnLimparUsuarioClick(Sender: TObject);
    procedure btnImpPatPorSetorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetUsuarios;
    procedure GetLog;
  public
    { Public declarations }
  end;

var
  frm3Log: Tfrm3Log;

implementation

uses
  uDataModule, uRelatorios, ufrm0Aguarde;


{$R *.dfm}


procedure Tfrm3Log.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Logs');
  try
    GetLog;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm3Log.btnImpPatPorSetorClick(Sender: TObject);
begin
  if cds.RecordCount=0 then
  begin
    Application.MessageBox('Não existem registros para impressão',
        'Atenção!',mb_OK + MB_ICONINFORMATION);
    Abort;
  end;

  CriarTelaAguarde('Aguarde...Gerando relatório');
  try
    try
      if TRelatorios.SetRelatorio(frxReport,'Log.fr3') then
      begin
        frxReport.ShowReport;
      end
      else
      begin
        Application.MessageBox('Relatório não encontrado!'+sLineBreak+'Entre em contato com o Suporte',
          'Informação!',mb_OK+MB_ICONINFORMATION);
      end;
    finally
      FecharTelaAguarde;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o suporte!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure Tfrm3Log.btnLimparUsuarioClick(Sender: TObject);
begin
  lcbUsuarios.KeyValue :=null;
end;

procedure Tfrm3Log.GetLog;
var
 vFiltroPeriodo, vFiltroNivel, vFiltroUsuario: string;
begin
  vFiltroPeriodo :=EmptyStr;
  vFiltroNivel :=EmptyStr;
  vFiltroUsuario :=EmptyStr;

  if (edtDataInicial.Date>0) and (edtDataFinal.Date >0) then
   vFiltroPeriodo :=' AND CAST(DATA_LOG AS DATE) BETWEEN '+TServerUtilsData.DataToSql(edtDataInicial.Date)+
    ' AND '+TServerUtilsData.DataToSql(edtDataFinal.Date);

  if cbbNivel.ItemIndex >0 then
   vFiltroNivel :='AND NIVEL = '+cbbNivel.Text;

  if lcbUsuarios.KeyValue<>null then
   vFiltroUsuario :='AND ID_USUARIO = '+VarToStr(lcbUsuarios.KeyValue);

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaLogs,[DM.IdUnidade])+vFiltroPeriodo+vFiltroNivel+vFiltroUsuario);

    TManipulacaoDados.OrdenaDataSet(cds, 'ID', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

procedure Tfrm3Log.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
  Self.WindowState :=wsMaximized;
end;


procedure Tfrm3Log.FormShow(Sender: TObject);
begin
  inherited;
  SetUsuarios;
end;

procedure Tfrm3Log.SetUsuarios;
begin
  TManipulacaoDados.PopulaCds(cdsUsuarios, lcbUsuarios, oAscendente, 'USUARIO', 'ID', 'USUARIO', cSqlTodosUsuarios);
end;

end.
