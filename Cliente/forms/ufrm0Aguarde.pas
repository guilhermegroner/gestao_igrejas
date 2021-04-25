unit ufrm0Aguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, JvExExtCtrls, JvShape;

type
  Tfrm0Aguarde = class(TForm)
    imgFundo: TImage;
    lblMensagem: TAdvSmoothLabel;
    ShapeFundo: TJvShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm0Aguarde: Tfrm0Aguarde;

procedure CriarTelaAguarde(vMensagem: string);
procedure FecharTelaAguarde;

implementation

{$R *.dfm}

procedure CriarTelaAguarde(vMensagem: string);
begin
  if frm0Aguarde=nil then
    frm0Aguarde :=Tfrm0Aguarde.Create(nil);

  if vMensagem =EmptyStr then
    frm0Aguarde.lblMensagem.Caption.Text :='Aguarde...'
  else
    frm0Aguarde.lblMensagem.Caption.Text :=vMensagem;

  frm0Aguarde.Show;
  frm0Aguarde.Refresh;
end;

procedure FecharTelaAguarde;
begin
 if Assigned(frm0Aguarde) then
  FreeAndNil(frm0Aguarde);
end;

end.
