unit ufrm0TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBar, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, dxBarApplicationMenu,
  Vcl.ExtCtrls, dxStatusBar, dxRibbonSkins,
  dxRibbon, cxClasses, dxBarBuiltInMenu, cxPC, IWSystem,
  dxRibbonCustomizationForm, cxContainer, cxEdit, dxGDIPlusClasses, cxImage, cxImageList;

const
  cUsuarioSuporte ='suporte';

type
  Tfrm0TelaPrincipal = class(TForm)
    rbbMenuPrincipal: TdxRibbon;
    Manager: TdxBarManager;
    ApplicationMenu: TdxBarApplicationMenu;
    AcoesMenu: TActionList;
    tbMovPatrimonio: TdxBar;
    tbCadPatrimonio: TdxBar;
    mbConfSeg: TdxBar;
    rbbMenuPatrimonio: TdxRibbonTab;
    rbbMenuConfiguracoes: TdxRibbonTab;
    sttbPaginaPrincipal: TdxStatusBar;
    tbRelPatrimonio: TdxBar;
    ImageListMenu: TcxImageList;
    ActCadSetor: TAction;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActCadRespSetor: TAction;
    ActCadCategoria: TAction;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActCadFornecedor: TAction;
    ActCadPatrimonio: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ActTransfPatrimonio: TAction;
    dxBarLargeButton6: TdxBarLargeButton;
    btnConfigCadUsuarios: TdxBarLargeButton;
    ActCadUsuario: TAction;
    mbConfigAjuda: TdxBar;
    btnConfigTeamViewer: TdxBarLargeButton;
    ActAbreTeamViewer: TAction;
    mbConfigOpcoes: TdxBar;
    btnConfigTrocarUnidade: TdxBarLargeButton;
    ActTrocarUnidade: TAction;
    pcAbas: TcxPageControl;
    tsPrincipal: TcxTabSheet;
    imgFundo: TcxImage;
    btnConfigLogSistema: TdxBarLargeButton;
    ActLog: TAction;
    btnImpressoes: TdxBarLargeButton;
    ActPatrimonioImpressoes: TAction;
    btnConfigSobre: TdxBarLargeButton;
    ActSobre: TAction;
    rbbMenuPastoral: TdxRibbonTab;
    rbbMenuEstoque: TdxRibbonTab;
    tbCadContPastoral: TdxBar;
    tbImpressoesPastoral: TdxBar;
    btnCadMembros: TdxBarLargeButton;
    actActCadMembro: TAction;
    mbAcoesSuporte: TdxBar;
    btnCadUnidade: TdxBarLargeButton;
    ActCadUnidade: TAction;
    ActPastoralImpressoes: TAction;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    btnBaixaDePatrimonio: TdxBarLargeButton;
    ActBaixaDePatrimonio: TAction;
    ActConfigLogoff: TAction;
    btnConfigLogoff: TdxBarLargeButton;
    btnTrocarSenha: TdxBarLargeButton;
    actActTrocarSenha: TAction;
    actActCadGrupo: TAction;
    ActCadPastor: TAction;
    ActCadIgreja: TAction;
    tbCadEstoque: TdxBar;
    tbMovEstoque: TdxBar;
    tbImpressoesEstoque: TdxBar;
    btnCadUnidadeEstoque: TdxBarLargeButton;
    btnCadGrupoEstoque: TdxBarLargeButton;
    btnCadProdutoEstoque: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    actCadUnidadeEstoque: TAction;
    actCadGrupoEstoque: TAction;
    actCadProdutoEstoque: TAction;
    actMovEntradaEstoque: TAction;
    actMovSaidaEstoque: TAction;
    actEstoqueImpressoes: TAction;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActCadSetorExecute(Sender: TObject);
    procedure ActCadRespSetorExecute(Sender: TObject);
    procedure ActCadCategoriaExecute(Sender: TObject);
    procedure ActCadFornecedorExecute(Sender: TObject);
    procedure ActCadPatrimonioExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActTransfPatrimonioExecute(Sender: TObject);
    procedure ActCadUsuarioExecute(Sender: TObject);
    procedure ActAbreTeamViewerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActTrocarUnidadeExecute(Sender: TObject);
    procedure ActLogExecute(Sender: TObject);
    procedure ActPatrimonioImpressoesExecute(Sender: TObject);
    procedure actActCadMembroExecute(Sender: TObject);
    procedure ActSobreExecute(Sender: TObject);
    procedure ActCadUnidadeExecute(Sender: TObject);
    procedure ActPastoralImpressoesExecute(Sender: TObject);
    procedure ActBaixaDePatrimonioExecute(Sender: TObject);
    procedure ActConfigLogoffExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actActTrocarSenhaExecute(Sender: TObject);
    procedure actActCadGrupoExecute(Sender: TObject);
    procedure ActCadPastorExecute(Sender: TObject);
    procedure ActCadIgrejaExecute(Sender: TObject);
    procedure actCadGrupoEstoqueExecute(Sender: TObject);
    procedure actCadProdutoEstoqueExecute(Sender: TObject);
    procedure actMovEntradaEstoqueExecute(Sender: TObject);
    procedure actMovSaidaEstoqueExecute(Sender: TObject);
    procedure actEstoqueImpressoesExecute(Sender: TObject);
    procedure actCadUnidadeEstoqueExecute(Sender: TObject);
  private
    function RealizarLogin: Boolean;
    function EscolherUnidade: Boolean;
    function ExisteAppAcessoRemoto: Boolean;
    procedure OcultaMenuSuporte;
    procedure SetDadosUnidade;
    procedure FecharAbasAbertas;
    function ShowFormDefault(pConsulta: string; pIndexOrdem:Integer;
               pClasseTela: TFormClass; pTela: TForm; pPagina: TcxPageControl;
               pTabela, pChaveTabela, pCampoChave, pCaptionForm, pTextoLog, pCaptionPainel: string): string;
  public
    { Public declarations }
  end;

