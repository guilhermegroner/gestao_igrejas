unit ufrmPrincipalServidor;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DBXFirebird, Data.DB, Data.SqlExpr, Vcl.ExtCtrls, Vcl.Menus, MidasLib,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TfrmPrincipalServidor = class(TForm)
    Conn: TSQLConnection;
    TrayIcon: TTrayIcon;
    pmOpcoes: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    FinalizarServidor1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Abrir1Click(Sender: TObject);
    procedure FinalizarServidor1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    vFinalizarServidor: Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipalServidor: TfrmPrincipalServidor;

implementation

{$R *.dfm}

uses uSC, uConfiguraBanco;

procedure TfrmPrincipalServidor.Abrir1Click(Sender: TObject);
begin
  if not Application.ShowMainForm then
  begin
    Application.ShowMainForm := True;
    Show;
  end;
end;

procedure TfrmPrincipalServidor.FinalizarServidor1Click(Sender: TObject);
begin
  vFinalizarServidor :=True;
  Close;
end;

procedure TfrmPrincipalServidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipalServidor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if vFinalizarServidor then
  begin
    CanClose :=True;
    Application.Terminate;
  end
  else
  begin
    CanClose :=False;
    if Application.ShowMainForm then
    begin
      Application.ShowMainForm :=False;
      Hide;
    end;
  end;
end;

procedure TfrmPrincipalServidor.FormCreate(Sender: TObject);
var
 vDiretorio, vCaminhoBanco: string;
 I: Integer;
begin
  vFinalizarServidor :=False;
  try
    vDiretorio :=ExtractFilePath(Application.ExeName);

    if vDiretorio[Length(vDiretorio)] = '\' then
      vDiretorio := Copy(vDiretorio,1,Length(vDiretorio)-1);

    repeat
      I :=Pos('\',vDiretorio);
      Delete(vDiretorio,1,I);
    until I = 0;

    TrayIcon.Hint := 'SrvControlePatrimonio - '+IntToStr(SC.DSTCPServerTransport.Port)+#13#10+
     'Em: ..\'+vDiretorio;

    //Setar caminho do Banco
    vCaminhoBanco :=Conn.Params.Values['Database'];
    TConfiguraConexao.SetArquivoINI(Conn,vCaminhoBanco);

  except
    on E: Exception do
    begin
      ShowMessage('Erro no Servidor: '+E.Message);
    end;
  end;
end;

procedure TfrmPrincipalServidor.FormShow(Sender: TObject);
begin
  Self.Caption :='Servidor em execução';
end;

end.

