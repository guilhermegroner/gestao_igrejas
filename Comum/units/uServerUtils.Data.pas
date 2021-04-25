unit uServerUtils.Data;

interface
  uses System.SysUtils, System.DateUtils, Vcl.Forms, Winapi.Windows;
type
 TServerUtilsData = class
  public
    class function PrimeiroDiaMes(pData: TDateTime): TDateTime;
    class function UltimoDiaMes(pData: TDateTime): TDateTime; overload;
    class function UltimoDiaMes(pMes, pAno: Integer): Integer; overload;

    //Ver o que ela faz
    class function TempoEntre(pDias: Integer): string;

    class function GetNomeMes(pMes: Integer; pShort: Boolean = False): string;

    //Ver o que ela faz
    class function ValidarHora(phora:string):Boolean;

    class function AnoBissexto(pAno: Integer): Boolean;
    class function DataToSql(pDate : TDateTime; pQuotedStr: Boolean = True; pHoras: Boolean = True): String;
 end;
implementation

class function TServerUtilsData.PrimeiroDiaMes(pData: TDateTime): TDateTime;
var
  Dia, Mes, Ano: Word;
begin
  DecodeDate(pData,Ano,Mes,Dia);

  Result :=EncodeDate(Ano,Mes,01);
end;

class function TServerUtilsData.UltimoDiaMes(pData: TDateTime): TDateTime;
var
  vUltimoDia: Integer;
begin
  case MonthOf(pData) of
    1,3,5,7,8,10,12: vUltimoDia := 31;
    4,6,9,11       : vUltimoDia := 30;
  else
    if AnoBissexto(YearOf(pData)) then
      vUltimoDia := 29
    else
      vUltimoDia := 28;
  end;

  Result := EncodeDate(YearOf(pData),MonthOf(pData),vUltimoDia);
end;

class function TServerUtilsData.AnoBissexto(pAno: Integer): Boolean;
begin
  Result := (pAno Mod 4 = 0) and ((pAno Mod 100 <> 0) or (pAno Mod 400 = 0));
end;

class function TServerUtilsData.UltimoDiaMes(pMes, pAno: Integer): Integer;
begin
  case pMes of
    1,3,5,7,8,10,12: Result := 31;
    4,6,9,11       : Result := 30;
  else
    if AnoBissexto(pAno) then
      Result := 29
    else
      Result := 28;
  end;
end;

class function TServerUtilsData.TempoEntre(pDias: Integer): string;
var
  Ano, Mes, Dia: Integer;
  exAno, exMes, exDia: string;
begin
  Ano := 0;
  Mes := 0;
  Dia := 0;

  //Anos
  while pDias >= 365 do
  begin
    Inc(Ano);
    pDias := pDias - 365;
  end;

  //Mes
  while pDias >= 30 do
  begin
    Inc(Mes);
    pDias := pDias - 30;
  end;

  //Dias
  while pDias >= 1 do
  begin
    Inc(Dia);
    pDias := pDias - 1;
  end;

  if Ano = 1 then
    exAno := '1 ano '
  else
    exAno := IntToStr(ano) + ' Anos ';

  if Mes = 1 then
    exMes := '1 Mês '
  else
    exMes := IntToStr(Mes) + ' Meses ';

  if Dia = 1 then
    exDia := '1 Dia'
  else
    exDia := IntToStr(Dia) + ' Dias ';

  if Ano > 0 then
    Result := exAno;

  if Mes > 0  then
    Result := Result + exMes;

  if Dia > 0 then
    Result := Result + exDia;
end;

class function TServerUtilsData.DataToSql(pDate: TDateTime; pQuotedStr, pHoras: Boolean): String;
var
  vAno, vMes, vDia, vHora, vMinuto, vSegundo, vMileSegundo: Word;
begin
  try
    DecodeDate(pDate, vAno, vMes, vDia);

    Result := IntToStr(vDia) + '.'+
              IntToStr(vMes) + '.'+
              IntToStr(vAno);

    DecodeTime(pDate,vHora,vMinuto,vSegundo, vMileSegundo);

    if ((vHora + vMinuto + vSegundo) > 0) and (pHoras) then
    begin
      Result := Result + ' '+
                IntToStr(vHora) + ':'+
                IntToStr(vMinuto) + ':'+
                IntToStr(vSegundo);
    end;

    if pQuotedStr then
    begin
      Result :=QuotedStr(Result);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
    end;
  end;
end;

class function TServerUtilsData.GetNomeMes(pMes: Integer; pShort: Boolean): string;
begin
  if pShort then
  begin
    case pMes of
      1 : Result := 'Jan';
      2 : Result := 'Fev';
      3 : Result := 'Mar';
      4 : Result := 'Abr';
      5 : Result := 'Mai';
      6 : Result := 'Jun';
      7 : Result := 'Jul';
      8 : Result := 'Ago';
      9 : Result := 'Set';
      10: Result := 'Out';
      11: Result := 'Nov';
      12: Result := 'Dez';
    end;
  end
  else
  begin
    case pMes of
      1 : Result := 'Janeiro';
      2 : Result := 'Fevereiro';
      3 : Result := 'Março';
      4 : Result := 'Abril';
      5 : Result := 'Maio';
      6 : Result := 'Junho';
      7 : Result := 'Julho';
      8 : Result := 'Agosto';
      9 : Result := 'Setembro';
      10: Result := 'Outubro';
      11: Result := 'Novembro';
      12: Result := 'Dezembro';
    end;
  end;
end;

class function TServerUtilsData.ValidarHora(phora: String): Boolean;
var
  Hora, Minuto, Segundo: Integer;
begin
  Result := False;

  try
    Hora := StrToInt(Copy(phora,1,Pos(':',phora)-1));
    Delete(phora,1,Pos(':',phora));

    Minuto := StrToInt(Copy(phora,1,Pos(':',phora)-1));
    Delete(phora,1,Pos(':',phora));

    Segundo := StrToInt(phora);

    if (Hora in [0..23]) and (Minuto in [0..59]) and (Segundo in [0..59]) then
      Result := True;
  except
    on E: Exception do
    begin
      raise Exception.Create('Contate o Suporte!'+sLineBreak+'Erro: '+E.Message);
      Result :=False;
    end;
  end;
end;


end.