var
  frm0TelaPrincipal: Tfrm0TelaPrincipal;

implementation

uses
  ufrm0Login, uMDIFrm, ufrm2Categoria, ufrm2Grupo, ufrm2Setor, ufrm2Patrimonio, ufrm2Fornecedor,
  ufrm2Usuario, ufrm0EscolherUnidade, uDataModule, uSegurancaControle, ufrm3Log, ufrm4PatrimonioImpressoes,
  ufrm2Membro, ufrm0Sobre, ufrm2Unidade, uManipulacaoDados, ufrm0TrocarSenha, ufrm2BaixaPatrimonio,
  ufrm2TransferenciaPatrimonio, ufrm2Pastor, ufrm4PastoralImpressoes, uConsultasSql, ufrm0Consulta,
  ufrm1UnidadeMedida, ufrm1GrupoEstoque, ufrm1ProdutoEstoque, ufrm2EntradaEstoque, ufrm2SaidaEstoque, ufrm4Estoque, ufrm1Responsavel, ufrm1Igreja;

{$R *.dfm}

procedure Tfrm0TelaPrincipal.ActAbreTeamViewerExecute(Sender: TObject);
var
  vComando: Ansistring;
begin
  if ExisteAppAcessoRemoto then
  begin
    vComando := '"'+gsAppPath+'TeamViewerQS.exe'+'"';
    WinExec(PAnsiChar(vComando),SW_SHOW);
  end;
end;

procedure Tfrm0TelaPrincipal.actActTrocarSenhaExecute(Sender: TObject);
var
  loForm: Tfrm0TrocarSenha;
begin
  loForm :=Tfrm0TrocarSenha.Create(nil);
  try
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm0TelaPrincipal.ActBaixaDePatrimonioExecute(Sender: TObject);
var
  loForm: Tfrm2BaixaPatrimonio;
begin
  loForm :=Tfrm2BaixaPatrimonio.Create(nil);
  try
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm0TelaPrincipal.ActCadCategoriaExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Categoria,frm2Categoria);
end;

