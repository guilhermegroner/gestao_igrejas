unit ufrm4PatrimonioImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, JvExControls,
  JvGradientHeaderPanel, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.StdCtrls, cxPC, JvExExtCtrls,
  JvExtComponent, JvItemsPanel, Data.DB, Datasnap.DBClient, Vcl.DBCtrls,
  AdvGlowButton, frxClass, frxExportPDF, frxDBSet, Vcl.CheckLst;

const
  cSituacaoEmUso ='1';
  cSituacaoBaixado ='0';

type
 TAbasModelosRelatorio = (aNone, aRelacaoPatrimonioSetor, aListaFornecedores);

  Tfrm4PatrimonioImpressoes = class(Tfrm0Default)
    pnlFundo: TPanel;
    hdrTitulo: TJvGradientHeaderPanel;
    pnlLeftOpcoes: TPanel;
    pnlModelosRelatorio: TJvItemsPanel;
    pcModelosRelatorio: TcxPageControl;
    tsRelPatrimonioSetor: TcxTabSheet;
    tsListaFornecedores: TcxTabSheet;
    grpRelPatrimonioSetor: TGroupBox;
    grpListaFornecedores: TGroupBox;
    lblSetor: TLabel;
    lcbSetor: TDBLookupComboBox;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    btnImpPatPorSetor: TAdvGlowButton;
    pnlTitulo0: TJvGradientHeaderPanel;
    pnlTitulo1: TJvGradientHeaderPanel;
    frxReport: TfrxReport;
    cdsPatrimonioSetor: TClientDataSet;
    frxDBPatrimonioSetor: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    cdsPatrimonioSetorNUMERO_PATRIMONIO: TIntegerField;
    cdsPatrimonioSetorTIPO_AQUISICAO: TStringField;
    cdsPatrimonioSetorNOME: TStringField;
    cdsPatrimonioSetorSITUACAO: TStringField;
    cdsPatrimonioSetorESTADO: TStringField;
    cdsPatrimonioSetorID: TIntegerField;
    cdsPatrimonioSetorSETOR: TStringField;
    cdsPatrimonioSetorID_SETOR: TIntegerField;
    btnListDeFornecedores: TAdvGlowButton;
    cdsListFornecedores: TClientDataSet;
    frxDBListFornecedores: TfrxDBDataset;
    cdsListFornecedoresID: TIntegerField;
    cdsListFornecedoresNOME: TStringField;
    cdsListFornecedoresTELEFONE1: TStringField;
    btnLimparSetor: TAdvGlowButton;
    lblCategoria: TLabel;
    lcbCategoria: TDBLookupComboBox;
    cdsCategoria: TClientDataSet;
    dsCategoria: TDataSource;
    btnLimparCategoria: TAdvGlowButton;
    cdsPatrimonioSetorCATEGORIA: TStringField;
    grpRelacaoPatrimonio: TGroupBox;
    rgSituacoesPatrimonio: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
    procedure btnImpPatPorSetorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListDeFornecedoresClick(Sender: TObject);
    procedure btnLimparSetorClick(Sender: TObject);
    procedure btnLimparCategoriaClick(Sender: TObject);
  private
    procedure ExibeAba(pAba: TAbasModelosRelatorio);
    procedure OcultarGrupos;
    procedure ImprimirPatrimonioSetor;
    procedure ImprimirListagemFornecedores;
    procedure SetTamanhoTela;
    procedure SetSetor;
    procedure SetCategoria;
  public
    { Public declarations }
  end;

var
  frm4PatrimonioImpressoes: Tfrm4PatrimonioImpressoes;

implementation

uses
  uDataModule, uManipulacaoDados, uConsultasSql, uRelatorios, ufrm0Aguarde;

{$R *.dfm}

procedure Tfrm4PatrimonioImpressoes.btnImpPatPorSetorClick(Sender: TObject);
begin
  ImprimirPatrimonioSetor;
end;

procedure Tfrm4PatrimonioImpressoes.btnLimparCategoriaClick(Sender: TObject);
begin
  lcbCategoria.KeyValue :=null;
end;

procedure Tfrm4PatrimonioImpressoes.btnLimparSetorClick(Sender: TObject);
begin
  lcbSetor.KeyValue :=null;
end;

procedure Tfrm4PatrimonioImpressoes.btnListDeFornecedoresClick(Sender: TObject);
begin
  ImprimirListagemFornecedores;
end;

procedure Tfrm4PatrimonioImpressoes.ExibeAba(pAba: TAbasModelosRelatorio);
begin
  OcultarGrupos;
  case pAba of
    aRelacaoPatrimonioSetor:
     begin
       pcModelosRelatorio.ActivePage :=tsRelPatrimonioSetor;
       grpRelPatrimonioSetor.Visible :=True;
       SetSetor;
       SetCategoria;
     end;

   aListaFornecedores:
    begin
      pcModelosRelatorio.ActivePage :=tsListaFornecedores;
      grpListaFornecedores.Visible :=True;
    end;
  end;
end;

procedure Tfrm4PatrimonioImpressoes.FormCreate(Sender: TObject);
begin
  cdsPatrimonioSetor.CreateDataSet;
  cdsListFornecedores.CreateDataSet;
  SetTamanhoTela;
end;

