unit ufrm1Responsavel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm1Cadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, JvExControls, JvGradientHeaderPanel,
  AdvGlowButton, Vcl.ExtCtrls, uDataModule, uManipulacaoDados, uSegurancaControle,
  JvExMask, JvToolEdit, JvDBControls;

type
  Tfrm1Responsavel = class(Tfrm1Cadastro)
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblCpf: TLabel;
    edtCpf: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblCelular: TLabel;
    DBEdit1: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    cdsID: TIntegerField;
    cdsNOME: TStringField;
    cdsCPF: TStringField;
    cdsTELEFONE: TStringField;
    cdsCELULAR: TStringField;
    cdsID_UNIDADE: TIntegerField;
    cdsENDERECO: TStringField;
    cdsENDERECO_NUMERO: TStringField;
    cdsDATA_CADASTRO: TDateField;
    cdsID_USUARIO: TIntegerField;
    cdsENDERECO_BAIRRO: TStringField;
    lblEnderecoBairro: TLabel;
    edtEnderecoBairro: TDBEdit;
    cdsSETOR: TStringField;
    cdsDATA_NOMEACAO: TDateField;
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frm1Responsavel: Tfrm1Responsavel;

implementation

{$R *.dfm}

procedure Tfrm1Responsavel.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text)=EmptyStr then
  begin
    Application.MessageBox('Preencha o campo Nome.','Atenção',MB_OK+MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if cds.State=dsInsert then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Incluído! Tela: '+
       'Cadastro de Responsável | Tabela: TBL_RESPONSAVEL | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text)
  else
  if cds.State=dsEdit then
      TSegurancaControle.GravaLog(nlBaixo, DM.IdUsuario, DM.IdUnidade, 'Registro Alterado! Tela: '+
       'Cadastro de Responsável | Tabela: TBL_RESPONSAVEL | Chave da Tabela: ID | Valor: '+IntToStr(cdsID.Value)+
       ' | Descrição: '+edtNome.Text);

  inherited;
end;

procedure Tfrm1Responsavel.cdsNewRecord(DataSet: TDataSet);
begin
  cdsID.AsInteger :=TManipulacaoDados.RetornaID('GEN_TBL_RESPONSAVEL_ID');
end;

end.
