unit ufrm1Grupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

Const
  SqlBuscaNomeMembro ='SELECT NOME FROM TBL_PAST_MEMBRO WHERE ID = %d';

  SqlBuscaMembrosGrupo ='SELECT G.ID_MEMBRO AS ID, M.NOME FROM TBL_PAST_GRUPO_MEMBRO G'+
    ' INNER JOIN TBL_PAST_MEMBRO M ON (M.ID = G.ID_MEMBRO)'+
    ' WHERE G.ID_GRUPO = %d';

type
  Tfrm1Grupo = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsID_UNIDADE: TIntegerField;
    pnlMembrosGrupo: TPanel;
    grpMembrosGrupo: TGroupBox;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridTV_ID: TcxGridDBColumn;
    cxGridTV_Nome: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    btnAddItemBaixar: TAdvGlowButton;
    cdsMembros: TClientDataSet;
    dsMembros: TDataSource;
    cdsMembrosID: TIntegerField;
    cdsMembrosNOME: TStringField;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    cxStyleTituloGrid: TcxStyle;
    btnRemoverMembro: TAdvGlowButton;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    procedure btnSalvarClick(Sender: TObject);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnAddItemBaixarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoverMembroClick(Sender: TObject);
  private
    function GetMembro: string;
    procedure AdicionaMembro(pIdMembro: string);
    function RetornaNomeMembro(pIdMembro: Integer): string;
    procedure SetMembrosGrupo;
    procedure GetMembrosGrupo;
  public
    { Public declarations }
  end;

var
  frm1Grupo: Tfrm1Grupo;

implementation

uses
  uSegurancaControle, uDataModule, uManipulacaoDados, ufrm0Consulta, uConsultasSql, ufrm0Aguarde;

{$R *.dfm}

procedure Tfrm1Grupo.AdicionaMembro(pIdMembro: string);
begin
  try
    cdsMembros.DisableControls;
    cxGrid.BeginUpdate();

    cdsMembros.Open;
    cdsMembros.Insert;
    cdsMembrosID.AsInteger :=StrToInt(pIdMembro);
    cdsMembrosNOME.AsString :=RetornaNomeMembro(StrToInt(pIdMembro));
    cdsMembros.Post;

  finally
    cdsMembros.EnableControls;
    cxGrid.EndUpdate;;
  end;
end;

procedure Tfrm1Grupo.btnAddItemBaixarClick(Sender: TObject);
var
  vIdMembro: string;
begin
  vIdMembro :=GetMembro;

  if vIdMembro<>EmptyStr then
  begin
    if (cdsMembros.locate('ID', vIdMembro, [lopartialkey,locaseinsensitive])) then
    begin
      Application.MessageBox('Membro j? inclu?do.','Aten??o',MB_OK+MB_ICONWARNING);
      if btnAddItemBaixar.CanFocus then
       btnAddItemBaixar.SetFocus;
      Abort;
    end;

    AdicionaMembro(vIdMembro);
  end;
end;

procedure Tfrm1Grupo.btnRemoverMembroClick(Sender: TObject);
begin
  if cdsMembros.RecordCount=0 then
  begin
    Application.MessageBox('Nenhum Membro selecionado.','Aten??o',MB_OK+MB_ICONWARNING);
    Abort;
  end;
  cdsMembros.Delete;
end;

procedure Tfrm1Grupo.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Aten??o',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  CriarTelaAguarde('Aguarde...Salvando registro');
  try
    if cds.State=dsInsert then
      begin
        TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Inclu?do! Tela: '+
         'Cadastro de Grupo | Tabela: TBL_PAST_GRUPO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
         ' | Descri??o: '+edtNome.Text);
      end
    else
    if cds.State=dsEdit then
        TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
         'Cadastro de Grupo | Tabela: TBL_PAST_GRUPO | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
         ' | Descri??o: '+edtNome.Text);

    inherited;
    SetMembrosGrupo;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm1Grupo.cdsNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_PAST_GRUPO_ID');
  cdsID_UNIDADE.AsInteger :=DM.IdUnidade;
end;

procedure Tfrm1Grupo.FormCreate(Sender: TObject);
begin
  cdsMembros.CreateDataSet;
end;

procedure Tfrm1Grupo.FormShow(Sender: TObject);
begin
  inherited;
  if cds.State=dsEdit then
   GetMembrosGrupo;
end;

function Tfrm1Grupo.GetMembro: string;
begin
  Result :=Consultar(Format(cSqlTodosMembros,[DM.IdUnidade]), 'ID', 1, nil, nil, 'TBL_PAST_MEMBRO',
   'ID', 'ID', 'Lista de Membros');
end;

procedure Tfrm1Grupo.GetMembrosGrupo;
begin
  try
    cdsMembros.DisableControls;
    cxGrid.BeginUpdate();

    cdsMembros.EmptyDataSet;
    TManipulacaoDados.PopulaDataSet(cdsMembros, Format(SqlBuscaMembrosGrupo,[cdsID.AsInteger]));

    TManipulacaoDados.OrdenaDataSet(cdsMembros, 'NOME', oAscendente);
    cdsMembros.Open;
  finally
    cdsMembros.EnableControls;
    cxGrid.EndUpdate;;
  end;
end;

function Tfrm1Grupo.RetornaNomeMembro(pIdMembro: Integer): string;
begin
  Result :=Trim(TManipulacaoDados.RetornaCampo(Format(SqlBuscaNomeMembro,[pIdMembro])));
end;

procedure Tfrm1Grupo.SetMembrosGrupo;
var
  vScript: TStringBuilder;
begin
  vScript :=TStringBuilder.Create;
  try
    vScript.Append('DELETE FROM TBL_PAST_GRUPO_MEMBRO WHERE ID_GRUPO = '+IntToStr(cdsID.AsInteger)+'; ');

    if cdsMembros.RecordCount >0 then
    begin
      cdsMembros.DisableControls;
      cdsMembros.First;
      while not cdsMembros.Eof do
      begin
        vScript.Append('INSERT INTO TBL_PAST_GRUPO_MEMBRO (ID, ID_MEMBRO, ID_GRUPO) ');
        vScript.Append('VALUES (');
        vScript.Append('NULL');  vScript.Append(', ');
        vScript.Append(cdsMembrosID.AsInteger);          vScript.Append(', ');
        vScript.Append(cdsID.AsInteger);  vScript.Append('); ');
        cdsMembros.Next;
      end;
    end;
     TManipulacaoDados.ExecuteSql(vScript.ToString);
  finally
    cdsMembros.EnableControls;
    FreeAndNil(vScript);
  end;
end;

end.
