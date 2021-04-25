unit ufrm1Igreja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm1Igreja = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Igreja: Tfrm1Igreja;

implementation

uses
  uSegurancaControle, uManipulacaoDados, uDataModule;

{$R *.dfm}

procedure Tfrm1Igreja.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
    begin
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Igreja | Tabela: TBL_PAST_IGREJA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Igreja | Tabela: TBL_PAST_IGREJA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Igreja.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_PAST_IGREJA_ID');
end;

procedure Tfrm1Igreja.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
