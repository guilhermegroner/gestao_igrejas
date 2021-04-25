unit ufrm2TransferenciaPatrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, cxTextEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

const
  SqlBuscaPatrimonio ='SELECT NOME FROM TBL_PATRIMONIO WHERE NUMERO_PATRIMONIO = %d'+
    ' AND SITUACAO IN(1,2) AND ID_UNIDADE = %d AND ID_SETOR = %d';

  SqlUnidadesUsuario ='SELECT U.ID, U.NOME'+
     ' FROM TBL_USUARIO_UNIDADE  UU'+
     ' INNER JOIN TBL_UNIDADE U ON (U.ID = UU.ID_UNIDADE)'+
    ' WHERE UU.ID_USUARIO = %d';

 SqlSetoresDestino ='SELECT S.ID, S.NOME FROM TBL_SETOR S'+
    ' INNER JOIN TBL_UNIDADE U ON (U.ID = S.ID_UNIDADE)'+
    ' WHERE S.ATIVO = 1'+
    ' AND S.ID_UNIDADE = %d'+
    ' AND S.ID <> %d';

type
  Tfrm2TransferenciaPatrimonio = class(Tfrm1Cadastro)
    pnlDadosTransf: TPanel;
    pnlItensBaixados: TPanel;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridTV_NumeroPatrimonio: TcxGridDBColumn;
    cxGridTV_NomePatrimonio: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlItens: TPanel;
    edtDataTransf: TJvDateEdit;
    lblDataTransf: TLabel;
    lcbMotivoTransf: TDBLookupComboBox;
    lblMotivoTransf: TLabel;
    lcbSetorOrigem: TDBLookupComboBox;
    lblSetorOrigem: TLabel;
    lcbSetorDestino: TDBLookupComboBox;
    lblSetorDestino: TLabel;
    grp1: TGroupBox;
    lblNomePatrimonio: TLabel;
    lblNumeroPatrimonio: TLabel;
    btnAddItemBaixar: TAdvGlowButton;
    edtNomePatrimonio: TcxTextEdit;
    edtCodigoPatrimonio: TcxTextEdit;
    lblBensTransferidos: TLabel;
    cdsMotivo: TClientDataSet;
    dsMotivo: TDataSource;
    dsSetorOrigem: TDataSource;
    cdsSetorOrigem: TClientDataSet;
    dsSetorDestino: TDataSource;
    cdsSetorDestino: TClientDataSet;
    cdsNUMERO_PATRIMONIO: TIntegerField;
    cdsNOME_PATRIMONIO: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbSetorOrigemClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodigoPatrimonioExit(Sender: TObject);
    procedure edtCodigoPatrimonioKeyPress(Sender: TObject; var Key: Char);
  private
    function RealizaTransferencia: Boolean;
    function RetornaNomePatrimonio(pCodigoPatrimonio: Integer): String;
  public
    { Public declarations }
  end;

var
  frm2TransferenciaPatrimonio: Tfrm2TransferenciaPatrimonio;

implementation

uses
  uManipulacaoDados, uConsultasSql, uDataModule, ufrm0Aguarde, uSegurancaControle, uServerUtils.Data;

{$R *.dfm}

procedure Tfrm2TransferenciaPatrimonio.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm2TransferenciaPatrimonio.btnSalvarClick(Sender: TObject);
begin
  if cds.RecordCount=0 then
  begin
    Application.MessageBox('Informe no mínimo 1 Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.SetFocus;
    Abort;
  end;

  CriarTelaAguarde('Aguarde...Realizando transferências');
  try
    try
      if RealizaTransferencia then
      begin
        TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Transferências de Patrimônio realizadas! Tela: '+
         'Transferência de Patrimônio | Tabela: TBL_TRANSFERENCIA_PATRIMONIO | Chave da Tabela: ID');

        Application.MessageBox('Transferência(s) realizada(s) com sucesso!','Atenção',MB_OK+MB_ICONINFORMATION);
        Close;
      end;
    finally
      FecharTelaAguarde;
    end;
  except
    on E: Exception do
     Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
      'Atenção!',mb_OK + MB_ICONINFORMATION);
  end;
end;

