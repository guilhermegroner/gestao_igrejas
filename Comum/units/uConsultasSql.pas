unit uConsultasSql;

interface

const
 //Patrimonio
 cSqlTodosResponsaveisUnidade = 'SELECT ID, NOME FROM TBL_RESPONSAVEL WHERE ID_UNIDADE = %d';
 cSqlTodasCategorias ='SELECT ID, NOME FROM TBL_CATEGORIA';
 cSqlTodosMotivosTransferencia ='SELECT ID, NOME FROM TBL_MOTIVO_TRANSFERENCIA';
 cSqlTodosSetoresUnidade ='SELECT ID, NOME FROM TBL_SETOR WHERE ID_UNIDADE = %d'+' AND ATIVO = 1';
 cSqlTodosMotivosBaixa ='SELECT ID, NOME FROM TBL_PAT_MOTIVO_BAIXA';

 //Comum
 cSqlTodosUsuarios ='SELECT ID, USUARIO FROM TBL_USUARIO';
 cSqlTodosFornecedores ='SELECT ID, NOME FROM TBL_FORNECEDOR';
 cSqlTodasProfissoes ='SELECT ID, NOME FROM TBL_PROFISSAO';
 cSqlTodasFuncoes ='SELECT ID, NOME FROM TBL_FUNCAO';
 cSqlTodasCidades = 'SELECT ID, NOME FROM TBL_CIDADE';

 //Pastoral
 cSqlTodasIgrejas ='SELECT ID, NOME FROM TBL_PAST_IGREJA';
 cSqlTodosPastores ='SELECT ID, NOME FROM TBL_PAST_PASTOR';
 cSqlTodosMembros ='SELECT ID, NOME FROM TBL_PAST_MEMBRO WHERE ID_UNIDADE = %d AND SITUACAO = 1';
 cSqlTodosGruposPastoral ='SELECT ID, NOME FROM TBL_PAST_GRUPO WHERE ID_UNIDADE = %d';

 //Estoque
 cSqlTodasUnidadesMedida ='SELECT ID, NOME FROM TBL_EST_UNIDADE_MEDIDA';
 cSqlTodosGruposEstoque ='SELECT ID, NOME FROM TBL_EST_GRUPO WHERE ID_UNIDADE =%d';
 cSqlTodosProdutosEstoque ='SELECT ID, NOME FROM TBL_EST_PRODUTO WHERE ID_UNIDADE =%d';

implementation

end.