procedure Tfrm0TelaPrincipal.ActCadFornecedorExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Fornecedor,frm2Fornecedor);
end;

procedure Tfrm0TelaPrincipal.actCadGrupoEstoqueExecute(Sender: TObject);
begin
  ShowFormDefault(Format(cSqlTodosGruposEstoque,[DM.IdUnidade]), 1, Tfrm1GrupoEstoque, frm1GrupoEstoque, pcAbas,
   'TBL_EST_GRUPO', 'ID', 'ID', 'Grupos do Estoque', 'Cadastro de Grupo do Estoque', 'Grupos Cadastrados');
end;

procedure Tfrm0TelaPrincipal.ActCadIgrejaExecute(Sender: TObject);
begin
  ShowFormDefault(cSqlTodasIgrejas, 1, Tfrm1Igreja, frm1Igreja,
   pcAbas, 'TBL_PAST_IGREJA', 'ID', 'ID', 'Igrejas', 'Cadastro de Igreja', 'Igrejas Cadastradas');
end;

procedure Tfrm0TelaPrincipal.actActCadGrupoExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Grupo,frm2Grupo);
end;

procedure Tfrm0TelaPrincipal.actActCadMembroExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Membro,frm2Membro);
end;

procedure Tfrm0TelaPrincipal.ActCadPastorExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Pastor,frm2Pastor);
end;

procedure Tfrm0TelaPrincipal.ActCadPatrimonioExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Patrimonio,frm2Patrimonio);
end;

procedure Tfrm0TelaPrincipal.actCadProdutoEstoqueExecute(Sender: TObject);
begin
  ShowFormDefault(Format(cSqlTodosProdutosEstoque,[DM.IdUnidade]), 1, Tfrm1ProdutoEstoque, frm1ProdutoEstoque,
   pcAbas, 'TBL_EST_PRODUTO', 'ID', 'ID', 'Produtos do Estoque', 'Cadastro de Produto', 'Produtos Cadastradas');
end;

procedure Tfrm0TelaPrincipal.ActCadRespSetorExecute(Sender: TObject);
begin
  ShowFormDefault(Format(cSqlTodosResponsaveisUnidade,[DM.IdUnidade]), 1, Tfrm1Responsavel, frm1Responsavel, pcAbas,
    'TBL_RESPONSAVEL', 'ID', 'ID', 'Responsáveis', 'Cadastro de Responsável', 'Responsáveis Cadastrados');
end;

procedure Tfrm0TelaPrincipal.ActCadSetorExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Setor,frm2Setor);
end;

procedure Tfrm0TelaPrincipal.actCadUnidadeEstoqueExecute(Sender: TObject);
begin
  ShowFormDefault(cSqlTodasUnidadesMedida, 1, Tfrm1UnidadeMedida, frm1UnidadeMedida, pcAbas, 'TBL_EST_UNIDADE_MEDIDA',
   'ID', 'ID', 'Unidades de Medida', 'Cadastro de Unidades de Medida', 'Unidades de Medida Cadastradas');
end;

procedure Tfrm0TelaPrincipal.ActCadUnidadeExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Unidade,frm2Unidade);
end;

procedure Tfrm0TelaPrincipal.ActCadUsuarioExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2Usuario,frm2Usuario);
end;

procedure Tfrm0TelaPrincipal.ActConfigLogoffExecute(Sender: TObject);
begin
  TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Logoff efetuado! | Usuário: '+DM.Usuario);
  FecharAbasAbertas;
  Self.FormCreate(Sender);
end;

procedure Tfrm0TelaPrincipal.actEstoqueImpressoesExecute(Sender: TObject);
var
  loform: Tfrm4Estoque;
begin
  loform :=Tfrm4Estoque.Create(nil);
  try
    loform.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;

procedure Tfrm0TelaPrincipal.ActPastoralImpressoesExecute(Sender: TObject);
var
  loform: Tfrm4PastoralImpressoes;
begin
  loform :=Tfrm4PastoralImpressoes.Create(nil);
  try
    loform.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;

