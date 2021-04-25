unit ufrm2Membro;

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
  cxGroupBox, frxClass, frxDBSet, frxExportPDF;

const
  SqlFichaMembro ='SELECT M.ID, M.NOME, M.DATA_NASCIMENTO, M.GRAU_INSTRUCAO, P.NOME AS PROFISSAO,'+
     ' M.SEXO, M.NOME_PAI, M.NOME_MAE, M.ESTADO_CIVIL, M.NOME_CONJUGE, M.DATA_CASAMENTO,'+
     ' CN.NOME AS NATURALIDADE,'+
     ' CASE M.NACIONALIDADE'+
     ' WHEN 0 THEN ''Brasileira'''+
     ' WHEN 1 THEN ''Extrangeira'' END'+
     ' AS NACIONALIDADE,'+
     ' M.ENDERECO, M.ENDERECO_NUMERO, M.ENDERECO_BAIRRO, C.NOME AS CIDADE, M.TELEFONE,'+
     ' M.CELULAR, M.CEP, C.UF, I.NOME AS IGREJA_BATISMO, PT.NOME AS PASTOR_BATISMO,'+
     ' M.DATA_ADMISSAO, M.IGREJAS_FOI_MEMBRO,'+
     ' CASE M.MODO_ADMISSAO'+
     '  WHEN 0 THEN ''Batismo'''+
     '  WHEN 1 THEN ''Carta'''+
     '  WHEN 2 THEN ''Reconciliação'''+
     '  WHEN 3 THEN ''Aclamação'' END'+
     ' AS MODO_ADMISSAO,'+
    ' CASE M.DIZIMISTA'+
     ' WHEN 0 THEN ''Não'''+
     ' WHEN 1 THEN ''Sim'' END'+
     ' AS DIZIMISTA,'+
    ' CASE M.OFERTANTE'+
     ' WHEN 0 THEN ''Não'''+
     ' WHEN 1 THEN ''Sim'' END'+
     ' AS OFERTANTE, FE.NOME AS FUNCAO_GOSTARIA_EXERCER, FG.NOME AS FUNCAO_EXERCEU_IGREJA,'+
     ' M.DATA_SAIDA, M.CPF, M.RG, M.OBSERVACOES'+
     ' FROM TBL_PAST_MEMBRO M'+
    ' LEFT JOIN TBL_PROFISSAO P ON (P.ID = M.ID_PROFISSAO)'+
    ' LEFT JOIN TBL_CIDADE CN ON (CN.ID = M.ID_NATURALIDADE)'+
    ' LEFT JOIN TBL_CIDADE C ON (C.ID = M.ID_CIDADE)'+
    ' LEFT JOIN TBL_PAST_IGREJA I ON (I.ID = M.ID_IGREJA_BATISMO)'+
    ' LEFT JOIN TBL_PAST_PASTOR PT ON (PT.ID = M.ID_PASTOR_BATISMO)'+
    ' LEFT JOIN TBL_FUNCAO FE ON (FE.ID = M.FUNCAO_EXERCEU_IGREJA)'+
    ' LEFT JOIN TBL_FUNCAO FG ON (FG.ID = M.FUNCAO_GOSTARIA_EXERCER)'+
    ' WHERE M.ID = %d';

  SqlIncluirMembro ='SELECT * FROM TBL_PAST_MEMBRO WHERE ID = -1';

  SqlBuscaMembros ='SELECT ID, NOME, CPF FROM TBL_PAST_MEMBRO'+
    ' WHERE ID_UNIDADE = %d';

  SqlAlterarMembro ='SELECT * FROM TBL_PAST_MEMBRO WHERE ID = %d';

  SqlDeletarMembro = 'DELETE FROM TBL_PAST_MEMBRO WHERE ID = %d;';

