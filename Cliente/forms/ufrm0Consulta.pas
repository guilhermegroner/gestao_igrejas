unit ufrm0Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, DB, DBClient, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, AdvGlowButton, Vcl.ExtCtrls, JvExControls,
  JvGradientHeaderPanel, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid;

type
  Tfrm0Consulta = class(Tfrm0Default)
    hdrTitulo: TJvGradientHeaderPanel;
    pnlTopBotoes: TPanel;
    btnIncluir: TAdvGlowButton;
    btnEditar: TAdvGlowButton;
    btnSelecionar: TAdvGlowButton;
    btnExcluir: TAdvGlowButton;
    btnAtualizar: TAdvGlowButton;
    btnFechar: TAdvGlowButton;
    Acoes: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actAtualizar: TAction;
    actFechar: TAction;
    actSelecionar: TAction;
    Grid: TJvDBGrid;
    procedure FormShow(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure GridDblClick(Sender: TObject);
  private
    vFiltro: string;
    procedure AtualizaDados;
    procedure SetTamanhoColunasGrid;
  public
    vCds: TClientDataSet;
    vDs: TDataSource;
    vResultado: Boolean;
    vIndicedeOrdem: Integer;
    vTelaCadastro: TForm;
    vClasseTelaCadastro: TFormClass;
    vTabela, vChave, vCampoChave, vCaptionForm, vTextoLog, vCaptionPanel, vCampoRetorno, vSqlConsulta: string;
    constructor Create(AOwner: TComponent; pConsulta: string);
    procedure CriarForm(Sender: TObject);
  end;

var
  frm0Consulta: Tfrm0Consulta;

implementation

uses
  uManipulacaoDados, uDataModule, ufrm0Aguarde, uServerUtils.Data, uSegurancaControle, ufrm1Cadastro;

{$R *.dfm}

procedure Tfrm0Consulta.actAtualizarExecute(Sender: TObject);
begin
  AtualizaDados;
end;

procedure Tfrm0Consulta.actEditarExecute(Sender: TObject);
var
  vI: Integer;
  vSql, vValor: string;
begin
  if vCds.RecordCount = 0 then
    Exit;

  if vCds.FieldByName(vCampoChave).DataType = ftDate then
  begin
    vValor :=TServerUtilsData.DataToSql(vCds.FieldByName(vCampoChave).AsDateTime);
  end
  else
  begin
    vValor :=QuotedStr(vCds.FieldByName(vCampoChave).AsString);
  end;

  vSql := 'SELECT * FROM '+vTabela+' WHERE '+vChave+' = '+vValor;
  try
    with Self do
    begin
      if vClasseTelaCadastro = nil then
      begin
        Application.MessageBox('Cadastro Indisponível', 'Informação', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      if not Assigned(vTelaCadastro) then
        vTelaCadastro := vClasseTelaCadastro.Create(nil);

      if vClasseTelaCadastro.ClassParent <> Tfrm1Cadastro then
      begin
        vTelaCadastro.ShowModal;
        AtualizaDados;
        Exit;
      end;

      for vI := 0 to vTelaCadastro.ComponentCount - 1 do
      begin
        if vTelaCadastro.Components[vI] is TClientDataSet then
        begin
          if TClientDataSet(vTelaCadastro.Components[vI]).Name = 'cds' then
          begin
            TManipulacaoDados.Consulta(TClientDataSet(vTelaCadastro.Components[vI]),
              'SELECT * FROM '+vTabela+' WHERE '+vChave+' = '+vValor);
            TClientDataSet(vTelaCadastro.Components[vI]).Edit;
          end;
        end;
      end;

      vTelaCadastro.ShowModal;

      AtualizaDados;
    end;
  finally
    if Assigned(vTelaCadastro) then
    begin
      try
        vTelaCadastro.Release;
      except
        vTelaCadastro.Free;
      end;
      vTelaCadastro := nil;
    end;
  end;
end;

procedure Tfrm0Consulta.actExcluirExecute(Sender: TObject);
var
  vValor, vNomeTela, vDescricao, vSql: string;
begin
  vValor :=EmptyStr;
  vNomeTela :=EmptyStr;
  vDescricao :=EmptyStr;

  if vCds.RecordCount = 0 then
    Exit;

  if Application.MessageBox('Deseja exluir este Item?', 'Atenção', MB_YESNO + MB_ICONWARNING) = IDYES then
  begin
    if vCds.FieldByName(vCampoChave).DataType in [ftDate, ftDateTime] then
      vValor :=TServerUtilsData.DataToSql(vCds.FieldByName(vCampoChave).AsDateTime)
    else
      vValor :=vCds.FieldByName(vCampoChave).AsString;

    if vCds.Fields[1].DataType in [ftDate, ftDateTime] then
      vDescricao :=TServerUtilsData.DataToSql(vCds.Fields[1].AsDateTime)
    else
      vDescricao :=vCds.Fields[1].AsString;


    vSql := 'DELETE FROM '+vTabela+' WHERE '+vChave+' = '+vValor+';';

    if not TManipulacaoDados.ExecuteSql(vSql) then
      Application.MessageBox(PChar('Registro tem vinculo em outra Tabela!'+sLineBreak+'E não pode ser excluído'),
      'Atenção!',mb_OK + MB_ICONINFORMATION)
    else
    begin
      TSegurancaControle.GravaLog(nlAlto, DM.IdUsuario, DM.IdUnidade, 'Registro Excluído! Tela: '+vTextoLog+
         ' | Tabela: '+vTabela+' | Chave da Tabela: '+vChave+' | Valor: '+vValor+' | Descrição: '+vDescricao);
      AtualizaDados;
    end;
  end;
end;

procedure Tfrm0Consulta.actFecharExecute(Sender: TObject);
begin
  vResultado :=False;
  Close;
end;

procedure Tfrm0Consulta.actIncluirExecute(Sender: TObject);
var
  vI: Integer;
begin
  try
    with Self do
    begin
      if vClasseTelaCadastro = nil then
      begin
        Application.MessageBox('Cadastro Indisponível', 'Informação', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      if not Assigned(vTelaCadastro) then
        vTelaCadastro :=vClasseTelaCadastro.Create(nil);

      if vClasseTelaCadastro.ClassParent <> Tfrm1Cadastro then
      begin
        vTelaCadastro.ShowModal;
        AtualizaDados;
        Exit;
      end;

      for vI := 0 to vTelaCadastro.ComponentCount - 1 do
      begin
        if vTelaCadastro.Components[vI] is TClientDataSet then
        begin
          if TClientDataSet(vTelaCadastro.Components[vI]).Name = 'cds' then
          begin
            TManipulacaoDados.Consulta(TClientDataSet(vTelaCadastro.Components[vI]),
              'SELECT * FROM '+vTabela+' WHERE '+vChave+' IS NULL');

            TClientDataSet(vTelaCadastro.Components[vI]).Insert;
          end;
        end;
      end;

      vTelaCadastro.ShowModal;
      AtualizaDados;
    end;
  finally
    if Assigned(vTelaCadastro) then
    begin
      FreeAndNil(vTelaCadastro);
    end;
  end;
end;

procedure Tfrm0Consulta.actSelecionarExecute(Sender: TObject);
begin
  if (Trim(vCampoRetorno)<>EmptyStr) then
  begin
    vResultado :=True;
    Close;
  end;
end;

procedure Tfrm0Consulta.AtualizaDados;
var
  vSql: string;
  vValor: Variant;
begin
  try
    Screen.Cursor :=crHourGlass;

    try
      vValor :=Grid.Columns[vIndicedeOrdem].Field.Value;
    except
    end;

    vCds.Close;
    Grid.Refresh;

    CriarTelaAguarde('Aguarde...Buscando informações');

    vSql :=vSqlConsulta;
    vCds.Filter :='';
    vCds.Filtered :=False;
    vCds.IndexName :='';
    vCds.Close;
    vCds.CreateDataSet;
    vCds.Open;
    vCds.Data :=TManipulacaoDados.GetDataDataSet(vSql);
    TManipulacaoDados.OrdenarGrid(vCds, Grid, Grid.Columns[vIndicedeOrdem]);
    vCds.Fields[0].Alignment :=taCenter;
    vCds.First;
    vCds.FindNearest([vValor]);

    SetTamanhoColunasGrid;
    vFiltro :=EmptyStr;
    Grid.SetFocus;
  finally
    Screen.Cursor :=crDefault;
    FecharTelaAguarde;
  end;
end;

constructor Tfrm0Consulta.Create(AOwner: TComponent; pConsulta: string);
begin
  inherited Create(AOwner);
  vSqlConsulta :=pConsulta;
  CriarForm(AOwner);
end;

procedure Tfrm0Consulta.CriarForm(Sender: TObject);
var
  vSql: string;
begin
  try
    vCds :=TClientDataSet.Create(Self);
    vDs  :=TDataSource.Create(Self);
    vDs.AutoEdit :=False;
    vDs.DataSet :=vCds;
    GRID.DataSource :=vDs;
    vSql :=vSqlConsulta;

    CriarTelaAguarde('Aguarde...Buscando informações');

    vCds.IndexFieldNames :=EmptyStr;
    vCds.IndexName :=EmptyStr;
    vCds.Data :=TManipulacaoDados.GetDataDataSet(vSql);
    vCds.Fields[0].Alignment :=taCenter;

    SetTamanhoColunasGrid;
    GRID.Refresh;
    vCds.First;
  finally
    FecharTelaAguarde;
  end;
end;

procedure Tfrm0Consulta.FormShow(Sender: TObject);
begin
  vResultado :=False;
  Self.Caption :='.: Geek Software';
  hdrTitulo.LabelCaption :='.: '+vCaptionForm;
  TManipulacaoDados.OrdenarGrid(vCds, Grid, Grid.Columns[vIndicedeOrdem]);

  vCds.Fields[vIndicedeOrdem].FocusControl;
  vCds.First;

  if vClasseTelaCadastro=nil then
  begin
    btnIncluir.Visible :=False;
    btnEditar.Visible :=False;
    btnExcluir.Visible :=False;
  end;

  if Self.BorderStyle=bsNone then
  begin
    btnSelecionar.Visible :=False;
    btnFechar.Visible :=False;
    hdrTitulo.LabelCaption :='.: '+vCaptionPanel;
  end;

  if Assigned(vTelaCadastro) then
  begin
    FreeAndNil(vTelaCadastro);
  end;
end;

procedure Tfrm0Consulta.GridDblClick(Sender: TObject);
begin
  if Self.BorderStyle=bsNone then
  begin
    actEditarExecute(Sender);
  end
  else
  begin
    actSelecionarExecute(Sender);
  end;
end;

procedure Tfrm0Consulta.GridTitleClick(Column: TColumn);
begin
  TManipulacaoDados.OrdenarGrid(vCds, GRID, Column);
  vIndicedeOrdem :=Column.Index;
end;

procedure Tfrm0Consulta.SetTamanhoColunasGrid;
var
  vI: Integer;
begin
  for vI := 0 to Grid.Columns.Count - 1 do
  case vCds.FieldByName(GRID.Columns[vI].FieldName).DataType of
    ftString:
      begin
        if vCds.FieldByName(GRID.Columns[vI].FieldName).Size <= 20 then
          GRID.Columns[vI].Width := 60
        else
        if GRID.Columns.Count > 3 then
          GRID.Columns[vI].Width := 200
        else
          GRID.Columns[vI].Width := 400;
      end;
    ftFMTBcd:
      GRID.Columns[vI].Width := 60;
    ftFloat:
      GRID.Columns[vI].Width := 60;
    ftInteger:
      GRID.Columns[vI].Width := 60;
  end;
end;

end.
