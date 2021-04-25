unit uRelatorios;

interface

uses
  IWSystem, frxClass, System.SysUtils;

type

 TRelatorios = class
  public
    class function SetRelatorio(pReport: TfrxReport; pRelatorio: string): Boolean;
 end;

implementation

{ TRelatorios }

class function TRelatorios.SetRelatorio(pReport: TfrxReport; pRelatorio: string): Boolean;
var
  vCaminhoRelatorio: string;
begin
  Result :=False;

  vCaminhoRelatorio :=gsAppPath+'Relatórios\'+pRelatorio;
  if FileExists(vCaminhoRelatorio) then
  begin
    pReport.Clear;
    pReport.LoadFromFile(vCaminhoRelatorio);
    Result :=True;
  end;
end;

end.
