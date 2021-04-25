unit ufrm1Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, AdvGlowButton,
  Vcl.ExtCtrls, JvExControls, JvGradientHeaderPanel, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, uDataModule, uManipulacaoDados;

type
  Tfrm1Cadastro = class(Tfrm0Default)
    pnlFundo: TPanel;
    pnlBotton: TPanel;
    btnSalvar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    hdrTitulo: TJvGradientHeaderPanel;
    cds: TClientDataSet;
    ds: TDataSource;
    lblAvisoCampoRequerido: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure SetUsuarioData;
  public
    { Public declarations }
  end;

var
  frm1Cadastro: Tfrm1Cadastro;

implementation

{$R *.dfm}

procedure Tfrm1Cadastro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm1Cadastro.btnSalvarClick(Sender: TObject);
begin
  SetUsuarioData;
  try
//    if TManipulacaoDados.ValidarDataSet(cds) then
//    begin
      if cds.RemoteServer <> nil then
      begin
        if cds.State in [dsInsert, dsEdit] then
         cds.Post;

        if cds.ApplyUpdates(0)=0 then
         Close;
      end
      else
       Close;
//    end
//    else
//      Abort;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure Tfrm1Cadastro.FormShow(Sender: TObject);
begin
  Self.Caption :='Geek Software';
end;

procedure Tfrm1Cadastro.SetUsuarioData;
var
  vI: Integer;
begin
  if CDS.State in [dsInsert] then
  begin
    for vI := 0 to CDS.Fields.Count - 1 do
    begin
      if (CDS.Fields[vI].FieldName = 'ID_USUARIO') then
        CDS.Fields[vI].AsInteger :=DM.IdUsuario;

      if (CDS.Fields[vI].FieldName = 'DATA_CADASTRO') then
        CDS.Fields[vI].AsDateTime :=Now;

      if (CDS.Fields[vI].FieldName = 'ID_UNIDADE') then
        CDS.Fields[vI].AsInteger :=DM.IdUnidade;
    end;
  end;
end;

end.
