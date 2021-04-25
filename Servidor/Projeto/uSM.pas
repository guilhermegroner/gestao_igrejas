unit uSM;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Data.FMTBcd, Data.DB, Data.SqlExpr,
    Datasnap.Provider, DBXCommon, Vcl.Forms, Winapi.Windows;

type
  TSM = class(TDSServerModule)
    DSP_USUARIO: TDataSetProvider;
    TBL_USUARIO: TSQLQuery;
    DSP_CATEGORIA: TDataSetProvider;
    TBL_CATEGORIA: TSQLQuery;
    DSP_SETOR: TDataSetProvider;
    TBL_SETOR: TSQLQuery;
    DSP_RESPONSAVEL: TDataSetProvider;
    TBL_RESPONSAVEL: TSQLQuery;
    DSP_FORNECEDOR: TDataSetProvider;
    TBL_FORNECEDOR: TSQLQuery;
    DSP_PATRIMONIO: TDataSetProvider;
    TBL_PATRIMONIO: TSQLQuery;
    DSP_UNIDADE: TDataSetProvider;
    TBL_UNIDADE: TSQLQuery;
    DSP_GRUPO: TDataSetProvider;
    TBL_GRUPO: TSQLQuery;
    DSP_PASTOR: TDataSetProvider;
    TBL_PASTOR: TSQLQuery;
    DSP_IGREJA: TDataSetProvider;
    TBL_IGREJA: TSQLQuery;
    DSP_MEMBRO: TDataSetProvider;
    TBL_MEMBRO: TSQLQuery;
    DSP_PROFISSAO: TDataSetProvider;
    TBL_PROFISSAO: TSQLQuery;
    DSP_CIDADE: TDataSetProvider;
    TBL_CIDADE: TSQLQuery;
    DSP_FUNCAO: TDataSetProvider;
    TB_FUNCAO: TSQLQuery;
    DSP_UNIDADE_MEDIDA: TDataSetProvider;
    TBL_UNIDADE_MEDIDA: TSQLQuery;
    DSP_EST_GRUPO: TDataSetProvider;
    TBL_EST_GRUPO: TSQLQuery;
    DSP_EST_PRODUTO: TDataSetProvider;
    TBL_EST_PRODUTO: TSQLQuery;
    DSP_EST_ENTRADA: TDataSetProvider;
    TBL_EST_ENTRADA: TSQLQuery;
    DSP_EST_IENTRADA: TDataSetProvider;
    TBL_EST_IENTRADA: TSQLQuery;
    DSP_EST_SAIDA: TDataSetProvider;
    TBL_EST_SAIDA: TSQLQuery;
    DSP_EST_ISAIDA: TDataSetProvider;
    TBL_EST_ISAIDA: TSQLQuery;
  private

  public
    function RetornaID(pNomeGenerator: string): Integer;
    function GetDataDataSet(pSql: string): OleVariant;
    function ExecuteSql(pSql: string): Boolean;
    function RegistroExiste(pTabela, pCampo, pCondicao: string): Boolean;

    //Segurança
    procedure GravaLog(pNivel, pIdUsuario, pIdUnidade: Integer; pDescricao: string);

    //Usuarios
    function ListaUsuarios(pAtivos: Boolean = False): TJSONArray;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, ufrmPrincipalServidor, uServerUtils.Data;

function TSM.ExecuteSql(pSql: string): Boolean;
var
  vQry: TSQLQuery;
  vConexao: TSQLConnection;
  vTrans: TDBXTransaction;
  vScript, vComando: string;
begin
  Result :=True;

  vConexao :=frmPrincipalServidor.Conn;
  try
    if not Assigned(vConexao) then
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: Conexão ao Servidor');
      Abort;
    end;

    vTrans :=vConexao.BeginTransaction(TDBXIsolations.ReadCommitted);
    vQry :=TSQLQuery.Create(nil);

    try
      vScript :=pSql;
      vQry.SQLConnection :=vConexao;

      while vScript<>EmptyStr do
      begin
        vComando :=Trim(copy(vScript, 1, pos(';', vScript) -1));
        vScript :=Trim(copy(vScript, pos(';', vScript) + 1, Length(vScript)));

        if vComando<>EmptyStr then
        begin
          vQry.SQL.Add(vComando);
          vQry.ExecSQL;
          vQry.SQL.Clear;
        end;
      end;
    finally
      FreeAndNil(vQry);
      vConexao.CommitFreeAndNil(vTrans);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
      vConexao.RollbackFreeAndNil(vTrans);
      Result :=False;
    end;
  end;
end;

function TSM.GetDataDataSet(pSql: string): OleVariant;
var
  vQry: TSQLQuery;
  vDsp: TDataSetProvider;
  vConexao: TSQLConnection;
  vTrans: TDBXTransaction;
