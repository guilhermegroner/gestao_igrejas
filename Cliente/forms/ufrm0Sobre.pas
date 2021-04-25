unit ufrm0Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, Vcl.ExtCtrls,
  Vcl.StdCtrls, dxGDIPlusClasses, JvExControls, JvGradientHeaderPanel, ShellApi;

type
  Tfrm0Sobre = class(Tfrm0Default)
    hdrTitulo: TJvGradientHeaderPanel;
    imgFundo: TImage;
    lblSite: TLabel;
    lblEmail: TLabel;
    lblContaEmail: TLabel;
    lblTelefones: TLabel;
    lblTelefone1: TLabel;
    lblLinkSite: TLabel;
    procedure lblLinkSiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm0Sobre: Tfrm0Sobre;

implementation

{$R *.dfm}

procedure Tfrm0Sobre.lblLinkSiteClick(Sender: TObject);
begin
  ShellExecute(0, Nil, PChar(lblLinkSite.Caption), Nil, Nil, 0);
end;

end.
