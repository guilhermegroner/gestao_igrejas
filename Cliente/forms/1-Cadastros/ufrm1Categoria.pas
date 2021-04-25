unit ufrm1Categoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls;

type
  Tfrm1Categoria = class(Tfrm1Cadastro)
    edtNome: TDBEdit;
    lblNome: TLabel;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm1Categoria: Tfrm1Categoria;

implementation

uses
  uManipulacaoDados, uDataModule, uSegurancaControle;

{$R *.dfm}

procedure Tfrm1Categoria.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Aten��o',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if TManipulacaoDados.RegistroExiste('TBL_CATEGORIA','NOME','NOME = '+QuotedStr(Trim(edtNome.Text))+
    ' AND ID <> '+cdsID.AsString) then
  begin
    Application.MessageBox('Categoria j� existente.','Aten��o',MB_OK+MB_ICONWARNING);
    edtNome.Clear;
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
    begin
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Inclu�do! Tela: '+
       'Cadastro de Categoria | Tabela: TBL_CATEGORIA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descri��o: '+edtNome.Text);
    end
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Categoria | Tabela: TBL_CATEGORIA | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descri��o: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Categoria.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_CATEGORIA_ID');
end;

procedure Tfrm1Categoria.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSalvarClick(Sender);
end;

end.
