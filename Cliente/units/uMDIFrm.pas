unit uMDIFrm;

interface

uses Vcl.Forms, cxPC, System.SysUtils;

type
  TMDIFrmUtil = class
  private

  public
    class function FormularioAberto(pPagina:TcxPageControl;TfrmClass:TFormClass):Boolean;
    // Procura a instancia passada, retorna a instancia se encontrado e nil caso contrario
    class function FindMDIChild(TfrmClass:TFormClass): TForm; overload;
    class function FindMDIChild(TfrmClass:TFormClass; Var reference) : Boolean; overload;
    // Reexibe uma instancia existente, ou cria uma nova instancia
    class procedure ShowMDIChild(pPagina:TcxPageControl;TfrmClass:TFormClass;var reference); overload;
    class procedure ShowMDIChild(pPagina:TcxPageControl;TfrmClass:TFormClass); overload;
  end;

implementation

{ TMDIFrmUtil }

class function TMDIFrmUtil.FindMDIChild(TfrmClass: TFormClass; var reference): Boolean;
var
  vInd:Integer;
begin
  // Procura entre as janelas filhas uma instancia da classe passada como paramentro
  Result := False;
  with Application.MainForm do
  begin
    for vInd := 0 to MDIChildCount - 1 do
    begin
      if MDIChildren[vInd] is TfrmClass then
        Result := True;
    end;
  end;
end;

class function TMDIFrmUtil.FormularioAberto(pPagina: TcxPageControl;
  TfrmClass:TFormClass): Boolean;
var
  vInd:Integer;
begin
  Result:=False;
  if (TForm(TfrmClass) <> nil) then
  begin
    for vInd := 0 to pPagina.PageCount -1 do
    begin
      if pPagina.Pages[vInd].Name = TfrmClass.ClassName then
      begin
        pPagina.ActivePageIndex:=vInd;
        Result:=True;
        Exit;
      end;
    end;
  end;
end;

class function TMDIFrmUtil.FindMDIChild(TfrmClass: TFormClass): TForm;
var
  vInd:integer;
begin
  // Procura entre as janelas filhas uma instancia da classe passada como paramentro;
  Result := nil;
  if Application.MainForm <> nil then
  begin
    with Application.MainForm do
    begin
      for vInd := 0 to MDIChildCount - 1 do
      begin
        if MDIChildren[vInd] is TfrmClass then
          Result := MDIChildren[vInd];
      end;
    end;
  end;
end;

class procedure TMDIFrmUtil.ShowMDIChild(pPagina:TcxPageControl;TfrmClass: TFormClass);
var
  vFrm:TForm;
begin
  ShowMDIChild(pPagina,TfrmClass,vFrm);
end;

class procedure TMDIFrmUtil.ShowMDIChild(pPagina:TcxPageControl;TfrmClass:TFormClass;var reference);
var
  vTabPage:TcxTabSheet;
begin
  if Application.MainForm <> nil then
  begin
    // Se encontrar a instancia, ou restaura a janela ou a manda para frente
    if FormularioAberto(pPagina,TfrmClass) then
      Exit
    else
    begin // Caso nao encontre um form ja instanciado, cria uma nova instancia
      Application.CreateForm(TfrmClass,reference);

      vTabPage :=TcxTabSheet.Create(pPagina);
      vTabPage.Name :=TfrmClass.ClassName;
      TForm(reference).Visible :=False;
      vTabPage.PageControl :=pPagina;
      vTabPage.Caption :=TForm(reference).Caption;
      TForm(reference).OnShow :=nil;
      TForm(reference).Parent :=vTabPage;
      TForm(reference).Visible :=True;
      pPagina.ActivePageIndex :=(pPagina.PageCount - 1);
    end;
  end;
end;

end.