type
  Tfrm2Membro = class(Tfrm2Manipulacao)
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
    cdsCPF: TStringField;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_Nome: TcxGridDBColumn;
    cxGrid_CPF: TcxGridDBColumn;
    btnImprimirFicha: TAdvGlowButton;
    actImprimirFicha: TAction;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    cdsFichaMembro: TClientDataSet;
    frxDBFichaMembro: TfrxDBDataset;
    cdsFichaMembroID: TIntegerField;
    cdsFichaMembroNOME: TStringField;
    cdsFichaMembroDATA_NASCIMENTO: TDateField;
    cdsFichaMembroGRAU_INSTRUCAO: TStringField;
    cdsFichaMembroPROFISSAO: TStringField;
    cdsFichaMembroSEXO: TStringField;
    cdsFichaMembroNOME_PAI: TStringField;
    cdsFichaMembroNOME_MAE: TStringField;
    cdsFichaMembroESTADO_CIVIL: TStringField;
    cdsFichaMembroNOME_CONJUGE: TStringField;
    cdsFichaMembroDATA_CASAMENTO: TDateField;
    cdsFichaMembroNATURALIDADE: TStringField;
    cdsFichaMembroNACIONALIDADE: TStringField;
    cdsFichaMembroENDERECO: TStringField;
    cdsFichaMembroENDERECO_NUMERO: TStringField;
    cdsFichaMembroENDERECO_BAIRRO: TStringField;
    cdsFichaMembroCIDADE: TStringField;
    cdsFichaMembroTELEFONE: TStringField;
    cdsFichaMembroCELULAR: TStringField;
    cdsFichaMembroCEP: TStringField;
    cdsFichaMembroUF: TStringField;
    cdsFichaMembroIGREJA_BATISMO: TStringField;
    cdsFichaMembroPASTOR_BATISMO: TStringField;
    cdsFichaMembroDATA_ADMISSAO: TDateField;
    cdsFichaMembroMODO_ADMISSAO: TStringField;
    cdsFichaMembroIGREJAS_FOI_MEMBRO: TStringField;
    cdsFichaMembroDIZIMISTA: TStringField;
    cdsFichaMembroOFERTANTE: TStringField;
    cdsFichaMembroFUNCAO_GOSTARIA_EXERCER: TStringField;
    cdsFichaMembroFUNCAO_EXERCEU_IGREJA: TStringField;
    cdsFichaMembroDATA_SAIDA: TDateField;
    cdsFichaMembroCPF: TStringField;
    cdsFichaMembroRG: TStringField;
    cdsFichaMembroOBSERVACAO: TBlobField;
    procedure actIncluirExecute(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actImprimirFichaExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
  private
    procedure GetMembros;
    function SetFiltros: Boolean;
    procedure ImprimirFicha;
  public
    { Public declarations }
  end;

var
  frm2Membro: Tfrm2Membro;
  vFiltros: string;

implementation

uses
  uSegurancaControle, uFiltros, uDataModule, ufrm1Membro, uManipulacaoDados, ufrm0Aguarde, uRelatorios;

{$R *.dfm}

procedure Tfrm2Membro.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Membro;
begin
  if cds.RecordCount=0 then
   Exit;

  loForm :=Tfrm1Membro.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarMembro,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    actLocalizarExecute(Self);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Membro.actImprimirFichaExecute(Sender: TObject);
begin
  if cds.RecordCount=0 then
   Exit;

  ImprimirFicha;
end;

procedure Tfrm2Membro.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Membro;
begin
  loForm :=Tfrm1Membro.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirMembro);
    loForm.CDS.Insert;
    loForm.ShowModal;

    actLocalizarExecute(Sender);
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Membro.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Membros');
  try
    GetMembros;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2Membro.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Membro.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Membro.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
  cdsFichaMembro.CreateDataSet;
end;

procedure Tfrm2Membro.GetMembros;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, Format(SqlBuscaMembros,[DM.IdUnidade])+vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

procedure Tfrm2Membro.ImprimirFicha;
var
  vCdsAux: TClientDataSet;
