unit ufrm2BaixaPatrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Mask, JvExMask, JvToolEdit, cxContainer, cxTextEdit, cxButtonEdit,
  System.Actions, Vcl.ActnList, Vcl.DBCtrls;

const
  cBaixado =0;
  SqlBuscaPatrimonio ='SELECT NOME FROM TBL_PATRIMONIO WHERE NUMERO_PATRIMONIO = %d'+
    ' AND SITUACAO IN(1,2) AND ID_UNIDADE = %d';

type
  Tfrm2BaixaPatrimonio = class(Tfrm1Cadastro)
    pnlDadosBaixa: TPanel;
    pnlItensBaixados: TPanel;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    lblBensBaixados: TLabel;
    btnAddItemBaixar: TAdvGlowButton;
    edtDataBaixa: TJvDateEdit;
    lblDataBaixa: TLabel;
    edtCodigoPatrimonio: TcxTextEdit;
    lblNumeroPatrimonio: TLabel;
    edtNomePatrimonio: TcxTextEdit;
    lblNomePatrimonio: TLabel;
    cxGridTV_NumeroPatrimonio: TcxGridDBColumn;
    cxGridTV_NomePatrimonio: TcxGridDBColumn;
    grpDados: TGroupBox;
    cdsNUMERO_PATRIMONIO: TIntegerField;
    cdsNOME_PATRIMONIO: TStringField;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    cxStyleTituloGrid: TcxStyle;
    lcbMotivoBaixa: TDBLookupComboBox;
    btnIncluirMotivo: TAdvGlowButton;
    lblMotivoBaixa: TLabel;
    cdsMotivoBaixa: TClientDataSet;
    dsMotivoBaixa: TDataSource;
    procedure edtCodigoPatrimonioExit(Sender: TObject);
    procedure edtCodigoPatrimonioKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnAddItemBaixarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function RetornaNomePatrimonio(pCodigoPatrimonio: Integer): String;
    procedure AdicionaItemBaixar;
    function RealizaBaixa: Boolean;
    function PatrimonioBaixado(pNumeroPatrimonio: string): Boolean;
    procedure SetMotivosBaixa;
    function GetMotivosBaixa: string;
  public
    { Public declarations }
  end;

var
  frm2BaixaPatrimonio: Tfrm2BaixaPatrimonio;

implementation

uses
  uDataModule, uManipulacaoDados, uSegurancaControle, ufrm0Aguarde, uServerUtils.Data, uConsultasSql;

{$R *.dfm}

procedure Tfrm2BaixaPatrimonio.AdicionaItemBaixar;
begin
  try
    cds.DisableControls;
    cxGrid.BeginUpdate();

    cds.Open;
    cds.Insert;
    cdsNUMERO_PATRIMONIO.AsInteger :=StrToInt(edtCodigoPatrimonio.Text);
    cdsNOME_PATRIMONIO.AsString :=edtNomePatrimonio.Text;
    cds.Post;

  finally
    cds.EnableControls;
    cxGrid.EndUpdate;;
  end;
end;

procedure Tfrm2BaixaPatrimonio.btnAddItemBaixarClick(Sender: TObject);
begin
  if (edtCodigoPatrimonio.Text<>EmptyStr) and (edtNomePatrimonio.Text<>EmptyStr) then
    begin
      if (cds.locate('NUMERO_PATRIMONIO', edtCodigoPatrimonio.Text, [lopartialkey,locaseinsensitive])) then
      begin
        Application.MessageBox('Registro já incluído.','Atenção',MB_OK+MB_ICONWARNING);
        edtCodigoPatrimonio.SetFocus;
        Abort;
      end;

      AdicionaItemBaixar;
      edtCodigoPatrimonio.Clear;
      edtNomePatrimonio.Clear;
    end
  else
  begin
    Application.MessageBox('Informe um Patrimônio.','Atenção',MB_OK+MB_ICONINFORMATION);
  end;

  if edtCodigoPatrimonio.CanFocus then
    edtCodigoPatrimonio.SetFocus;
end;

procedure Tfrm2BaixaPatrimonio.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm2BaixaPatrimonio.btnSalvarClick(Sender: TObject);
begin
  if edtDataBaixa.Date=0 then
  begin
    Application.MessageBox('Informe a Data de Baixa.','Atenção',MB_OK+MB_ICONWARNING);
    edtDataBaixa.SetFocus;
    Exit;
  end;
