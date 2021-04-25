unit uManipulacaoDados;

interface
  uses Datasnap.DBClient, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, Data.DB,
    uDataModule, uCC, CheckLst, uHelper, Vcl.DBCtrls, JvDBGrid;

const
  //Ordem Cliente
  oAscendente=0;
  oDescendente=1;

type
 TManipulacaoDados = class
  public
    //Requer conexão com Provider
    class procedure Consulta(pCds: TClientDataSet; pSql: string);

    //Precisa de ter campos no Cliente e dar um Create nele
    class function PopulaDataSet(pDataset: TCustomClientDataSet; pSql: String): Boolean;

    //Para Clientes criados em tempo de execução, fields acessos pelo FieldByName
    class function GetDataDataSet(pSql: string): OleVariant;

    class function IntToBoolean(vNumero: Integer):Boolean;
    class procedure OrdenaDataSet(var pCds: TClientDataSet; pFields: Variant; pOrdem: Integer);
    class function LengthArrayVar(pArray: Variant): Integer;
    class function ValidarDataSet(pCds: TClientDataSet): Boolean;
    class procedure OrdenarGrid(var pCds: TClientDataSet; pGrid: TObject; pColumn: TColumn);
    class function RetornaID(pNomeGenerator: string): Integer;

    class function ExecuteSql(pSql: string): Boolean;

    class function ItensSelecionados(pCheckList: TCheckListBox): string;

    class function RetornaCampo(pSql: string): Variant;

    //Segurança
    class function RegistroExiste(pTabela, pCampo, pCondicao: string): Boolean;

    //Popular componentes
    class procedure PopulaCds(pCds: TClientDataSet; pLookup: TDBLookupComboBox; pOrdem: Integer; pCampoOrdem,
      pFieldKey, pFieldList, pSql: string);
 end;

  TItemCheckList = class
  private
    fCodigo: string;
    fDescricao: string;
  public
    property Codigo: string read fCodigo write fCodigo;
    property Descricao: string read fDescricao write fDescricao;
  end;

  function Consultar(pConsulta, pRetorno: string; pIndexOrdem:Integer;
                   pClasseTela: TFormClass; pTela: TForm;
                   pTabela, pChaveTabela, pCampoChave, pCaption: string): string;
implementation

uses
  ufrm0Consulta;

function Consultar(pConsulta, pRetorno: string;
  pIndexOrdem: Integer; pClasseTela: TFormClass; pTela: TForm; pTabela,
  pChaveTabela, pCampoChave, pCaption: string): string;
  var vTelaConsulta: TForm;
begin
  try
    vTelaConsulta :=Tfrm0Consulta.Create(Application, pConsulta);

    Tfrm0Consulta(vTelaConsulta).vTelaCadastro       :=pTela;
    Tfrm0Consulta(vTelaConsulta).vClasseTelaCadastro :=pClasseTela;
    Tfrm0Consulta(vTelaConsulta).vChave              :=pChaveTabela;
    Tfrm0Consulta(vTelaConsulta).vTabela             :=pTabela;
    Tfrm0Consulta(vTelaConsulta).vCampoChave         :=pCampoChave;
    Tfrm0Consulta(vTelaConsulta).vCaptionForm        :=pCaption;
    Tfrm0Consulta(vTelaConsulta).vIndicedeOrdem      :=pIndexOrdem;
    Tfrm0Consulta(vTelaConsulta).vSqlConsulta        :=pConsulta;
    Tfrm0Consulta(vTelaConsulta).vCampoRetorno       :=pRetorno;

    vTelaConsulta.ShowModal;

    if (Trim( pRetorno ) =EmptyStr) then
      Result :=Tfrm0Consulta(vTelaConsulta).vCds.FieldByName(pCampoChave).AsString
    else
    if (Tfrm0Consulta(vTelaConsulta).vResultado) then
      Result :=Tfrm0Consulta(vTelaConsulta).vCds.FieldByName(pRetorno).AsString
    else
      Result :=EmptyStr;
  finally
    FreeAndNil(vTelaConsulta);
  end;
end;

class procedure TManipulacaoDados.Consulta(pCds: TClientDataSet; pSql: string);
begin
  try
    if Trim(pSql) = '' then
      Exit;

    pCds.IndexFieldNames :=EmptyStr;
    pCds.IndexName :=EmptyStr;
    pCds.Close;
    pCds.CommandText :=pSql;
    pCds.Open;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
       'Atenção!',mb_OK + MB_ICONINFORMATION);
    end;
  end;
end;

class function TManipulacaoDados.ExecuteSql(pSql: string): Boolean;
var
  vServer: TSMClient;
begin
  if Trim(pSql) =EmptyStr then
  begin
    Result :=False;
    Exit;
  end;

  try
    try
      vServer :=TSMClient.Create(DM.ConnDataSnap.DBXConnection);
      Result :=vServer.ExecuteSql(pSql);
    finally
      FreeAndNil(vServer);
    end;
  except
    on E: Exception do
    begin
      Result :=False;
    end;
  end;
end;

class function TManipulacaoDados.GetDataDataSet(pSql: string): OleVariant;
var
  vServer: TSMClient;
