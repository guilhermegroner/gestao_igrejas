unit ufrm4Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, AdvGlowButton,
  Vcl.DBCtrls, Vcl.StdCtrls, cxPC, JvExExtCtrls, JvExtComponent, JvItemsPanel,
  JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls, frxClass, frxDBSet,
  frxExportPDF, Data.DB, Datasnap.DBClient;

type
 TAbasModelosRelatorio = (aNone, aEstoque, aEntradasPeriodo, aSaidasPeriodo);
  Tfrm4Estoque = class(Tfrm0Default)
    pnlFundo: TPanel;
    hdrTitulo: TJvGradientHeaderPanel;
    pnlLeftOpcoes: TPanel;
    pnlModelosRelatorio: TJvItemsPanel;
    pcModelosRelatorio: TcxPageControl;
    tsEstoque: TcxTabSheet;
    grpEstoque: TGroupBox;
    lblGrupo: TLabel;
    lcbGrupo: TDBLookupComboBox;
    btnImpPatPorSetor: TAdvGlowButton;
    pnlEstoque: TJvGradientHeaderPanel;
    btnLimparGrupo: TAdvGlowButton;
    cdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    cdsEstoque: TClientDataSet;
    frxDBEstoque: TfrxDBDataset;
    cdsEstoqueID_PRODUTO: TIntegerField;
    cdsEstoqueNOME_PRODUTO: TStringField;
    cdsEstoqueID_GRUPO: TIntegerField;
    cdsEstoqueNOME_GRUPO: TStringField;
    cdsEstoqueUNIDADE: TStringField;
    cdsEstoqueQUANTIDADE_ATUAL: TIntegerField;
    tsSaidasPeriodo: TcxTabSheet;
    grpSaidasPeriodo: TGroupBox;
    btnImprimirSaidasPeriodo: TAdvGlowButton;
    JvGradientHeaderPanel1: TJvGradientHeaderPanel;
    frxDBSaidasPeriodo: TfrxDBDataset;
    cdsSaidasPeriodo: TClientDataSet;
    cdsSaidasPeriodoITEM: TStringField;
    cdsSaidasPeriodoDATA_SAIDA: TDateField;
    cdsSaidasPeriodoQUANTIDADE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
    procedure btnLimparGrupoClick(Sender: TObject);
    procedure btnImpPatPorSetorClick(Sender: TObject);
    procedure btnImprimirSaidasPeriodoClick(Sender: TObject);
  private
    procedure ExibeAba(pAba: TAbasModelosRelatorio);
    procedure OcultarGrupos;
    procedure SetTamanhoTela;
    procedure ImprimeEstoque;
    procedure SetGrupo;
    procedure ImprimiSaidasPeriodo;
  public
    { Public declarations }
  end;

var
  frm4Estoque: Tfrm4Estoque;

implementation

uses
  ufrm0Aguarde, uManipulacaoDados, uDataModule, uRelatorios, uConsultasSql;

{$R *.dfm}

{ Tfrm4Estoque }

procedure Tfrm4Estoque.btnImpPatPorSetorClick(Sender: TObject);
begin
  ImprimeEstoque;
end;

procedure Tfrm4Estoque.btnImprimirSaidasPeriodoClick(Sender: TObject);
begin
  ImprimiSaidasPeriodo;
end;

procedure Tfrm4Estoque.btnLimparGrupoClick(Sender: TObject);
begin
  lcbGrupo.KeyValue :=Null;
end;

procedure Tfrm4Estoque.ExibeAba(pAba: TAbasModelosRelatorio);
begin
  OcultarGrupos;
  case pAba of
    aEstoque:
     begin
       pcModelosRelatorio.ActivePage :=tsEstoque;
       grpEstoque.Visible :=True;
       SetGrupo;
     end;
    aEntradasPeriodo:
     begin
       ShowMessage('Relatório em Desenvolvimento');
     end;
    aSaidasPeriodo:
     begin
       pcModelosRelatorio.ActivePage :=tsSaidasPeriodo;
       grpSaidasPeriodo.Visible :=True;
     end;
  end;
end;

procedure Tfrm4Estoque.FormCreate(Sender: TObject);
begin
  cdsEstoque.CreateDataSet;
  cdsSaidasPeriodo.CreateDataSet;
  SetTamanhoTela;
end;

procedure Tfrm4Estoque.FormShow(Sender: TObject);
begin
  Self.Caption :='Geek Software';
  pcModelosRelatorio.Properties.HideTabs :=True;
end;

procedure Tfrm4Estoque.ImprimeEstoque;
var
  vCdsAux: TClientDataSet;
  vSql, vCondicaoGrupo: string;