begin
  CriarTelaAguarde('Aguarde...Gerando ficha');
  cdsFichaMembro.EmptyDataSet;
  vCdsAux :=TClientDataSet.Create(nil);

  try
    try
      vCdsAux.Data :=TManipulacaoDados.GetDataDataSet(Format(SqlFichaMembro,[cdsID.AsInteger]));

      if vCdsAux.RecordCount=0 then
      begin
        Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
        Abort;
      end;

      vCdsAux.First;
      while not vCdsAux.Eof do
      begin
        cdsFichaMembro.Append;

        cdsFichaMembroID.AsInteger                       :=vCdsAux.FieldByName('ID').AsInteger;
        cdsFichaMembroNOME.AsString                      :=vCdsAux.FieldByName('NOME').AsString;
        cdsFichaMembroDATA_NASCIMENTO.AsString           :=vCdsAux.FieldByName('DATA_NASCIMENTO').AsString;
        cdsFichaMembroGRAU_INSTRUCAO.AsString            :=vCdsAux.FieldByName('GRAU_INSTRUCAO').AsString;
        cdsFichaMembroPROFISSAO.AsString                 :=vCdsAux.FieldByName('PROFISSAO').AsString;
        cdsFichaMembroSEXO.AsString                      :=vCdsAux.FieldByName('SEXO').AsString;
        cdsFichaMembroNOME_PAI.AsString                  :=vCdsAux.FieldByName('NOME_PAI').AsString;
        cdsFichaMembroNOME_MAE.AsString                  :=vCdsAux.FieldByName('NOME_MAE').AsString;
        cdsFichaMembroESTADO_CIVIL.AsString              :=vCdsAux.FieldByName('ESTADO_CIVIL').AsString;
        cdsFichaMembroNOME_CONJUGE.AsString              :=vCdsAux.FieldByName('NOME_CONJUGE').AsString;
        cdsFichaMembroDATA_CASAMENTO.AsString            :=vCdsAux.FieldByName('DATA_CASAMENTO').AsString;
        cdsFichaMembroNATURALIDADE.AsString              :=vCdsAux.FieldByName('NATURALIDADE').AsString;
        cdsFichaMembroNACIONALIDADE.AsString             :=vCdsAux.FieldByName('NACIONALIDADE').AsString;
        cdsFichaMembroENDERECO.AsString                  :=vCdsAux.FieldByName('ENDERECO').AsString;
        cdsFichaMembroENDERECO_NUMERO.AsString           :=vCdsAux.FieldByName('ENDERECO_NUMERO').AsString;
        cdsFichaMembroENDERECO_BAIRRO.AsString           :=vCdsAux.FieldByName('ENDERECO_BAIRRO').AsString;
        cdsFichaMembroTELEFONE.AsString                  :=vCdsAux.FieldByName('TELEFONE').AsString;
        cdsFichaMembroCELULAR.AsString                   :=vCdsAux.FieldByName('CELULAR').AsString;
        cdsFichaMembroCIDADE.AsString                    :=vCdsAux.FieldByName('CIDADE').AsString;
        cdsFichaMembroUF.AsString                        :=vCdsAux.FieldByName('UF').AsString;
        cdsFichaMembroCEP.AsString                       :=vCdsAux.FieldByName('CEP').AsString;
        cdsFichaMembroIGREJA_BATISMO.AsString            :=vCdsAux.FieldByName('IGREJA_BATISMO').AsString;
        cdsFichaMembroPASTOR_BATISMO.AsString            :=vCdsAux.FieldByName('PASTOR_BATISMO').AsString;
        cdsFichaMembroDATA_ADMISSAO.AsString             :=vCdsAux.FieldByName('DATA_ADMISSAO').AsString;
        cdsFichaMembroMODO_ADMISSAO.AsString             :=vCdsAux.FieldByName('MODO_ADMISSAO').AsString;
        cdsFichaMembroIGREJAS_FOI_MEMBRO.AsString        :=vCdsAux.FieldByName('IGREJAS_FOI_MEMBRO').AsString;
        cdsFichaMembroOFERTANTE.AsString                 :=vCdsAux.FieldByName('OFERTANTE').AsString;
        cdsFichaMembroDIZIMISTA.AsString                 :=vCdsAux.FieldByName('DIZIMISTA').AsString;
        cdsFichaMembroFUNCAO_EXERCEU_IGREJA.AsString     :=vCdsAux.FieldByName('FUNCAO_EXERCEU_IGREJA').AsString;
        cdsFichaMembroFUNCAO_GOSTARIA_EXERCER.AsString   :=vCdsAux.FieldByName('FUNCAO_GOSTARIA_EXERCER').AsString;
        cdsFichaMembroCPF.AsString                       :=vCdsAux.FieldByName('CPF').AsString;
        cdsFichaMembroRG.AsString                        :=vCdsAux.FieldByName('RG').AsString;
        cdsFichaMembroOBSERVACAO.AsString                :=vCdsAux.FieldByName('OBSERVACOES').AsString;


        cdsFichaMembro.Post;
        vCdsAux.Next;
      end;

      if TRelatorios.SetRelatorio(frxReport,'FichaMembro.fr3') then
      begin
        frxReport.ShowReport;
      end
      else
      begin
        Application.MessageBox('Relatório não encontrado!'+sLineBreak+'Entre em contato com o Suporte',
          'Informação!',mb_OK+MB_ICONINFORMATION);
      end;
    finally
      FreeAndNil(vCdsAux);
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

function Tfrm2Membro.SetFiltros: Boolean;
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
