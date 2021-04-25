unit ufrm1Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, JvExControls,
  JvGradientHeaderPanel, AdvGlowButton, Vcl.ExtCtrls, JvExStdCtrls, JvCombobox,
  JvDBCombobox, CheckLst, uHelper, uManipulacaoDados, JvExCheckLst,
  JvCheckListBox, JvxCheckListBox, Vcl.DBCGrids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Menus;

const
  cAtivo =1;
  SqlBuscaUnidades = 'SELECT ID, NOME FROM TBL_UNIDADE WHERE ATIVO = 1';
  SqlBuscaUnidadesUsuario = 'SELECT ID_UNIDADE FROM TBL_USUARIO_UNIDADE WHERE ID_USUARIO = %d';

type
  Tfrm1Usuario = class(Tfrm1Cadastro)
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblUsuario: TLabel;
    edtUsuario: TDBEdit;
    lblSenha: TLabel;
    edtSenha: TDBEdit;
    cbAdministrador: TDBCheckBox;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsUSUARIO: TStringField;
    cdsADMINISTRADOR: TIntegerField;
    cdsSENHA: TStringField;
    cdsSITUACAO: TIntegerField;
    Label1: TLabel;
    cbbSituacao: TJvDBComboBox;
    dsUnidades: TDataSource;
    grpGrid: TGroupBox;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGrid_Ativo: TcxGridDBColumn;
    cxGrid_Nome: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cdsUnidades: TClientDataSet;
    cdsUnidadesID: TIntegerField;
    cdsUnidadesMarcado: TBooleanField;
    cdsUnidadesNOME: TStringField;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    pmGrid: TPopupMenu;
    MarcarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
  private
    procedure PopulaUnidades;
    procedure GetUnidadesUsuario;
    procedure SetUnidadesUsuario;
    function NenhumaUnidadeSelecionada: Boolean;
  public
    { Public declarations }
  end;

var
  frm1Usuario: Tfrm1Usuario;

implementation

uses
  uDataModule, uSegurancaControle, ufrm0Aguarde;

{$R *.dfm}

