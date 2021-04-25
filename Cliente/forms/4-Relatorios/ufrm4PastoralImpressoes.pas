unit ufrm4PastoralImpressoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.StdCtrls, cxPC,
  JvExExtCtrls, JvExtComponent, JvItemsPanel, JvExControls,
  JvGradientHeaderPanel, Vcl.ExtCtrls, AdvGlowButton, frxClass, frxExportPDF,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, frxDBSet, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.Mask, JvExMask, JvToolEdit,
  JvExStdCtrls, JvCombobox;

type
 TAbasModelosRelatorio = (aNone, aFichaMembro, aListagemMembros, aMembrosGrupo);

  Tfrm4PastoralImpressoes = class(Tfrm0Default)
    pnlFundo: TPanel;
    hdrTitulo: TJvGradientHeaderPanel;
    pnlLeftOpcoes: TPanel;
    pnlModelosRelatorio: TJvItemsPanel;
    pcModelosRelatorio: TcxPageControl;
    tsRelFichaMembro: TcxTabSheet;
    grpFichaMembro: TGroupBox;
    pnlTopFichaMembro: TJvGradientHeaderPanel;
    tsListagemMembros: TcxTabSheet;
    grpListagemMembros: TGroupBox;
    pnlToListagemMembros: TJvGradientHeaderPanel;
    btnFichaEmBranco: TAdvGlowButton;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    tsMembrosPorGrupo: TcxTabSheet;
    grpMembrosPorGrupo: TGroupBox;
    pnlTituloMembroGrupo: TJvGradientHeaderPanel;
    btnImpMembroGrupo: TAdvGlowButton;
    lcbMembroGrupo: TDBLookupComboBox;
    lblGrupo: TLabel;
    btnLimparGrupo: TAdvGlowButton;
    cdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    cdsMembrosGrupo: TClientDataSet;
    frxDBMembrosGrupo: TfrxDBDataset;
    cdsMembrosGrupoID_GRUPO: TIntegerField;
    cdsMembrosGrupoNOME_GRUPO: TStringField;
    cdsMembrosGrupoID_MEMBRO: TIntegerField;
    cdsMembrosGrupoNOME_MEMBRO: TStringField;
    cdsMembrosGrupoTELEFONE: TStringField;
    cdsMembrosGrupoCELULAR: TStringField;
    grpSituacaoMembros: TGroupBox;
    rgSituacoesMembros: TRadioGroup;
    btnImpListagemMembros: TAdvGlowButton;
    GroupBox1: TGroupBox;
    cbbTiposAniversario: TJvComboBox;
    lblAniversarioDe: TLabel;
    edtDataInicial: TJvDateEdit;
    lbl6: TLabel;
    edtDataFinal: TJvDateEdit;
    lbl7: TLabel;
    GroupBox2: TGroupBox;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    lblFaixaEtaria: TLabel;
    lblA: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
    procedure btnLimparGrupoClick(Sender: TObject);
    procedure btnImpMembroGrupoClick(Sender: TObject);
    procedure btnFichaEmBrancoClick(Sender: TObject);
  private
    procedure SetTamanhoTela;
    procedure ExibeAba(pAba: TAbasModelosRelatorio);
    procedure OcultarGrupos;
    procedure ImprimeFichaEmBranco;
    procedure SetGrupo;
    procedure ImprimiRelacaoMembrosGrupo;
  public
    { Public declarations }
  end;

var
  frm4PastoralImpressoes: Tfrm4PastoralImpressoes;

implementation

uses
  uManipulacaoDados, uRelatorios, ufrm0Aguarde, uDataModule, uConsultasSql;

{$R *.dfm}

procedure Tfrm4PastoralImpressoes.btnFichaEmBrancoClick(Sender: TObject);
begin
  ImprimeFichaEmBranco;
end;

procedure Tfrm4PastoralImpressoes.btnImpMembroGrupoClick(Sender: TObject);
begin
  ImprimiRelacaoMembrosGrupo;
end;

procedure Tfrm4PastoralImpressoes.btnLimparGrupoClick(Sender: TObject);
begin
  lcbMembroGrupo.KeyValue :=null;
end;

procedure Tfrm4PastoralImpressoes.ExibeAba(pAba: TAbasModelosRelatorio);
begin
  OcultarGrupos;
  case pAba of
    aFichaMembro:
     begin
       pcModelosRelatorio.ActivePage :=tsRelFichaMembro;
       grpFichaMembro.Visible :=True;
     end;

   aListagemMembros:
    begin
      //pcModelosRelatorio.ActivePage :=tsListagemMembros;
      //grpListagemMembros.Visible :=True;
    end;

   aMembrosGrupo:
    begin
      pcModelosRelatorio.ActivePage :=tsMembrosPorGrupo;
      grpMembrosPorGrupo.Visible :=True;
      SetGrupo;
    end;
  end;
