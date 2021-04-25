unit uConfiguraBanco;

interface

Uses Data.DBXFirebird, Data.DB, Data.SqlExpr, IniFiles, IWSystem, System.SysUtils;

const
 cNomeArquivoINI = 'ConfigBanco.ini';

type
 TConfiguraConexao = class
  public
  class procedure SetArquivoINI (pSQLConnection : TSQLConnection; pCaminhoBanco : String);
  class procedure LerArquivoINI (pSQLConnection : TSQLConnection);
 end;

implementation

{ TConfiguraConexao }

class procedure TConfiguraConexao.SetArquivoINI(pSQLConnection : TSQLConnection;pCaminhoBanco: String);
var
 vArquivoINI: TIniFile;
begin
  if FileExists(gsAppPath+cNomeArquivoINI) then
  begin
    LerArquivoINI(pSQLConnection);
    Exit;
  end;

  vArquivoINI := TIniFile.Create(gsAppPath+cNomeArquivoINI);
  try
    vArquivoINI.WriteString('Database', 'Banco', pCaminhoBanco);
  finally
    vArquivoINI.Free;
  end;
end;

class procedure TConfiguraConexao.LerArquivoINI(pSQLConnection: TSQLConnection);
var
  vArquivoINI: TIniFile;
begin
  vArquivoINI := TIniFile.Create(gsAppPath+cNomeArquivoINI);
  try
    pSQLConnection.Connected :=False;
    pSQLConnection.Params.Values['Database'] := vArquivoINI.ReadString('Database', 'Banco', '');
    pSQLConnection.Connected :=True;
  finally
    vArquivoINI.Free;
  end;
end;

end.