procedure Tfrm0TelaPrincipal.ActPatrimonioImpressoesExecute(Sender: TObject);
var
  loform: Tfrm4PatrimonioImpressoes;
begin
  loform :=Tfrm4PatrimonioImpressoes.Create(nil);
  try
    loform.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;

procedure Tfrm0TelaPrincipal.ActLogExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm3Log,frm3Log);
end;

procedure Tfrm0TelaPrincipal.actMovEntradaEstoqueExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2EntradaEstoque,frm2EntradaEstoque);
end;

procedure Tfrm0TelaPrincipal.actMovSaidaEstoqueExecute(Sender: TObject);
begin
  TMDIFrmUtil.ShowMDIChild(pcAbas,Tfrm2SaidaEstoque,frm2SaidaEstoque);
end;

procedure Tfrm0TelaPrincipal.ActSobreExecute(Sender: TObject);
var
  loForm: Tfrm0Sobre;
begin
  loForm :=Tfrm0Sobre.Create(nil);
  try
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm0TelaPrincipal.ActTransfPatrimonioExecute(Sender: TObject);
var
  loForm: Tfrm2TransferenciaPatrimonio;
begin
  loForm :=Tfrm2TransferenciaPatrimonio.Create(nil);
  try
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm0TelaPrincipal.ActTrocarUnidadeExecute(Sender: TObject);
begin
  if EscolherUnidade then
  begin
    Self.FormShow(Sender);
    FecharAbasAbertas;
  end;
end;

function Tfrm0TelaPrincipal.EscolherUnidade: Boolean;
var
  loForm: Tfrm0EscolherUnidade;
begin
  Result := False;
  try
    loForm := Tfrm0EscolherUnidade.Create(nil);
    try
      loForm.ShowModal;
      Result :=loForm.ModalResult = mrOk;
      SetDadosUnidade;
    finally
      loForm.Free;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível logar no sistema!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  end;
end;

function Tfrm0TelaPrincipal.ExisteAppAcessoRemoto: Boolean;
begin
  Result :=FileExists(gsAppPath+'TeamViewerQS.exe');
end;

procedure Tfrm0TelaPrincipal.FecharAbasAbertas;
begin
  while pcAbas.PageCount>1do
  begin
    if pcAbas.ActivePage=tsPrincipal then //Fechar todas menos a principal
     pcAbas.ActivePageIndex :=pcAbas.ActivePageIndex+1;

     pcAbas.Pages[pcAbas.ActivePageIndex].Free;
  end;
end;

procedure Tfrm0TelaPrincipal.FormActivate(Sender: TObject);
begin
  SetDadosUnidade;
end;

procedure Tfrm0TelaPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja Sair do Sistema?','Pergunta',MB_YESNO+MB_ICONINFORMATION) = IDYES then
  begin
    CanClose :=True;
    Application.Terminate;
  end
  else
    CanClose :=False;
end;

procedure Tfrm0TelaPrincipal.FormCreate(Sender: TObject);
begin
  if not RealizarLogin then
  begin
    Application.ShowMainForm :=False;
    Application.Terminate;
    Exit;
  end;

  if not EscolherUnidade then
  begin
    Application.Terminate;
  end;

  TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Login efetuado! | Usuário: '+DM.Usuario);
end;

procedure Tfrm0TelaPrincipal.FormShow(Sender: TObject);
begin
  Self.Caption :='Geek Software - Gestão empresarial   |   Unidade: '+DM.Unidade;
  sttbPaginaPrincipal.Panels[1].Text :=DM.Usuario;
  sttbPaginaPrincipal.Panels[3].Text :=DM.Unidade;
  sttbPaginaPrincipal.Panels[5].Text :=DM.ConnDataSnap.Params.Values['HostName'];
  sttbPaginaPrincipal.Panels[7].Text :=DM.ConnDataSnap.Params.Values['Port'];

  rbbMenuPatrimonio.Active :=True;

  OcultaMenuSuporte;
end;