end;

procedure Tfrm4PastoralImpressoes.FormCreate(Sender: TObject);
begin
  cdsMembrosGrupo.CreateDataSet;
  SetTamanhoTela;
end;

procedure Tfrm4PastoralImpressoes.FormShow(Sender: TObject);
begin
  Self.Caption :='Geek Software';
  pcModelosRelatorio.Properties.HideTabs :=True;
end;

procedure Tfrm4PastoralImpressoes.ImprimeFichaEmBranco;
begin
  CriarTelaAguarde('Aguarde...Gerando ficha');
  try
    try
      if TRelatorios.SetRelatorio(frxReport,'FichaMembroBranco.fr3') then
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

procedure Tfrm4PastoralImpressoes.ImprimiRelacaoMembrosGrupo;
var
  vCdsAux: TClientDataSet;
  vSql, vCondicaoGrupo: string;
begin
  CriarTelaAguarde('Aguarde...Gerando Relatório');
  cdsMembrosGrupo.EmptyDataSet;
  vCdsAux :=TClientDataSet.Create(nil);

  vCondicaoGrupo :=EmptyStr;

  if lcbMembroGrupo.KeyValue<>null then
  begin
    vCondicaoGrupo :=' AND GM.ID_GRUPO = '+VarToStr(lcbMembroGrupo.KeyValue);
  end;

  try
    try
      vSql :='SELECT GM.ID_GRUPO, G.NOME AS NOME_GRUPO, GM.ID_MEMBRO, M.NOME AS NOME_MEMBRO, M.TELEFONE, M.CELULAR'+
        ' FROM TBL_PAST_GRUPO_MEMBRO GM'+
        ' INNER JOIN TBL_PAST_GRUPO G ON (G.ID = GM.ID_GRUPO)'+
        ' INNER JOIN TBL_PAST_MEMBRO M ON (M.ID = GM.ID_MEMBRO)'+
        '  WHERE G.ID_UNIDADE = '+IntToStr(DM.IdUnidade)+vCondicaoGrupo;

      vCdsAux.Data :=TManipulacaoDados.GetDataDataSet(vSql);

      if vCdsAux.RecordCount=0 then
      begin
        Application.MessageBox('Nenhum registro encontrado!', 'Informação!',mb_OK+MB_ICONINFORMATION);
        Exit;
      end;

      vCdsAux.First;
      while not vCdsAux.Eof do
      begin
        cdsMembrosGrupo.Append;

        cdsMembrosGrupoID_GRUPO.AsInteger    :=vCdsAux.FieldByName('ID_GRUPO').AsInteger;
        cdsMembrosGrupoNOME_GRUPO.AsString   :=vCdsAux.FieldByName('NOME_GRUPO').AsString;
        cdsMembrosGrupoID_MEMBRO.AsInteger   :=vCdsAux.FieldByName('ID_MEMBRO').AsInteger;
        cdsMembrosGrupoNOME_MEMBRO.AsString  :=vCdsAux.FieldByName('NOME_MEMBRO').AsString;
        cdsMembrosGrupoTELEFONE.AsString     :=vCdsAux.FieldByName('TELEFONE').AsString;
        cdsMembrosGrupoCELULAR.AsString      :=vCdsAux.FieldByName('CELULAR').AsString;

        cdsMembrosGrupo.Post;
        vCdsAux.Next;
      end;

      if TRelatorios.SetRelatorio(frxReport,'MembrosGrupo.fr3') then
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

procedure Tfrm4PastoralImpressoes.OcultarGrupos;
begin
  grpFichaMembro.Visible :=False;
  grpListagemMembros.Visible :=False;
end;

procedure Tfrm4PastoralImpressoes.pnlModelosRelatorioItemClick(Sender: TObject; ItemIndex: Integer);
begin
  case ItemIndex of
    0: ExibeAba(aFichaMembro);
    1: ExibeAba(aListagemMembros);
    2: ExibeAba(aMembrosGrupo);
  end;
end;

procedure Tfrm4PastoralImpressoes.SetGrupo;
begin
  TManipulacaoDados.PopulaCds(cdsGrupo, lcbMembroGrupo, oAscendente, 'NOME', 'ID', 'NOME',
   Format(cSqlTodosGruposPastoral,[DM.IdUnidade]));
end;

procedure Tfrm4PastoralImpressoes.SetTamanhoTela;
begin
  Self.Width :=617;
  Self.Height :=405;
end;

end.