begin
  CriarTelaAguarde('Aguarde...Gerando Relatório');
  cdsEstoque.EmptyDataSet;
  vCdsAux :=TClientDataSet.Create(nil);

  vCondicaoGrupo :=EmptyStr;

  if lcbGrupo.KeyValue<>null then
  begin
    vCondicaoGrupo :=' AND G.ID = '+VarToStr(lcbGrupo.KeyValue);
  end;

  try
    try
      vSql :='SELECT P.ID AS ID_PRODUTO, P.NOME AS NOME_PRODUTO, G.ID AS ID_GRUPO, G.NOME AS NOME_GRUPO,'+
           ' U.NOME AS UNIDADE, E.QUANTIDADE_ATUAL  FROM TBL_EST_ESTOQUE E'+
          ' INNER JOIN TBL_EST_PRODUTO P ON(P.ID = E.ID_PRODUTO)'+
          ' INNER JOIN TBL_EST_UNIDADE_MEDIDA U ON(U.ID = P.ID_UNIDADE_MEDIDA)'+
          ' INNER JOIN TBL_EST_GRUPO G ON(G.ID = P.ID_GRUPO)'+
          ' WHERE P.ID_UNIDADE = '+IntToStr(DM.IdUnidade)+vCondicaoGrupo+
          ' GROUP BY G.NOME, P.NOME, P.ID, G.ID, U.NOME, E.QUANTIDADE_ATUAL';

      vCdsAux.Data :=TManipulacaoDados.GetDataDataSet(vSql);

      if vCdsAux.RecordCount=0 then
      begin
        Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
        Exit;
      end;

      vCdsAux.First;
      while not vCdsAux.Eof do
      begin
        cdsEstoque.Append;

        cdsEstoqueID_PRODUTO.AsInteger       :=vCdsAux.FieldByName('ID_PRODUTO').AsInteger;
        cdsEstoqueNOME_PRODUTO.AsString      :=vCdsAux.FieldByName('NOME_PRODUTO').AsString;
        cdsEstoqueID_GRUPO.AsInteger         :=vCdsAux.FieldByName('ID_GRUPO').AsInteger;
        cdsEstoqueNOME_GRUPO.AsString        :=vCdsAux.FieldByName('NOME_GRUPO').AsString;
        cdsEstoqueUNIDADE.AsString           :=vCdsAux.FieldByName('UNIDADE').AsString;
        cdsEstoqueQUANTIDADE_ATUAL.AsInteger :=vCdsAux.FieldByName('QUANTIDADE_ATUAL').AsInteger;

        cdsEstoque.Post;
        vCdsAux.Next;
      end;

      if TRelatorios.SetRelatorio(frxReport,'Estoque.fr3') then
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

procedure Tfrm4Estoque.ImprimiSaidasPeriodo;
var
  vCdsAux: TClientDataSet;
  vSql: string;
begin
  CriarTelaAguarde('Aguarde...Gerando Relatório');
  cdsSaidasPeriodo.EmptyDataSet;
  vCdsAux :=TClientDataSet.Create(nil);

  try
    try
      vSql :='SELECT P.NOME AS ITEM, S.DATA_SAIDA, ITS.QUANTIDADE FROM TBL_EST_ITENS_SAIDA ITS'+
               ' INNER JOIN TBL_EST_SAIDA S ON (S.ID = ITS.ID_SAIDA)'+
               ' INNER JOIN TBL_EST_PRODUTO P ON (P.ID = ITS.ID_PRODUTO)'+
               ' WHERE S.ID_UNIDADE = '+IntToStr(DM.IdUnidade);

      vCdsAux.Data :=TManipulacaoDados.GetDataDataSet(vSql);

      if vCdsAux.RecordCount=0 then
      begin
        Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
        Exit;
      end;

      vCdsAux.First;
      while not vCdsAux.Eof do
      begin
        cdsSaidasPeriodo.Append;

        cdsSaidasPeriodoITEM.AsString         :=vCdsAux.FieldByName('ITEM').AsString;
        cdsSaidasPeriodoDATA_SAIDA.AsDateTime :=vCdsAux.FieldByName('DATA_SAIDA').AsDateTime;
        cdsSaidasPeriodoQUANTIDADE.AsInteger  :=vCdsAux.FieldByName('QUANTIDADE').AsInteger;

        cdsSaidasPeriodo.Post;
        vCdsAux.Next;
      end;

      if TRelatorios.SetRelatorio(frxReport,'Estoque-Saidas-Periodo.fr3') then
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
procedure Tfrm4Estoque.OcultarGrupos;
begin
  grpEstoque.Visible :=False;
  grpSaidasPeriodo.Visible :=False;
end;

procedure Tfrm4Estoque.pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
begin
  case ItemIndex of
    0: ExibeAba(aEstoque);
    1: ExibeAba(aEntradasPeriodo);
    2: ExibeAba(aSaidasPeriodo);
  end;
end;

procedure Tfrm4Estoque.SetGrupo;
begin
  TManipulacaoDados.PopulaCds(cdsGrupo, lcbGrupo, oAscendente, 'NOME', 'ID', 'NOME',
   Format(cSqlTodosGruposEstoque,[DM.IdUnidade]));
end;

procedure Tfrm4Estoque.SetTamanhoTela;
begin
  Self.Width :=617;
  Self.Height :=405;
end;

end.
