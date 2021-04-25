unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, uCC,
  Data.DBXCommon, IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.DSConnect, System.ImageList, Vcl.ImgList, Vcl.Controls, cxGraphics,
  Vcl.AppEvnts, Dialogs, MidasLib, System.IniFiles, IWSystem, Winapi.Windows,
  frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS,
  FireDAC.Phys.DSDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, DBXDataSnap;

const
 cNomeArquivoINI = 'Servidor.INI';

type
  TDM = class(TDataModule)
    ConnDataSnap: TSQLConnection;
    DSPConnSM: TDSProviderConnection;
    ApplicationEvents: TApplicationEvents;
    ImageList32x32: TcxImageList;
    frxDBDadosUnidade: TfrxDBDataset;
    cdsDadosUnidade: TClientDataSet;
    cdsDadosUnidadeID: TIntegerField;
    cdsDadosUnidadeNOME: TStringField;
    cdsDadosUnidadeENDERECO: TStringField;
    cdsDadosUnidadeENDERECO_NUMERO: TStringField;
    cdsDadosUnidadeENDERECO_BAIRRO: TStringField;
    cdsDadosUnidadeCNPJ: TStringField;
    cdsDadosUnidadeTELEFONE: TStringField;
    cdsDadosUnidadeCEP: TStringField;
    cdsDadosUnidadeCIDADE: TStringField;
    cdsDadosUnidadeUF: TStringField;
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure DataModuleCreate(Sender: TObject);
  private
    //Sessão
    FIdUsuario: Integer;
    FUsuario: string;
    FNomeUsuario: string;
    FUsuarioAdministrador: Boolean;
    FIdUnidade: Integer;
    FUnidade: string;

    FInstanceOwner: Boolean;
    FSMClient: TSMClient;
    function GetSMClient: TSMClient;
    procedure SetArquivoINI (pSQLConnection : TSQLConnection);
    procedure LerArquivoINI (pSQLConnection : TSQLConnection);
  public
    //Sessão
    property IdUsuario: integer read FIdUsuario write FIdUsuario;
    property Usuario: string read FUsuario write FUsuario;
    property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
    property UsuarioAdministrador: Boolean read FUsuarioAdministrador write FUsuarioAdministrador;
    property IdUnidade: integer read FIdUnidade write FIdUnidade;
    property Unidade: string read FUnidade write FUnidade;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMClient read GetSMClient write FSMClient;
    procedure DesconectarServidor;
    function ConectarServidor: Boolean;
    function ReConectarServidor: Boolean;

end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.ApplicationEventsException(Sender: TObject; E: Exception);
var
  vMensagem: string;
  Pos1, Pos2: integer;