procedure Tfrm0TelaPrincipal.OcultaMenuSuporte;
begin
  if not DM.UsuarioAdministrador then
  begin
    mbAcoesSuporte.Visible :=False;
    btnConfigCadUsuarios.Visible :=ivNever;
  end
  else
  begin
    if DM.Usuario<>cUsuarioSuporte then
     mbAcoesSuporte.Visible :=False;

    btnConfigCadUsuarios.Visible :=ivAlways;
  end;
end;

function Tfrm0TelaPrincipal.RealizarLogin: Boolean;
var
  loForm: Tfrm0Login;
begin
  Result := False;
  try
    loForm := Tfrm0Login.Create(nil);
    try
      loForm.ShowModal;
      Result := loForm.ModalResult = mrOk;
    finally
      loForm.Free;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível efetuar login!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  end;
end;

procedure Tfrm0TelaPrincipal.SetDadosUnidade;
var
  vSqlDadosUnidade: string;
begin
  DM.cdsDadosUnidade.EmptyDataSet;
  vSqlDadosUnidade :='SELECT U.NOME, U.ENDERECO, U.ENDERECO_NUMERO, U.ENDERECO_BAIRRO,'+
     ' U.CNPJ, U.TELEFONE, U.CEP, C.NOME AS CIDADE, C.UF'+
    ' FROM TBL_UNIDADE U'+
    ' INNER JOIN TBL_CIDADE C ON (C.ID = U.ID_CIDADE)'+
    ' WHERE U.ID = '+IntToStr(DM.IdUnidade);

  TManipulacaoDados.PopulaDataSet(DM.cdsDadosUnidade, vSqlDadosUnidade);
end;

function Tfrm0TelaPrincipal.ShowFormDefault(pConsulta: string; pIndexOrdem: Integer; pClasseTela: TFormClass;
  pTela: TForm; pPagina: TcxPageControl; pTabela, pChaveTabela, pCampoChave, pCaptionForm, pTextoLog, pCaptionPainel: string): string;
var
  vTabPage: TcxTabSheet;
  vTelaConsulta: TForm;
begin
  if Application.MainForm <> nil then
  begin
    // Se encontrar a instancia, ou restaura a janela ou a manda para frente
    if TMDIFrmUtil.FormularioAberto(pPagina,pClasseTela) then
      Exit
    else
    begin // Caso nao encontre um form ja instanciado, cria uma nova instancia
      vTelaConsulta :=Tfrm0Consulta.Create(Application, pConsulta);

      vTabPage :=TcxTabSheet.Create(pPagina);
      vTabPage.Name :=pClasseTela.ClassName;

      Tfrm0Consulta(vTelaConsulta).BorderStyle :=bsNone;
      Tfrm0Consulta(vTelaConsulta).WindowState :=wsMaximized;
      Tfrm0Consulta(vTelaConsulta).Align       :=alClient;

      Tfrm0Consulta(vTelaConsulta).vTelaCadastro       :=pTela;
      Tfrm0Consulta(vTelaConsulta).vClasseTelaCadastro :=pClasseTela;

      Tfrm0Consulta(vTelaConsulta).vChave          :=pChaveTabela;
      Tfrm0Consulta(vTelaConsulta).vTabela         :=pTabela;
      Tfrm0Consulta(vTelaConsulta).vCampoChave     :=pCampoChave;
      Tfrm0Consulta(vTelaConsulta).vCaptionPanel   :=pCaptionPainel;
      Tfrm0Consulta(vTelaConsulta).vTextoLog       :=pTextoLog;
      Tfrm0Consulta(vTelaConsulta).vIndicedeOrdem  :=pIndexOrdem;
      Tfrm0Consulta(vTelaConsulta).vSqlConsulta    :=pConsulta;

      Tfrm0Consulta(vTelaConsulta).Visible :=False;
      vTabPage.PageControl :=pPagina;
      vTabPage.Caption :=pCaptionForm;
      Tfrm0Consulta(vTelaConsulta).Parent :=vTabPage;
      Tfrm0Consulta(vTelaConsulta).Visible :=True;
      pPagina.ActivePageIndex :=(pPagina.PageCount - 1);
    end;
  end;
end;

end.
