unit ufrm2Manipulacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrm0Default, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxClasses,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, AdvGlowButton, JvExControls, JvGradientHeaderPanel, Vcl.ExtCtrls;

type
  Tfrm2Manipulacao = class(Tfrm0Default)
    pnlTop: TPanel;
    hdrTitulo: TJvGradientHeaderPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlBotton: TPanel;
    pnlFundo: TPanel;
    pnlBotoes: TPanel;
    btnIncluir: TAdvGlowButton;
    btnEditar: TAdvGlowButton;
    btnExcluir: TAdvGlowButton;
    cxGrid: TcxGrid;
    cxGridTV1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnlFiltros: TPanel;
    pnlPaineis: TPanel;
    Acoes: TActionList;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actAtualizar: TAction;
    actFechar: TAction;
    cds: TClientDataSet;
    ds: TDataSource;
    Style: TcxStyleRepository;
    cxStyleZebrado: TcxStyle;
    actLocalizar: TAction;
    cxStyleTituloGrid: TcxStyle;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm2Manipulacao: Tfrm2Manipulacao;

implementation

{$R *.dfm}

procedure Tfrm2Manipulacao.actAtualizarExecute(Sender: TObject);
begin
;
end;

procedure Tfrm2Manipulacao.actExcluirExecute(Sender: TObject);
begin
;
end;

procedure Tfrm2Manipulacao.actFecharExecute(Sender: TObject);
begin
  FreeAndNil(Self);
end;

procedure Tfrm2Manipulacao.actIncluirExecute(Sender: TObject);
begin
;
end;

procedure Tfrm2Manipulacao.actEditarExecute(Sender: TObject);
begin
;
end;

end.
