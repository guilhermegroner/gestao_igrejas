unit ufrm1Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Data.DB,
  Datasnap.DBClient, JvExControls, JvGradientHeaderPanel, AdvGlowButton,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm1Cidade = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsUF: TStringField;
    cbbUF: TDBComboBox;
    lblUF: TLabel;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Cidade: Tfrm1Cidade;

implementation

uses
  uDataModule, uSegurancaControle, uManipulacaoDados;

{$R *.dfm}

procedure Tfrm1Cidade.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Aten??o',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
    begin
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Inclu?do! Tela: '+
       'Cadastro de Cidade | Tabela: TBL_CIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descri??o: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Cidade | Tabela: TBL_CIDADE | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descri??o: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Cidade.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_CIDADE_ID');
end;

procedure Tfrm1Cidade.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
