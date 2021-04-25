unit uServerUtils.DsServer;

interface

uses DsServer, Classes;

type
  TMyDsServerClass = class(TDSServerClass)
  private
    FoRegisterClass: TPersistentClass;
  protected
    procedure OnRegisterClass(DSServerClass: TDSServerClass;
                              var PersistentClass: TPersistentClass);

  public
    constructor Create(AOwner: TComponent); override;

    property RegisterClass: TPersistentClass read FoRegisterClass write FoRegisterClass;
  end;

implementation

{ MyDsServerClass }

constructor TMyDsServerClass.Create(AOwner: TComponent);
begin
  inherited;
  OnGetClass := OnRegisterClass;
end;

procedure TMyDsServerClass.OnRegisterClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := RegisterClass;
end;

end.