procedure Tfrm4PatrimonioImpressoes.FormShow(Sender: TObject);
begin
  Self.Caption :='Geek Software';
  pcModelosRelatorio.Properties.HideTabs :=True;
end;

procedure Tfrm4PatrimonioImpressoes.ImprimirListagemFornecedores;
var
  vSqlBusca: string;
begin
  cdsListFornecedores.EmptyDataSet;

  vSqlBusca :='SELECT F.ID, F.NOME, COALESCE(F.TELEFONE1, ''Não Informado'') AS TELEFONE1'+
    ' FROM TBL_FORNECEDOR F';

  TManipulacaoDados.PopulaDataSet(cdsListFornecedores, vSqlBusca);
  TManipulacaoDados.OrdenaDataSet(cdsListFornecedores, 'NOME', oAscendente);
  if cdsListFornecedores.RecordCount=0 then
  begin
    Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
    Abort;
  end;

  if TRelatorios.SetRelatorio(frxReport,'Fornecedores.fr3') then
  begin
    frxReport.ShowReport;
  end
  else
  begin
    Application.MessageBox('Relatório não encontrado!'+sLineBreak+'Entre em contato com o Suporte',
      'Informação!',mb_OK+MB_ICONINFORMATION);
  end;
end;

procedure Tfrm4PatrimonioImpressoes.ImprimirPatrimonioSetor;
var
  vSqlBusca, vCondicaoSetor, vCondicaoCategoria, vCondicaoSituacao: string;
begin
  CriarTelaAguarde('Aguarde...Gerando relatório');
  vCondicaoSetor :=EmptyStr;
  vCondicaoCategoria :=EmptyStr;
  vCondicaoSituacao :=EmptyStr;

  if lcbSetor.KeyValue<>null then
  begin
    vCondicaoSetor :=' AND S.ID = '+VarToStr(lcbSetor.KeyValue);
  end;

  if lcbCategoria.KeyValue<>null then
  begin
    vCondicaoCategoria :=' AND C.ID = '+VarToStr(lcbCategoria.KeyValue);
  end;

  if rgSituacoesPatrimonio.ItemIndex >-1 then
  begin
    if rgSituacoesPatrimonio.ItemIndex=0 then
     vCondicaoSituacao :=' AND P.SITUACAO = '+cSituacaoEmUso
    else
     vCondicaoSituacao :=' AND P.SITUACAO = '+cSituacaoBaixado;
  end;

  cdsPatrimonioSetor.EmptyDataSet;

  vSqlBusca :='SELECT P.ID, P.NOME, C.NOME AS CATEGORIA, P.TIPO_AQUISICAO, P.ESTADO,'+
     ' CASE P.SITUACAO'+
      ' WHEN 0 THEN ''Baixado'''+
      ' WHEN 1 THEN ''Em Uso'''+
      ' WHEN 2 THEN ''Transferido'''+
     ' END AS SITUACAO, P.NUMERO_PATRIMONIO, S.NOME AS SETOR, P.ID_SETOR'+
    ' FROM TBL_PATRIMONIO P'+
     ' INNER JOIN TBL_SETOR S ON (S.ID = P.ID_SETOR)'+
     ' INNER JOIN TBL_CATEGORIA C ON (C.ID = P.ID_CATEGORIA)'+
      ' WHERE S.ID_UNIDADE = '+IntToStr(DM.IdUnidade)+vCondicaoSetor+vCondicaoCategoria+vCondicaoSituacao+
      ' ORDER BY  SETOR, P.NOME';

  FecharTelaAguarde;
  TManipulacaoDados.PopulaDataSet(cdsPatrimonioSetor, vSqlBusca);
  if cdsPatrimonioSetor.RecordCount=0 then
  begin
    Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
    Exit;
  end;

  if TRelatorios.SetRelatorio(frxReport,'Patrimonio.fr3') then
  begin
    frxReport.ShowReport;
  end
  else
  begin
    Application.MessageBox('Relatório não encontrado!'+sLineBreak+'Entre em contato com o Suporte',
      'Informação!',mb_OK+MB_ICONINFORMATION);
  end;
end;

procedure Tfrm4PatrimonioImpressoes.OcultarGrupos;
begin
  grpRelPatrimonioSetor.Visible :=False;
  grpListaFornecedores.Visible :=False;
end;

procedure Tfrm4PatrimonioImpressoes.pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
begin
  case ItemIndex of
    0: ExibeAba(aRelacaoPatrimonioSetor);
    1: ExibeAba(aListaFornecedores);
  end;
end;

procedure Tfrm4PatrimonioImpressoes.SetCategoria;
begin
  TManipulacaoDados.PopulaCds(cdsCategoria, lcbCategoria, oAscendente, 'NOME', 'ID', 'NOME', cSqlTodasCategorias);
end;

procedure Tfrm4PatrimonioImpressoes.SetSetor;
begin
  TManipulacaoDados.PopulaCds(cdsSetor, lcbSetor, oAscendente, 'NOME', 'ID', 'NOME',
   Format(cSqlTodosSetoresUnidade,[DM.IdUnidade]));
end;

procedure Tfrm4PatrimonioImpressoes.SetTamanhoTela;
begin
  Self.Width :=617;
  Self.Height :=405;
end;

end.
