unit uSegurancaControle;

interface

uses System.SysUtils, IdHashMessageDigest, uDataModule, uCC, Vcl.Forms, Winapi.Windows;

const
  //Niveis de Log
  nlBaixo=1;
  nlNormal=2;
  nlAlto=3;

type

 TSegurancaControle = class
  public
    class function EncriptaMD5(const pValor: string): string;
    class procedure GravaLog(pNivel, pIdUsuario, pIdUnidade: Integer; pDescricao: string);
    class function GetVersaoSistema:string;
 end;

implementation


{ TSegurancaControle }

class function TSegurancaControle.EncriptaMD5(const pValor: string): string;
var
  vIdMD5: TIdHashMessageDigest5;
begin
  vIdMD5 :=TIdHashMessageDigest5.Create;
  try
    Result :=vIdMD5.HashStringAsHex(pValor);
  finally
    FreeAndNil(vIdMD5);
  end;
end;

class function TSegurancaControle.GetVersaoSistema: string;
var
  VerInfoSize, Dummy, VerValueSize: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
  v1, v2, v3, v4: Word;
  vPrograma : string;
begin
  vPrograma := Application.Exename;

  VerInfoSize := GetFileVersionInfoSize(PChar(vPrograma), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(vPrograma), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);

  with VerValue^ do
  begin
    v1 := dwFileVersionMS shr 16;
    v2 := dwFileVersionMS and $FFFF;
    v3 := dwFileVersionLS shr 16;
    v4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);
  Result := Copy (IntToStr (100 + v1), 3, 2) + '.' +
    Copy (IntToStr (100 + v2), 3, 2) + '.' +
    Copy (IntToStr (100 + v3), 3, 2) + '.' +
    Copy (IntToStr (100 + v4), 3, 2);
end;

class procedure TSegurancaControle.GravaLog(pNivel, pIdUsuario, pIdUnidade: Integer; pDescricao: string);
var
  vServer: TSMClient;
begin
  try
    try
      vServer :=TSMClient.Create(DM.ConnDataSnap.DBXConnection);
      vServer.GravaLog(pNivel, pIdUsuario, pIdUnidade, pDescricao);
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

end.