begin
  if Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Data inválida. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Houve violação de Chave. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('Input value'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Campo preenchido com valor não válido. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Hora inválida. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('Erro ApplyUpdates'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Problemas ao Salvar. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('is not a valid float'), UpperCase(E.Message)) <> 0 then
  begin
    Pos1 :=Pos('''', E.Message);
    vMensagem :=E.Message;
    Delete(vMensagem, Pos1, 1);
    Pos2 :=Pos('''', vMensagem);
    vMensagem :=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
    vMensagem :='O valor  '+ vMensagem + ' não é válido.';
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('ATTEMPT TO STORE DUPLICATE VALUE'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Informação duplicada. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('FOREIGN KEY'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Registro vinculado em outra tabela. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('Provider not exported:'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Versão do servidor incompatível. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('SQL Server Error: Column unknown'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Versão do Banco de Dados incompatível. '+E.Message;
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := 'Registro Duplicado'+#13#10+Copy(UpperCase(E.Message),
      Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT',UpperCase(E.Message))+47,100);
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('CATASTROPHIC FAILURE'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Falha inesperada na conexão com o servidor. '+E.Message;;
    ShowMessage(vMensagem+#13+E.Message);
    ReConectarServidor;
  end
  else
  if Pos(UpperCase('PARENTCONNECTION IS NOT ASSIGNED'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Falha inesperada na conexão com o servidor. '+E.Message;;
    ShowMessage(vMensagem+#13+E.Message);
    ReConectarServidor;
  end
  else
  if Pos(UpperCase('dbExpress Error: [0x0015]: Connection failed'), UpperCase(E.Message)) <> 0 then
  begin
    if Pos(UpperCase('SQL Server Error: Unable to complete network request to host'), UpperCase(E.Message)) <> 0 then
    begin
      Pos1     :=Pos('"', E.Message);
      vMensagem :=E.Message;
      Delete(vMensagem, Pos1, 1);
      Pos2     := Pos('"', vMensagem);
      vMensagem := copy(E.Message, Pos1 + 1, Pos2 - Pos1);
      vMensagem := 'O servidor ' + vMensagem + ' não pode ser acessado.' + #13 +
                  'Este problema pode estar ocorrendo por problemas na conexão' + #13 +
                  'desta estação com a rede, ou por problemas de configuração ou firewals.' + #13 +
                  'Contate o suporte.';
      ShowMessage(vMensagem);
      Halt;
    end
  end
  else
  if Pos(UpperCase('missing database'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := ' Banco de Dados não encontrado.' +#13+
                 ' O programa será fechado.' ;
    ShowMessage(vMensagem+#13+E.Message);
    Halt;
  end
  else
  if Pos(UpperCase('ERROR READING FROM SOCKET'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem := ' Servidor em manutenção ou provável' + #13 +
                ' problema de conexão com a rede.' + #13#13 +
                ' Pressione "OK" para Tentar Reconectar ...';
    ShowMessage(vMensagem+#13+E.Message);
    ReConectarServidor;
  end
  else
  if Pos(UpperCase('WINDOWS SOCKET ERROR:'), UpperCase(E.Message)) <> 0 then
  begin
    if Pos(UpperCase('WINDOWS Socket ERROR:'), UpperCase(E.Message)) <> 0 then
    begin
      vMensagem := ' Servidor em manutenção ou provável' + #13 +
                  ' problema de conexão com a rede.' + #13 +
                  ' Pressione "OK" para Tentar Reconectar ...';
      ShowMessage(vMensagem+#13+E.Message);
      ReConectarServidor;
    end
    else
    if Pos(UpperCase('(10061)'), UpperCase(E.Message)) <> 0 then
    begin
      vMensagem := ' Servidor em manutenção ou provável' + #13 +
                  ' problema de conexão com a rede.' + #13 +
                  ' Pressione "OK" para Tentar Reconectar ...';
      ShowMessage(vMensagem+#13+E.Message);
      ReConectarServidor;
    end;
  end
  else
  if Pos(UpperCase('COULD NOT PARSE SQL TIMESTAMP STRING'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Data inválida.';
    ShowMessage(vMensagem+#13+E.Message);
  end
  else
  if Pos(UpperCase('THE RPC SERVER IS UNAVAILABLE'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Erro de Conexão!'+#13+'Reestabelecendo conexao com o Servidor.';
    Screen.Cursor := crDefault;
    ReConectarServidor;
  end
  else
  if Pos(UpperCase('Name not Unique in this context'), UpperCase(E.Message)) <> 0 then
  begin
    vMensagem :='Erro de Conexão!'+#13+'Reestabelecendo conexao com o Servidor.';
    Screen.Cursor := crDefault;
    ReConectarServidor;
  end;
end;

function TDM.ConectarServidor: Boolean;
begin
  try
    try
      if ConnDataSnap.Connected then
        DesconectarServidor;

      SetArquivoINI(ConnDataSnap);   //Validar se leu e entao conectar

      ConnDataSnap.Open;
      ConnDataSnap.Connected :=True;
    finally

    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro ao conectar ao Servidor'
       +sLineBreak+'Erro: '+E.Message), 'Atenção!',mb_OK + MB_ICONINFORMATION);

      Application.Terminate;
    end;
  end;
end;

constructor TDM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ConnDataSnap.Connected :=False;
  DSPConnSM.Connected :=False;
  cdsDadosUnidade.CreateDataSet;
end;

procedure TDM.DesconectarServidor;
begin
  try
    ConnDataSnap.Close;
    ConnDataSnap.Connected :=False;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao executar Sql '+#13+E.Message);
    end;
  end;
end;

destructor TDM.Destroy;
begin
  FSMClient.Free;
  inherited;
end;

function TDM.GetSMClient: TSMClient;
begin
  if FSMClient = nil then
  begin
    ConnDataSnap.Open;
    FSMClient:= TSMClient.Create(ConnDataSnap.DBXConnection, FInstanceOwner);
  end;
  Result := FSMClient;
end;

procedure TDM.LerArquivoINI(pSQLConnection: TSQLConnection);
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(gsAppPath+cNomeArquivoINI);
  try
    pSQLConnection.Close;
    pSQLConnection.Params.Values['HostName'] :=ArquivoINI.ReadString('DataSnap', 'Servidor', '');
    pSQLConnection.Params.Values['Port'] :=ArquivoINI.ReadString('DataSnap', 'Porta', '');
    pSQLConnection.Open;
  finally
    ArquivoINI.Free;
  end;
end;

function TDM.ReConectarServidor: Boolean;
begin
  try
    DesconectarServidor;
    Result :=ConectarServidor;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o suporte'+#13+E.Message);
    end;
  end;
end;

procedure TDM.SetArquivoINI(pSQLConnection: TSQLConnection);
var
 ArquivoINI: TIniFile;
begin
  if FileExists(gsAppPath+cNomeArquivoINI) then
  begin
    LerArquivoINI(pSQLConnection);
    Exit;
  end;

  ArquivoINI := TIniFile.Create(gsAppPath+cNomeArquivoINI);
  try
    ArquivoINI.WriteString('DataSnap', 'Servidor', '');
    ArquivoINI.WriteString('DataSnap', 'Porta', '');
  finally
    ArquivoINI.Free;
  end;
end;

end.
