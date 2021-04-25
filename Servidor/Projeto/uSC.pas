unit uSC;

interface

uses System.SysUtils, System.Classes,
     Datasnap.DSTCPServerTransport, IWSystem,
     Datasnap.DSHTTPCommon, Datasnap.DSHTTP, IniFiles,
     Datasnap.DSServer, Datasnap.DSCommonServer,
     IPPeerServer, IPPeerAPI, Datasnap.DSAuth, uServerUtils.DsServer;

Const
  cUser='Cli&nt3';
  cPassword='SkbxdAjI';

  cNomeArquivoINI = 'ConfigServer.ini';

type
  TSC = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSHTTPService: TDSHTTPService;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerClass: TDSServerClass;
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      EventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    procedure doRegisterClass(loClass: TPersistentClass; pLifeCycle: string = 'Session');
    procedure doRegisterClasses;
    procedure SetPortasConexao;
  public
  end;

var
  SC: TSC;

implementation


{$R *.dfm}

uses
  uSM, ufrmPrincipalServidor;

procedure TSC.SetPortasConexao;
var
  vArquivoINI: TIniFile;
  vPorta: Integer;
  vPortaString: string;
begin
  vArquivoINI :=TIniFile.Create(gsAppPath+'ConfigServer.ini');
  try
    with vArquivoINI do
    begin
      //Porta TCP
      vPorta :=ReadInteger('Portas','Porta',0);
      if vPorta = 0 then
      begin
        vPorta := 211; //Porta default
        WriteInteger('Porta','Porta',vPorta);
      end;

      DSTCPServerTransport.Port :=vPorta;
      DSHTTPService.DSPort :=vPorta;
      vPortaString :=IntToStr(vPorta);

      //Porta HTTP
      vPorta := ReadInteger('Portas','PortaHTTP',0);
      if vPorta = 0 then
      begin
        vPortaString :=vPortaString[Length(vPortaString)];
        vPorta :=StrToInt('808'+vPortaString);
        WriteInteger('Porta','PortaHTTP',vPorta);
      end;

      DSHTTPService.SetHttpPort(vPorta);
    end;
    DSServer.Start;
  finally
    vArquivoINI.Free;
  end;
end;

procedure TSC.DataModuleCreate(Sender: TObject);
begin
  SetPortasConexao;
  doRegisterClasses;
end;

procedure TSC.doRegisterClass(loClass: TPersistentClass; pLifeCycle: string);
var
  loDsServerClass: TMyDsServerClass;
begin
  loDsServerClass := TMyDsServerClass.Create(Self);
  loDsServerClass.RegisterClass := loClass;
  loDsServerClass.Server := dsServer;
  loDsServerClass.LifeCycle := pLifeCycle;
end;

procedure TSC.doRegisterClasses;
begin
  doRegisterClass(TfrmPrincipalServidor);
  doRegisterClass(TSM);
end;

procedure TSC.DSAuthenticationManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  { TODO : Validate the client user and password.
    If role-based authorization is needed, add role names to the UserRoles parameter  }
   valid := ((User=cUser) and (Password=cPassword));
end;

procedure TSC.DSAuthenticationManagerUserAuthorize(
  Sender: TObject; EventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  { TODO : Authorize a user to execute a method.
    Use values from EventObject such as UserName, UserRoles, AuthorizedRoles and DeniedRoles.
    Use DSAuthenticationManager1.Roles to define Authorized and Denied roles
    for particular server methods. }
  valid := True;
end;

procedure TSC.DSServerClassGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSM.TSM;
end;

end.