procedure Tfrm2TransferenciaPatrimonio.edtCodigoPatrimonioExit(Sender: TObject);
begin
  if edtDataTransf.Date=0 then
  begin
    Application.MessageBox('Informe a Data de Transferência.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.Text:=EmptyStr;
    edtDataTransf.SetFocus;
    Abort;
  end;
  if lcbMotivoTransf.KeyValue=null then
  begin
    Application.MessageBox('Informe o Motivo da Transferência.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.Text:=EmptyStr;
    lcbMotivoTransf.SetFocus;
    Abort;
  end;
  if lcbSetorOrigem.KeyValue=null then
  begin
    Application.MessageBox('Informe o Setor de Origem.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.Text:=EmptyStr;
    lcbSetorOrigem.SetFocus;
    Abort;
  end;
  if lcbSetorDestino.KeyValue=null then
  begin
    Application.MessageBox('Informe o Setor de Destino.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.Text:=EmptyStr;
    lcbSetorDestino.SetFocus;
    Abort;
  end;

  edtNomePatrimonio.Text:=RetornaNomePatrimonio(StrToIntDef(edtCodigoPatrimonio.Text,-1));
  if edtNomePatrimonio.Text=EmptyStr then
  begin
    edtCodigoPatrimonio.Text:=EmptyStr;
    edtCodigoPatrimonio.SetFocus;
  end
  else
  begin
    if (cds.locate('NUMERO_PATRIMONIO', edtCodigoPatrimonio.Text, [lopartialkey,locaseinsensitive])) then
    begin
      Application.MessageBox('Registro já incluído.','Atenção',MB_OK+MB_ICONWARNING);
      edtCodigoPatrimonio.SetFocus;
      Abort;
    end
    else
    if btnAddItemBaixar.CanFocus then
    btnAddItemBaixar.SetFocus;
  end;
end;

procedure Tfrm2TransferenciaPatrimonio.edtCodigoPatrimonioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtCodigoPatrimonioExit(Sender);
end;

procedure Tfrm2TransferenciaPatrimonio.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2TransferenciaPatrimonio.FormShow(Sender: TObject);
begin
  TManipulacaoDados.PopulaCds(cdsMotivo, lcbMotivoTransf, oAscendente, 'NOME', 'ID', 'NOME',
    cSqlTodosMotivosTransferencia);

  TManipulacaoDados.PopulaCds(cdsSetorOrigem, lcbSetorOrigem, oAscendente, 'NOME', 'ID', 'NOME',
    Format(cSqlTodosSetoresUnidade,[DM.IdUnidade]));
end;

procedure Tfrm2TransferenciaPatrimonio.lcbSetorOrigemClick(Sender: TObject);
var
  vIdSetorOrigem: Integer;
begin
  if lcbSetorOrigem.KeyValue<>null then
  begin
    vIdSetorOrigem :=lcbSetorOrigem.KeyValue;
    TManipulacaoDados.PopulaCds(cdsSetorDestino, lcbSetorDestino, oAscendente, 'NOME', 'ID', 'NOME',
      Format(SqlSetoresDestino ,[DM.IdUnidade, vIdSetorOrigem]));
  end;
end;

function Tfrm2TransferenciaPatrimonio.RealizaTransferencia: Boolean;
var
  vScript: TStringBuilder;
begin
  Result :=False;
  vScript :=TStringBuilder.Create;
  try
    cds.DisableControls;
    cds.First;
    while not cds.Eof do
    begin
//      vScript.Append('UPDATE TBL_PATRIMONIO SET SITUACAO = '+IntToStr(cBaixado)+
//        ', DATA_BAIXA = '+TServerUtilsData.DataToSql(edtDataBaixa.Date)+
//        ' WHERE NUMERO_PATRIMONIO = '+IntToStr(cdsNUMERO_PATRIMONIO.AsInteger)+
//        ' AND ID_UNIDADE = '+IntToStr(DM.IdUnidade)+';');

      cds.Next;
    end;

    if TManipulacaoDados.ExecuteSql(vScript.ToString) then
     Result :=True;
  finally
    cds.EnableControls;
    FreeAndNil(vScript);
  end;
end;

function Tfrm2TransferenciaPatrimonio.RetornaNomePatrimonio(pCodigoPatrimonio: Integer): String;
var
  vIdSetorOrigem: Integer;
begin
  vIdSetorOrigem :=lcbSetorOrigem.KeyValue;
  Result:=Trim(TManipulacaoDados.RetornaCampo(Format(SqlBuscaPatrimonio,[pCodigoPatrimonio, DM.IdUnidade, vIdSetorOrigem])));
end;

end.
