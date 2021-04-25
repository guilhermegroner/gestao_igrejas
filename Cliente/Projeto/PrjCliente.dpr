program PrjCliente;

uses
  Windows,
  SysUtils,
  MidasLib,
  Vcl.Forms,
  uManipulacaoDados in '..\units\uManipulacaoDados.pas',
  uMDIFrm in '..\units\uMDIFrm.pas',
  uRelatorios in '..\units\uRelatorios.pas',
  uSegurancaControle in '..\units\uSegurancaControle.pas',
  ufrm0Default in '..\forms\ufrm0Default.pas' {frm0Default},
  ufrm1Cadastro in '..\forms\1-Cadastros\ufrm1Cadastro.pas' {frm1Cadastro},
  ufrm0EscolherUnidade in '..\forms\ufrm0EscolherUnidade.pas' {frm0EscolherUnidade},
  ufrm0Login in '..\forms\ufrm0Login.pas' {frm0Login},
  ufrm0Sobre in '..\forms\ufrm0Sobre.pas' {frm0Sobre},
  ufrm0TelaPrincipal in '..\forms\ufrm0TelaPrincipal.pas' {frm0TelaPrincipal},
  ufrm2Manipulacao in '..\forms\2-Manipulacao\ufrm2Manipulacao.pas' {frm2Manipulacao},
  ufrm4PatrimonioImpressoes in '..\forms\4-Relatorios\ufrm4PatrimonioImpressoes.pas' {frm4PatrimonioImpressoes},
  ufrm1Categoria in '..\forms\1-Cadastros\ufrm1Categoria.pas' {frm1Categoria},
  ufrm1Fornecedor in '..\forms\1-Cadastros\ufrm1Fornecedor.pas' {frm1Fornecedor},
  ufrm1Membro in '..\forms\1-Cadastros\ufrm1Membro.pas' {frm1Membro},
  ufrm1Patrimonio in '..\forms\1-Cadastros\ufrm1Patrimonio.pas' {frm1Patrimonio},
  ufrm1Responsavel in '..\forms\1-Cadastros\ufrm1Responsavel.pas' {frm1Responsavel},
  ufrm1Setor in '..\forms\1-Cadastros\ufrm1Setor.pas' {frm1Setor},
  ufrm1Usuario in '..\forms\1-Cadastros\ufrm1Usuario.pas' {frm1Usuario},
  ufrm2BaixaPatrimonio in '..\forms\2-Manipulacao\ufrm2BaixaPatrimonio.pas' {frm2BaixaPatrimonio},
  ufrm2Categoria in '..\forms\2-Manipulacao\ufrm2Categoria.pas' {frm2Categoria},
  ufrm2Fornecedor in '..\forms\2-Manipulacao\ufrm2Fornecedor.pas' {frm2Fornecedor},
  ufrm2Membro in '..\forms\2-Manipulacao\ufrm2Membro.pas' {frm2Membro},
  ufrm2Patrimonio in '..\forms\2-Manipulacao\ufrm2Patrimonio.pas' {frm2Patrimonio},
  ufrm2Setor in '..\forms\2-Manipulacao\ufrm2Setor.pas' {frm2Setor},
  ufrm2Usuario in '..\forms\2-Manipulacao\ufrm2Usuario.pas' {frm2Usuario},
  uConsultasSql in '..\..\Comum\units\uConsultasSql.pas',
  uHelper in '..\..\Comum\units\uHelper.pas',
  uServerUtils.Data in '..\..\Comum\units\uServerUtils.Data.pas',
  ufrm3Log in '..\forms\3-Consulta\ufrm3Log.pas' {frm3Log},
  ufrm2Unidade in '..\forms\2-Manipulacao\ufrm2Unidade.pas' {frm2Unidade},
  ufrm1Unidade in '..\forms\1-Cadastros\ufrm1Unidade.pas' {frm1Unidade},
  ufrm0Aguarde in '..\forms\ufrm0Aguarde.pas' {frm0Aguarde},
  ufrm0TrocarSenha in '..\forms\ufrm0TrocarSenha.pas' {frm0TrocarSenha},
  uFiltros in '..\units\uFiltros.pas',
  uCC in 'uCC.pas',
  ufrm2TransferenciaPatrimonio in '..\forms\2-Manipulacao\ufrm2TransferenciaPatrimonio.pas' {frm2TransferenciaPatrimonio},
  ufrm2Grupo in '..\forms\2-Manipulacao\ufrm2Grupo.pas' {frm2Grupo},
  ufrm1Grupo in '..\forms\1-Cadastros\ufrm1Grupo.pas' {frm1Grupo},
  ufrm2Pastor in '..\forms\2-Manipulacao\ufrm2Pastor.pas' {frm2Pastor},
  ufrm1Pastor in '..\forms\1-Cadastros\ufrm1Pastor.pas' {frm1Pastor},
  ufrm1Igreja in '..\forms\1-Cadastros\ufrm1Igreja.pas' {frm1Igreja},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  ufrm4PastoralImpressoes in '..\forms\4-Relatorios\ufrm4PastoralImpressoes.pas' {frm4PastoralImpressoes},
  ufrm0Consulta in '..\forms\ufrm0Consulta.pas' {frm0Consulta},
  ufrm1Profissao in '..\forms\1-Cadastros\ufrm1Profissao.pas' {frm1Profissao},
  ufrm1Cidade in '..\forms\1-Cadastros\ufrm1Cidade.pas' {frm1Cidade},
  ufrm1Funcao in '..\forms\1-Cadastros\ufrm1Funcao.pas' {frm1Funcao},
  ufrm1UnidadeMedida in '..\forms\1-Cadastros\ufrm1UnidadeMedida.pas' {frm1UnidadeMedida},
  ufrm1GrupoEstoque in '..\forms\1-Cadastros\ufrm1GrupoEstoque.pas' {frm1GrupoEstoque},
  ufrm1ProdutoEstoque in '..\forms\1-Cadastros\ufrm1ProdutoEstoque.pas' {frm1ProdutoEstoque},
  ufrm2EntradaEstoque in '..\forms\2-Manipulacao\ufrm2EntradaEstoque.pas' {frm2EntradaEstoque},
  ufrm1EntradaEstoque in '..\forms\1-Cadastros\ufrm1EntradaEstoque.pas' {frm1EntradaEstoque},
  ufrm1SaidaEstoque in '..\forms\1-Cadastros\ufrm1SaidaEstoque.pas' {frm1SaidaEstoque},
  ufrm2SaidaEstoque in '..\forms\2-Manipulacao\ufrm2SaidaEstoque.pas' {frm2SaidaEstoque},
  ufrm4Estoque in '..\forms\4-Relatorios\ufrm4Estoque.pas' {frm4Estoque};

{$R *.res}

var
 MutexHandle: THandle;
 hwind:HWND;
begin
  //Verificar se a aplicação já esta aberta(caso esteja não tentar abrir novamente)
  MutexHandle := CreateMutex(nil, True, 'GS - Gestão empresarial');
  if MutexHandle <> 0 then
  begin
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      CloseHandle(MutexHandle);
      hwind:=0;

      repeat
        hwind:=Windows.FindWindowEx(0,hwind,'TApplication','GS - Gestão empresarial');
      until (hwind<>Application.Handle);

      if (hwind<>0) then
      begin
        Windows.ShowWindow(hwind,SW_SHOWNORMAL);
        Windows.SetForegroundWindow(hwind);
      end;
      Halt;
    end
  end;

  Application.Initialize;
  Application.Title := 'Geek Software - Gestão Empresarial';

  //Data Module
  Application.CreateForm(TDM, DM);
  //Tela principal
  Application.CreateForm(Tfrm0TelaPrincipal, frm0TelaPrincipal);

  Application.Run;
  ReportMemoryLeaksOnShutdown :=DebugHook <> 0;
end.