begin
  vConexao :=frmPrincipalServidor.Conn;
  try
    if not Assigned(vConexao) then
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: Conexão ao Servidor');
      Abort;
    end;

    vTrans :=vConexao.BeginTransaction(TDBXIsolations.ReadCommitted);
    vQry :=TSQLQuery.Create(nil);
    vDsp :=TDataSetProvider.Create(nil);
    try
      vQry.SQLConnection :=vConexao;
      vQry.SQL.Add(pSql);
      vQry.Open;
      vDsp.DataSet :=vQry;

      Result :=vDsp.Data;
    finally
      FreeAndNil(vDsp);
      FreeAndNil(vQry);
      vConexao.CommitFreeAndNil(vTrans);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
      vConexao.RollbackFreeAndNil(vTrans);
    end;
  end;
end;

procedure TSM.GravaLog(pNivel, pIdUsuario, pIdUnidade: Integer; pDescricao: string);
var
  vSql: TStringBuilder;
begin
  if Trim(pDescricao) =EmptyStr then
    Exit;

  vSql := TStringBuilder.Create;
  try
    try
      vSql.Append('INSERT INTO TBL_LOG (ID, DESCRICAO, NIVEL, ID_USUARIO, DATA_LOG, ID_UNIDADE) ');
      vSql.Append('VALUES (');
      vSql.Append(RetornaID('GEN_TBL_LOG_ID'));      vSql.Append(', ');
      vSql.Append(QuotedStr(pDescricao));            vSql.Append(', ');
      vSql.Append(pNivel);                           vSql.Append(', ');
      vSql.Append(IntToStr(pIdUsuario));            vSql.Append(', ');
      vSql.Append(TServerUtilsData.DataToSql(Now));  vSql.Append(', ');
      vSql.Append(IntToStr(pIdUnidade));  vSql.Append('); ');

      ExecuteSql(vSql.ToString);
    finally
      vSql.Free;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
    end;
  end;
end;

function TSM.ListaUsuarios(pAtivos: Boolean): TJSONArray;
var
  vSql: string;
  vItem: TJSONObject;
begin
//  Result := TJSONArray.Create;
//  vSql := 'SELECT ID, USUARIO FROM TBL_USUARIO '+ IfThen(pAtivos, 'WHERE U.STATUS = ''A'' ')+
//          'ORDER BY USUARIO';
//  Command := CreateCommand(vSql);
//  try
//    Reader := Command.ExecuteQuery;
//    try
//      while Reader.Next do
//      begin
//        Item := TJSONObject.Create;
//
//        Item.AddValue('id', Reader.Value['ID'].AsInteger);
//        Item.AddValue('usuario', Reader.Value['LOGIN'].AsString);
//
//        Result.Add(Item);
//      end;
//    finally
//      Reader.Free;
//    end;
//  finally
//    Command.Free;
//  end;
//  Result.DebugFile('ListaUsuarios.json');
end;

function TSM.RegistroExiste(pTabela, pCampo, pCondicao: string): Boolean;
var
  vQry: TSQLQuery;
  vConexao: TSQLConnection;
  vTrans: TDBXTransaction;
begin
  vConexao :=frmPrincipalServidor.Conn;
  try
    if not Assigned(vConexao) then
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: Conexão ao Servidor ');
      Abort;
    end;

    vTrans :=vConexao.BeginTransaction(TDBXIsolations.ReadCommitted);
    vQry :=TSQLQuery.Create(nil);

    try
      vQry.SQLConnection :=vConexao;
      vQry.SQL.Add('SELECT '+pCampo+' FROM '+pTabela+' WHERE '+pCondicao);
      vQry.Open;

      if vQry.RecordCount >0 then
      begin
        Result :=True;
      end
      else
        Result :=False;
    finally
      FreeAndNil(vQry);
      vConexao.CommitFreeAndNil(vTrans);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
      Result :=False;
      vConexao.RollbackFreeAndNil(vTrans);
    end;
  end;
end;

function TSM.RetornaID(pNomeGenerator: string): Integer;
var
  vQuery: TSQLQuery;
  vTrans: TDBXTransaction;
  vConexao: TSQLConnection;
begin
  vQuery :=TSQLQuery.Create(nil);
  vConexao :=frmPrincipalServidor.Conn;
  try
    try
      if not Assigned(vConexao) then
        raise Exception.Create('Conexão não disponível!');

      vTrans :=vConexao.BeginTransaction(TDBXIsolations.ReadCommitted);

      vQuery.SQLConnection :=frmPrincipalServidor.Conn;
      vQuery.SQL.Add('SELECT GEN_ID('+pNomeGenerator+',1) AS ID FROM RDB$DATABASE');
      vQuery.Open;

      Result :=vQuery.Fields[0].AsInteger;
    finally
      vQuery.Close;
      FreeAndNil(vQuery);
      vConexao.CommitFreeAndNil(vTrans);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
      vConexao.RollbackFreeAndNil(vTrans);
    end;
  end;
end;

end.