//  if lcbMotivoBaixa.KeyValue=null then
//  begin
//    Application.MessageBox('Informe o Motivo da Baixa.','Atenção',MB_OK+MB_ICONWARNING);
//    lcbMotivoBaixa.SetFocus;
//    Exit;
//  end;
  if cds.RecordCount=0 then
  begin
    Application.MessageBox('Informe no mínimo 1 Patrimônio.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.SetFocus;
    Exit;
  end;

  CriarTelaAguarde('Aguarde...Realizando baixas');
  try
    try
      if RealizaBaixa then
      begin
        TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Baixas de Patrimônio realizadas! Tela: '+
         'Baixa de Patrimônio | Tabela: TBL_PATRIMONIO | Chave da Tabela: ID');

        Application.MessageBox('Baixa(s) realizada(s) com sucesso!','Atenção',MB_OK+MB_ICONINFORMATION);
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

procedure Tfrm2BaixaPatrimonio.edtCodigoPatrimonioExit(Sender: TObject);
begin
  if PatrimonioBaixado(edtCodigoPatrimonio.Text) then
  begin
    Application.MessageBox('Patrimônio já se encontra Baixado.','Atenção',MB_OK+MB_ICONWARNING);
    edtCodigoPatrimonio.Text :=EmptyStr;
    edtCodigoPatrimonio.SetFocus;
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

procedure Tfrm2BaixaPatrimonio.edtCodigoPatrimonioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtCodigoPatrimonioExit(Sender);
end;

procedure Tfrm2BaixaPatrimonio.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2BaixaPatrimonio.FormShow(Sender: TObject);
begin
  TManipulacaoDados.PopulaCds(cdsMotivoBaixa, lcbMotivoBaixa, oAscendente, 'NOME', 'ID', 'NOME',
   cSqlTodosMotivosBaixa);
end;

function Tfrm2BaixaPatrimonio.GetMotivosBaixa: string;
begin
//  Result :=Consultar(cSqlTodosMotivosBaixa, 'ID', 1, Tfrm1Cidade, frm1Cidade, 'TBL_PAT_MOTIVO_BAIXA',
//   'ID', 'ID', 'Cadastro de Motivos de Baixa');
end;

function Tfrm2BaixaPatrimonio.PatrimonioBaixado(pNumeroPatrimonio: string): Boolean;
var
  vSql, vSituacao: string;
begin
  if pNumeroPatrimonio=EmptyStr then
  begin
    Result :=False;
    Abort;
  end;

  vSql :='SELECT SITUACAO FROM TBL_PATRIMONIO WHERE NUMERO_PATRIMONIO = '+pNumeroPatrimonio+
    ' AND ID_UNIDADE = '+IntToStr(DM.IdUnidade);
  try
    vSituacao :=TManipulacaoDados.RetornaCampo(vSql);
    Result :=StrToIntDef(vSituacao,-1)=cBaixado;
  except
    Result :=True;
  end;
end;

function Tfrm2BaixaPatrimonio.RealizaBaixa: Boolean;
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
      vScript.Append('UPDATE TBL_PATRIMONIO SET SITUACAO = '+IntToStr(cBaixado)+
        ', DATA_BAIXA = '+TServerUtilsData.DataToSql(edtDataBaixa.Date)+
        //', ID_MOTIVO_BAIXA = '+lcbMotivoBaixa.KeyValue+
        ' WHERE NUMERO_PATRIMONIO = '+IntToStr(cdsNUMERO_PATRIMONIO.AsInteger)+
        ' AND ID_UNIDADE = '+IntToStr(DM.IdUnidade)+';');

      cds.Next;
    end;

    if TManipulacaoDados.ExecuteSql(vScript.ToString) then
     Result :=True;
  finally
    cds.EnableControls;
    FreeAndNil(vScript);
  end;
end;

function Tfrm2BaixaPatrimonio.RetornaNomePatrimonio(pCodigoPatrimonio: Integer): String;
begin
  Result:=Trim(TManipulacaoDados.RetornaCampo(Format(SqlBuscaPatrimonio,[pCodigoPatrimonio, DM.IdUnidade])));
end;

procedure Tfrm2BaixaPatrimonio.SetMotivosBaixa;
begin

end;

end.