begin
  if Trim(pSql) =EmptyStr then
  begin
    Exit;
  end;

  try
    try
      vServer :=TSMClient.Create(DM.ConnDataSnap.DBXConnection);
      Result :=vServer.GetDataDataSet(pSql);
    finally
      FreeAndNil(vServer);
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
       'Atenção!',mb_OK + MB_ICONINFORMATION);
    end;
  end;

end;

class function TManipulacaoDados.IntToBoolean(vNumero: Integer): Boolean;
begin
  Result :=vNumero = 1;
end;

class function TManipulacaoDados.ItensSelecionados(pCheckList: TCheckListBox): string;
//var
//  vI: Integer;
//  vObj: TObject;
begin
//  Result :=EmptyStr;
//  try
//    for vI := 0 to pCheckList.Count - 1 do
//    begin
//      if pCheckList.Checked[vI] then
//      begin
//        vObj := pCheckList.getObject(vI);
//
//        vObj.ClassName;
//
//        if (vObj is TItemCheckList) then
//        begin
//          if Result =EmptyStr then
//            Result := QuotedStr(TItemCheckList(vObj).Codigo)
//          else
//            Result := Result + ',' +QuotedStr(TItemCheckList(vObj).Codigo);
//        end
//        else
//        if (vObj is TItem) then
//        begin
//          if Result =EmptyStr then
//            Result := QuotedStr(IntToStr(TItem(vObj).Codigo))
//          else
//            Result := Result + ',' +QuotedStr(IntToStr(TItem(vObj).Codigo));
//        end;
//      end;
//    end;
//
//    if Result =EmptyStr then
//      Result := ' IS NOT NULL '
//    else
//      Result := ' IN ('+Result+') ';
//  except
//    on E: Exception do
//    begin
//      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
//       'Atenção!',mb_OK + MB_ICONINFORMATION);
//      Result :=' IS NOT NULL '
//    end;
//  end;
end;

class function TManipulacaoDados.LengthArrayVar(pArray: Variant): Integer;
begin
  Result :=0;

  if VarIsArray(pArray) then
  begin
    Result :=VarArrayHighBound(pArray,1) - VarArrayLowBound(pArray,1) + 1;
  end;
end;

class procedure TManipulacaoDados.OrdenaDataSet(var pCds: TClientDataSet; pFields: Variant; pOrdem: Integer);
var
  vI: Integer;
  vFields: string;
  vIdOptions : TIndexOptions;
begin
  try
    while pCds.IndexDefs.Count > 0 do
      pCds.IndexDefs.Delete(0);

    if (pCds.IndexFieldCount > 0) and (pCds.IndexName <> '') then
    begin
      pCds.DeleteIndex(pCds.IndexName);
    end;

    vFields :=EmptyStr;

    if VarIsArray(pFields) then
    begin
      for vI := 0 to LengthArrayVar(pFields) -1 do
      begin
        if vFields = EmptyStr then
          vFields := pFields[vI]
        else
          vFields := vFields + ';' + pFields[vI];
      end;
    end
    else
    if VarIsStr(pFields) then
    begin
      vFields := VarToStr(pFields);
    end;

    if vFields <> '' then
    begin
      vIdOptions := [];

      if pOrdem = oDescendente then
        vIdOptions := [ixDescending];

      pCds.FieldDefs.Update;
      pCds.AddIndex('IDX_ORDEM',vFields,vIdOptions);
      pCds.IndexName := 'IDX_ORDEM';
      pCds.FieldDefs.Update;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message),
       'Atenção!',mb_OK + MB_ICONINFORMATION);
    end;
  end;
end;

class procedure TManipulacaoDados.OrdenarGrid(var pCds: TClientDataSet; pGrid: TObject; pColumn: TColumn);
const
  idxDefault = 'DEFAULT_ORDER';
var
  vStrColumn : string;
  vI         : Integer;
  vBolUsed   : Boolean;
  vIdOptions : TIndexOptions;
begin
  vStrColumn :=idxDefault;
  vIdOptions :=[];

  if pColumn.Field.FieldKind in [fkCalculated, fkLookup, fkAggregate] then Exit;
  if pColumn.Field.DataType in [ftBlob, ftMemo] then Exit;

  if pGrid is TJvDBGrid then
  begin
    for vI := 0 to TJvDBGrid(pGrid).Columns.Count - 1 do
      TJvDBGrid(pGrid).Columns[vI].Title.Font.Style :=[];

    TJvDBGrid(pGrid).Columns[pColumn.Index].Title.Font.Style :=[fsBold];
  end
  else
  if pGrid is TDBGrid then
  begin
    for vI := 0 to TDBGrid(pGrid).Columns.Count - 1 do
      TDBGrid(pGrid).Columns[vI].Title.Font.Style :=[];

    TDBGrid(pGrid).Columns[pColumn.Index].Title.Font.Style :=[fsBold];
  end;

  vBolUsed :=(pColumn.Field.FieldName = pCds.IndexName);

  pCds.IndexDefs.Update;
  for vI := 0 to pCds.IndexDefs.Count - 1 do
  begin
    if pCds.IndexDefs.Items[vI].Name = pColumn.Field.FieldName then
    begin
      vStrColumn := pColumn.Field.FieldName;

      if pCds.IndexDefs.Items[vI].Options = [ixDescending] then
        vIdOptions :=[]
      else
        vIdOptions :=[ixDescending];
    end;
  end;

  if (vStrColumn = idxDefault) or (vBolUsed) then
  begin
    if vBolUsed then
      pCds.DeleteIndex(pColumn.Field.FieldName);
    try
      pCds.AddIndex(pColumn.Field.FieldName, pColumn.Field.FieldName, vIdOptions);

      vStrColumn := pColumn.Field.FieldName;
    except
      if vBolUsed then
        vStrColumn :=idxDefault;
    end;
  end;

  try
    pCds.IndexName :=vStrColumn;
  except
    pCds.IndexName :=idxDefault;
  end;
