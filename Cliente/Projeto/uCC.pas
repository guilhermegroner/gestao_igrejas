//
// Created by the DataSnap proxy generator.
// 11/10/2018 02:31:20
//

unit uCC;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminClient)
  private
    FRetornaIDCommand: TDBXCommand;
    FGetDataDataSetCommand: TDBXCommand;
    FExecuteSqlCommand: TDBXCommand;
    FRegistroExisteCommand: TDBXCommand;
    FGravaLogCommand: TDBXCommand;
    FListaUsuariosCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function RetornaID(pNomeGenerator: string): Integer;
    function GetDataDataSet(pSql: string): OleVariant;
    function ExecuteSql(pSql: string): Boolean;
    function RegistroExiste(pTabela: string; pCampo: string; pCondicao: string): Boolean;
    procedure GravaLog(pNivel: Integer; pIdUsuario: Integer; pIdUnidade: Integer; pDescricao: string);
    function ListaUsuarios(pAtivos: Boolean): TJSONArray;
  end;

implementation

function TSMClient.RetornaID(pNomeGenerator: string): Integer;
begin
  if FRetornaIDCommand = nil then
  begin
    FRetornaIDCommand := FDBXConnection.CreateCommand;
    FRetornaIDCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaIDCommand.Text := 'TSM.RetornaID';
    FRetornaIDCommand.Prepare;
  end;
  FRetornaIDCommand.Parameters[0].Value.SetWideString(pNomeGenerator);
  FRetornaIDCommand.ExecuteUpdate;
  Result := FRetornaIDCommand.Parameters[1].Value.GetInt32;
end;

function TSMClient.GetDataDataSet(pSql: string): OleVariant;
begin
  if FGetDataDataSetCommand = nil then
  begin
    FGetDataDataSetCommand := FDBXConnection.CreateCommand;
    FGetDataDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDataDataSetCommand.Text := 'TSM.GetDataDataSet';
    FGetDataDataSetCommand.Prepare;
  end;
  FGetDataDataSetCommand.Parameters[0].Value.SetWideString(pSql);
  FGetDataDataSetCommand.ExecuteUpdate;
  Result := FGetDataDataSetCommand.Parameters[1].Value.AsVariant;
end;

function TSMClient.ExecuteSql(pSql: string): Boolean;
begin
  if FExecuteSqlCommand = nil then
  begin
    FExecuteSqlCommand := FDBXConnection.CreateCommand;
    FExecuteSqlCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteSqlCommand.Text := 'TSM.ExecuteSql';
    FExecuteSqlCommand.Prepare;
  end;
  FExecuteSqlCommand.Parameters[0].Value.SetWideString(pSql);
  FExecuteSqlCommand.ExecuteUpdate;
  Result := FExecuteSqlCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.RegistroExiste(pTabela: string; pCampo: string; pCondicao: string): Boolean;
begin
  if FRegistroExisteCommand = nil then
  begin
    FRegistroExisteCommand := FDBXConnection.CreateCommand;
    FRegistroExisteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegistroExisteCommand.Text := 'TSM.RegistroExiste';
    FRegistroExisteCommand.Prepare;
  end;
  FRegistroExisteCommand.Parameters[0].Value.SetWideString(pTabela);
  FRegistroExisteCommand.Parameters[1].Value.SetWideString(pCampo);
  FRegistroExisteCommand.Parameters[2].Value.SetWideString(pCondicao);
  FRegistroExisteCommand.ExecuteUpdate;
  Result := FRegistroExisteCommand.Parameters[3].Value.GetBoolean;
end;

procedure TSMClient.GravaLog(pNivel: Integer; pIdUsuario: Integer; pIdUnidade: Integer; pDescricao: string);
begin
  if FGravaLogCommand = nil then
  begin
    FGravaLogCommand := FDBXConnection.CreateCommand;
    FGravaLogCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGravaLogCommand.Text := 'TSM.GravaLog';
    FGravaLogCommand.Prepare;
  end;
  FGravaLogCommand.Parameters[0].Value.SetInt32(pNivel);
  FGravaLogCommand.Parameters[1].Value.SetInt32(pIdUsuario);
  FGravaLogCommand.Parameters[2].Value.SetInt32(pIdUnidade);
  FGravaLogCommand.Parameters[3].Value.SetWideString(pDescricao);
  FGravaLogCommand.ExecuteUpdate;
end;

function TSMClient.ListaUsuarios(pAtivos: Boolean): TJSONArray;
begin
  if FListaUsuariosCommand = nil then
  begin
    FListaUsuariosCommand := FDBXConnection.CreateCommand;
    FListaUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListaUsuariosCommand.Text := 'TSM.ListaUsuarios';
    FListaUsuariosCommand.Prepare;
  end;
  FListaUsuariosCommand.Parameters[0].Value.SetBoolean(pAtivos);
  FListaUsuariosCommand.ExecuteUpdate;
  Result := TJSONArray(FListaUsuariosCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TSMClient.Destroy;
begin
  FRetornaIDCommand.DisposeOf;
  FGetDataDataSetCommand.DisposeOf;
  FExecuteSqlCommand.DisposeOf;
  FRegistroExisteCommand.DisposeOf;
  FGravaLogCommand.DisposeOf;
  FListaUsuariosCommand.DisposeOf;
  inherited;
end;

end.

