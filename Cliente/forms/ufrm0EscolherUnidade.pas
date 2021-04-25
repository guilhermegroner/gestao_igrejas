unit ufrm0EscolherUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, JvExControls,
  JvGradientHeaderPanel, AdvGlowButton, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Data.DB, Datasnap.DBClient;

const
  SqlBuscaUnidades = 'SELECT U.ID, U.NOME FROM TBL_UNIDADE U'     +
    ' INNER JOIN TBL_USUARIO_UNIDADE UU ON (UU.ID_UNIDADE = U.ID)'+
    ' WHERE UU.ID_USUARIO = %d';

type
  Tfrm0EscolherUnidade = class(Tfrm0Default)
    pnlFundo: TPanel;
    pnlBotton: TPanel;
    lblAvisoCampoRequerido: TLabel;
    btnSelecionar: TAdvGlowButton;
    hdrTitulo: TJvGradientHeaderPanel;
    lcbUnidade: TDBLookupComboBox;
    cdsUnidade: TClientDataSet;
    dsUnidade: TDataSource;
    cdsUnidadeID: TIntegerField;
    cdsUnidadeNOME: TStringField;
    lblUnidade: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure lcbUnidadeKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetUnidades;
  public
    { Public declarations }
  end;

var
  frm0EscolherUnidade: Tfrm0EscolherUnidade;

implementation

uses
  uManipulacaoDados, uDataModule;

{$R *.dfm}

procedure Tfrm0EscolherUnidade.btnSelecionarClick(Sender: TObject);
begin
  if lcbUnidade.KeyValue<>Null then
  begin
    DM.IdUnidade :=lcbUnidade.KeyValue;
    DM.Unidade :=lcbUnidade.Text;

    ModalResult :=mrOk;
  end else
  begin
    Application.MessageBox('Selecione uma Unidade.','Atenção',MB_OK+MB_ICONWARNING);
    lcbUnidade.SetFocus;
  end;
end;

procedure Tfrm0EscolherUnidade.FormCreate(Sender: TObject);
begin
  cdsUnidade.CreateDataSet;
end;

procedure Tfrm0EscolherUnidade.FormShow(Sender: TObject);
begin
  Self.ModalResult :=mrNone;
  Self.Caption :='Geek Software';
  SetUnidades;
end;

procedure Tfrm0EscolherUnidade.lcbUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSelecionarClick(Sender);
end;

procedure Tfrm0EscolherUnidade.SetUnidades;
begin
  try
    cdsUnidade.EmptyDataSet;

    TManipulacaoDados.PopulaDataSet(cdsUnidade, Format(SqlBuscaUnidades,[DM.IdUsuario]));
    lcbUnidade.KeyField  :=cdsUnidade.Fields[0].FieldName;
    lcbUnidade.ListField :=cdsUnidade.Fields[1].FieldName;
    TManipulacaoDados.OrdenaDataSet(cdsUnidade, 'NOME', oAscendente);
    cdsUnidade.Open;

    if cdsUnidade.RecordCount=1 then
    begin
      lcbUnidade.KeyValue :=cdsUnidade.Fields[0].AsInteger;
      lcbUnidade.Enabled :=False;
      btnSelecionar.SetFocus;
    end
    else
    begin
      lcbUnidade.Enabled :=True;
      lcbUnidade.SetFocus;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível logar no sistema!'+sLineBreak+'Erro: '+E.Message),
        'Atenção!',mb_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  end;
end;

end.