end;

class procedure TManipulacaoDados.PopulaCds(pCds: TClientDataSet; pLookup: TDBLookupComboBox; pOrdem: Integer;
 pCampoOrdem, pFieldKey, pFieldList, pSql: string);
begin
  pCds.IndexName :=EmptyStr;
  pCds.IndexFieldNames :=EmptyStr;

  pCds.Data := GetDataDataSet(pSql);
  pLookup.KeyField  :=pFieldKey;
  pLookup.ListField :=pFieldList;
  OrdenaDataSet(pCds, pCampoOrdem, pOrdem);
end;

class function TManipulacaoDados.PopulaDataSet(pDataset: TCustomClientDataSet; pSql: String): Boolean;
var
 vCDS: TClientDataSet;
 vI: Integer;
 vServer: TSMClient;
begin
  try
    try
      if (Trim(pSql) =EmptyStr) or (not (pDataset is TClientDataSet)) then
      begin
        Result :=False;
        Exit;
      end;

      vServer :=TSMClient.Create(DM.ConnDataSnap.DBXConnection);
      vCDS :=TClientDataSet.Create(nil);

      vCDS.Data :=vServer.GetDataDataSet(pSql);

      vCDS.First;
      if vCDS.FieldCount = 0 then
        Exit;

      while not vCDS.Eof do
      begin
        (pDataset as TClientDataSet).Insert;

        for vI:= 0 to vCDS.FieldCount - 1 do
          (pDataset as TClientDataSet).FieldByName(vCDS.Fields[vI].FieldName).Value :=vCDS.Fields[vI].Value;

       (pDataset as TClientDataSet).Post;
        vCDS.Next;
      end;

    finally
      FreeAndNil(vCDS);
      FreeAndNil(vServer);
    end;
  except
    on E: Exception do
    begin
      Result :=False;
    end;
  end;
end;

class function TManipulacaoDados.RegistroExiste(pTabela, pCampo, pCondicao: string): Boolean;
var
 vServer: TSMClient;
begin
  vServer := TSMClient.Create(DM.ConnDataSnap.DBXConnection);
  try
    Result :=vServer.RegistroExiste(pTabela, pCampo, pCondicao);
  finally
    FreeAndNil(vServer);
  end;
end;

class function TManipulacaoDados.RetornaCampo(pSql: string): Variant;
var
  vDataSet: TClientDataSet;
  vValorArray: array of Byte;
  vI: Integer;
begin
  Result :=EmptyStr;

  vDataSet :=TClientDataSet.Create(nil);
  try
    vDataSet.Data :=GetDataDataSet(pSql);

    if vDataSet.FieldCount =0 then
      Exit;

    if VarIsArray(vDataSet.Fields[0].Value) then
    begin
      vValorArray :=vDataSet.Fields[0].Value;

      for vI := 0 to Length(vValorArray)-1 do
      begin
        Result :=Result+Char(vValorArray[vI]);
      end;
    end
    else
      Result :=vDataSet.Fields[0].Value;

    if Result =Null then
      Result :=EmptyStr;
  finally
    FreeAndNil(vDataSet);
  end;
end;

class function TManipulacaoDados.RetornaID(pNomeGenerator: string): Integer;
var
 vServer: TSMClient;
begin
  vServer := TSMClient.Create(DM.ConnDataSnap.DBXConnection);
  try
    Result :=vServer.RetornaID(pNomeGenerator);
  finally
    FreeAndNil(vServer);
  end;
end;

class function TManipulacaoDados.ValidarDataSet(pCds: TClientDataSet): Boolean;
var
 vI: Integer;
 vMensagem: string;
begin
  Result :=True;
  try
    for vI := 0 to pCds.FieldCount - 1 do
    begin
      if ((pCds.Fields[vI].IsNull) or (pCds.Fields[vI].AsString = EmptyStr)) and
         pCds.Fields[vI].Required then
      begin
        Result := False;
        vMensagem := 'O Campo "'+pCds.Fields[vI].DisplayLabel+'" é de Preenchimento Obrigatório!';
        Application.MessageBox(PCHAR(vMensagem),'Atenção',MB_OK+MB_ICONINFORMATION);
        pCds.Fields[vI].FocusControl;
        Exit;
      end;
    end;
  except
    Result :=False;
  end;
end;

end.
