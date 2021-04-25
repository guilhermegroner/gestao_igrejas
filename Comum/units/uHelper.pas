unit uHelper;

interface

uses CheckLst;

type
  // Helper para CheckListBox
  TCheckListBoxHelper = class Helper for TCheckListBox
  public
    function getObject(pIndex: Integer): TObject; overload;
  end;

  //Objetos Auxiliares
  TItemCheckList = class
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

{ TCheckListBoxHelper }

function TCheckListBoxHelper.getObject(pIndex: Integer): TObject;
begin
  Result :=Self.Items.Objects[pIndex];
end;

end.
