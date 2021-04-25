program PrjServidor;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmPrincipalServidor in '..\forms\ufrmPrincipalServidor.pas' {frmPrincipalServidor},
  uSC in 'uSC.pas' {SC: TDataModule},
  uConfiguraBanco in '..\units\uConfiguraBanco.pas',
  uServerUtils.DsServer in '..\units\uServerUtils.DsServer.pas',
  uServerUtils.Data in '..\..\Comum\units\uServerUtils.Data.pas',
  uSM in 'uSM.pas' {SM: TDSServerModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Geek Software';
  Application.CreateForm(TSC, SC);
  Application.CreateForm(TfrmPrincipalServidor, frmPrincipalServidor);
  Application.ShowMainForm := False;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Run;
end.