procedure Tfrm1Usuario.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;
  if Trim(edtUsuario.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Usuário.','Atenção',MB_OK+MB_ICONWARNING);
    edtUsuario.SetFocus;
    Abort;
  end;
  if Trim(edtSenha.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Senha.','Atenção',MB_OK+MB_ICONWARNING);
    edtSenha.SetFocus;
    Abort;
  end;
  if cbbSituacao.ItemIndex = -1 then
  begin
    Application.MessageBox('Preencha o campo Situação.','Atenção',MB_OK+MB_ICONWARNING);
    cbbSituacao.SetFocus;
    Abort;
  end;
  if NenhumaUnidadeSelecionada then
  begin
    Application.MessageBox('Selecione pelo menos uma Unidade.','Atenção',MB_OK+MB_ICONWARNING);
    if cxGrid.CanFocus then
     cxGrid.SetFocus;
    Abort;
  end;

  CriarTelaAguarde('Aguarde...Salvando registro');
  try
    if cds.State=dsInsert then
      begin
        TSegurancaControle.GravaLog(nlNormal, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
         'Cadastro de Usuário | Tabela: TBL_USUARIO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
         ' | Descrição: '+cdsUSUARIO.Value+' | Situação: '+cbbSituacao.Text);
        cdsSENHA.Value :=TSegurancaControle.EncriptaMD5(Trim(edtSenha.Text));
      end
    else
    if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlNormal, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Usuário | Tabela: TBL_USUARIO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+cdsUSUARIO.Value+' | Situação: '+cbbSituacao.Text);

    inherited;
    SetUnidadesUsuario;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm1Usuario.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_USUARIO_ID');
  cdsADMINISTRADOR.Value :=0;
  cdsSITUACAO.AsInteger :=cAtivo;
end;

procedure Tfrm1Usuario.DesmarcarTodos1Click(Sender: TObject);
begin
  cdsUnidades.First;
  while not cdsUnidades.Eof do
  begin
    cdsUnidades.Edit;
    cdsUnidadesMarcado.AsBoolean :=False;
    cdsUnidades.Post;

    cdsUnidades.Next;
  end;
end;

procedure Tfrm1Usuario.edtUsuarioExit(Sender: TObject);
begin
  if TManipulacaoDados.RegistroExiste('TBL_USUARIO','USUARIO','USUARIO = '+QuotedStr(Trim(edtUsuario.Text))+
    ' AND ID <> '+cdsID.AsString) then
  begin
    Application.MessageBox('Usuário já existente.','Atenção',MB_OK+MB_ICONWARNING);
    cdsUSUARIO.Clear;
    edtUsuario.SetFocus;
  end;
end;

procedure Tfrm1Usuario.FormCreate(Sender: TObject);
begin
  cdsUnidades.CreateDataSet;
end;

procedure Tfrm1Usuario.FormShow(Sender: TObject);
begin
  edtSenha.Enabled :=cds.State=dsInsert;
  GetUnidadesUsuario;
end;


procedure Tfrm1Usuario.GetUnidadesUsuario;
var
  vCds: TClientDataSet;
begin
  PopulaUnidades;
  vCds :=TClientDataSet.Create(nil);

  try
    if cds.State=dsInsert then
    begin
      if cdsUnidades.RecordCount=1 then
      begin
        cdsUnidades.Edit;
        cdsUnidadesMarcado.AsBoolean :=True;
        cdsUnidades.Post
      end
      else
      begin
        while not cdsUnidades.Eof do
        begin
         if cdsUnidadesID.AsInteger = DM.IdUnidade then
         begin
           cdsUnidades.Edit;
           cdsUnidadesMarcado.AsBoolean :=True;
           cdsUnidades.Post;
           Break;
         end;
         cdsUnidades.Next;
        end;
      end;
    end
    else
    begin
      vCds.IndexFieldNames :=EmptyStr;
      vCds.IndexName :=EmptyStr;

      vCds.Data :=TManipulacaoDados.GetDataDataSet(Format(SqlBuscaUnidadesUsuario,[cdsID.AsInteger]));

      vCds.First;
      while not vCds.Eof do
      begin
         cdsUnidades.First;
         while not cdsUnidades.Eof do
         begin
           if cdsUnidadesID.AsInteger = vCds.Fields[0].AsInteger then
           begin
             cdsUnidades.Edit;
             cdsUnidadesMarcado.AsBoolean :=True;
             cdsUnidades.Post;
             Break;
           end;
           cdsUnidades.Next;
         end;
         vCds.Next;
      end;
    end;
  finally
    FreeAndNil(vCds);
  end;
end;

procedure Tfrm1Usuario.MarcarTodos1Click(Sender: TObject);
begin
  cdsUnidades.First;
  while not cdsUnidades.Eof do
  begin
    cdsUnidades.Edit;
    cdsUnidadesMarcado.AsBoolean :=True;
    cdsUnidades.Post;

    cdsUnidades.Next;
  end;
end;

function Tfrm1Usuario.NenhumaUnidadeSelecionada: Boolean;
begin
  Result :=True;
  cdsUnidades.First;
  while not cdsUnidades.Eof do
  begin
    if cdsUnidadesMarcado.AsBoolean then
    begin
      Result :=False;
      Break;
    end;
    cdsUnidades.Next;
  end;
end;

procedure Tfrm1Usuario.PopulaUnidades;
begin
  try
    cdsUnidades.DisableControls;
    cxGrid.BeginUpdate();

    cdsUnidades.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cdsUnidades, SqlBuscaUnidades);

    cdsUnidades.Open;
    while not cdsUnidades.Eof do
    begin
      cdsUnidades.Edit;
      cdsUnidadesMarcado.AsBoolean :=False;
      cdsUnidades.Post;

      cdsUnidades.Next;
    end;

    TManipulacaoDados.OrdenaDataSet(cdsUnidades, 'NOME', oAscendente);
    cdsUnidades.First;
  finally
    cdsUnidades.EnableControls;
    cxGrid.EndUpdate;;
  end;
end;

procedure Tfrm1Usuario.SetUnidadesUsuario;
var
  vScript: TStringBuilder;
begin
  vScript := TStringBuilder.Create;
  try
    vScript.Append('DELETE FROM TBL_USUARIO_UNIDADE WHERE ID_USUARIO = '+IntToStr(cdsID.AsInteger)+'; ');

    cdsUnidades.DisableControls;
    cdsUnidades.First;
    while not cdsUnidades.Eof do
    begin
      if cdsUnidadesMarcado.AsBoolean then
      begin
        vScript.Append('INSERT INTO TBL_USUARIO_UNIDADE (ID, ID_USUARIO, ID_UNIDADE) ');
        vScript.Append('VALUES (');
        vScript.Append('NULL');  vScript.Append(', ');
        vScript.Append(cdsID.AsInteger);          vScript.Append(', ');
        vScript.Append(cdsUnidadesID.AsInteger);  vScript.Append('); ');
      end;
      cdsUnidades.Next;
    end;
     TManipulacaoDados.ExecuteSql(vScript.ToString);
  finally
    cdsUnidades.EnableControls;
    FreeAndNil(vScript);
  end;
end;

end.
