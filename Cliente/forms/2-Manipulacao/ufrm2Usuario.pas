unit ufrm2Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm2Manipulacao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxClasses, Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls,
  cxContainer, Vcl.Menus, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, cxButtons,
  cxLabel, JvPageList, cxGroupBox;

const
  cSuporte ='suporte';

  SqlIncluirUsuario = 'SELECT * FROM TBL_USUARIO WHERE ID = -1';

  SqlBuscaUsuarios = 'SELECT ID, NOME, USUARIO,'+
    ' CASE SITUACAO'+
      ' WHEN 0 THEN ''Inativo'''+
      ' WHEN 1 THEN ''Ativo'''+
      ' WHEN 2 THEN ''Bloqueado'''+
    ' END AS SITUACAO'+
    ' FROM TBL_USUARIO';

  SqlAlterarUsuario = 'SELECT * FROM TBL_USUARIO WHERE ID = %d';

type
  Tfrm2Usuario = class(Tfrm2Manipulacao)
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsUSUARIO: TStringField;
    cxGrid_ID: TcxGridDBColumn;
    cxGrid_Nome: TcxGridDBColumn;
    cxGrid_Usuario: TcxGridDBColumn;
    gbFiltro: TcxGroupBox;
    pbBasico: TJvPageList;
    PagFiltro: TJvStandardPage;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cbbCondicao: TJvComboBox;
    edtFiltro: TEdit;
    cbbCampoPesquisa: TJvComboBox;
    btnLocalizar: TAdvGlowButton;
    btnAlterarSenha: TAdvGlowButton;
    actAlterarSenha: TAction;
    cdsSITUACAO: TStringField;
    cxGrid_Situacao: TcxGridDBColumn;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure cxGridTV1DblClick(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actAlterarSenhaExecute(Sender: TObject);
    procedure edtFiltroExit(Sender: TObject);
  private
    procedure GetUsuarios;
    function SetFiltros: Boolean;
  public
    { Public declarations }
  end;

var
  frm2Usuario: Tfrm2Usuario;
  vFiltros: string;

implementation

uses
  ufrm1Usuario, uManipulacaoDados, ufrm0TrocarSenha, uFiltros, ufrm0Aguarde, uDataModule;

{$R *.dfm}

procedure Tfrm2Usuario.actAlterarSenhaExecute(Sender: TObject);
var
  loForm: Tfrm0TrocarSenha;
begin
  if cds.RecordCount=0 then
   Exit;

  if (cdsUSUARIO.AsString=cSuporte) and (DM.Usuario<>cSuporte) then
   Exit;

  loForm :=Tfrm0TrocarSenha.Create(nil);
  try
    loForm.edtSenhaAtual.Enabled :=False;
    loForm.cNomeUsuarioTrocarSenha :=cdsNOME.AsString;
    loForm.cIdUsuarioTrocarSenha :=cdsID.AsInteger;

    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Usuario.actEditarExecute(Sender: TObject);
var
  loForm: Tfrm1Usuario;
begin
  if cds.RecordCount=0 then
   Exit;

  if (cdsUSUARIO.AsString=cSuporte) and (DM.Usuario<>cSuporte) then
   Exit;

  loForm :=Tfrm1Usuario.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, Format(SqlAlterarUsuario,[cdsID.AsInteger]));

    loForm.CDS.Edit;
    loForm.ShowModal;
    GetUsuarios;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Usuario.actIncluirExecute(Sender: TObject);
var
  loForm: Tfrm1Usuario;
begin
  loForm :=Tfrm1Usuario.Create(nil);
  try
    TManipulacaoDados.Consulta(loForm.CDS, SqlIncluirUsuario);

    loForm.CDS.Insert;
    loForm.ShowModal;
    GetUsuarios;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Tfrm2Usuario.actLocalizarExecute(Sender: TObject);
begin
  CriarTelaAguarde('Aguarde...Buscando Usuários');
  try
    GetUsuarios;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm2Usuario.cxGridTV1DblClick(Sender: TObject);
begin
  actEditarExecute(Sender);
end;

procedure Tfrm2Usuario.edtFiltroExit(Sender: TObject);
begin
  if btnLocalizar.CanFocus then
   btnLocalizar.SetFocus;
end;

procedure Tfrm2Usuario.FormCreate(Sender: TObject);
begin
  cds.CreateDataSet;
end;

procedure Tfrm2Usuario.GetUsuarios;
begin
  SetFiltros;

  cds.DisableControls;
  cxGrid.BeginUpdate();
  try
    cds.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cds, SqlBuscaUsuarios +vFiltros);

    TManipulacaoDados.OrdenaDataSet(cds, 'NOME', oAscendente);
    cds.Open;
  finally
    cds.EnableControls;
    cxGrid.EndUpdate;
  end;
end;

function Tfrm2Usuario.SetFiltros: Boolean;
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
         vFiltros :=' WHERE ID = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' WHERE ID STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

      fNome:
      begin
        if cbbCondicao.ItemIndex=fIgualA then
         vFiltros :=' WHERE USUARIO = '+QuotedStr(edtFiltro.Text)
        else
         vFiltros :=' WHERE USUARIO STARTING WITH '+QuotedStr(edtFiltro.Text);
      end;

    end;
  end;
end;

end.
