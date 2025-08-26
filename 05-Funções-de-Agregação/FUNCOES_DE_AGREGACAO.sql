-- USANDO FUNÇÕES DE AGRAGAÇÃO:
-- USO DE COMANDOS 'COUNT' 'COUNT' + 'DISTINCT', 'SUM', 'MIN' E 'MAX', 'AVG' E GROUP BY;

USE LojaCompleta;
USE BaseDeTreino;

SELECT * FROM Vendas;

-- USANDO O COMANDO 'SUM' PARA SOMAR OS VALORES DE UMA COLUNA;

SELECT
	SUM(Total) 			AS 'TOTAL_VENDIDO',
	SUM(Quantidade) 	AS 'QUANTIDADE_VENDIDA'
FROM
	Vendas;
	

SELECT
	SUM(Estoque) AS 'ESTOQUE_TOTAL'
FROM
	Produtos;
	
-- USANDO A FUNÇÃO 'COUNT' PARA CONTAR VALORES DE UMA COLUNA OU DE UMA TABELA;
	
SELECT
	COUNT(*)		AS 'TOTAL_DE_LINHAS' -- Contando a quantidade de linha da tabela toda.
FROM
	Produtos;
	

SELECT
	COUNT(VendaID)	AS 'TOTAL_DE_LINHAS' -- Contando a quantidade de linha de uma coluna específica.
FROM Vendas;
	
	
-- USANDO O COMANDO 'COUNT' QUE VAI PERMITIR FAZER A CONTAGEM DE VALORES DE UMA COLUNA OU DE UM TABELA;
SELECT
	COUNT(*)	 	AS quantidade_de_linhas_da_tabela -- Contando todos os valores da tabela inteira.
FROM
	Produtos;


SELECT
	COUNT(VendaID)	AS quantidade_de_registros_de_venda -- Contando todos os valores de uma coluna específica (VendaID).
FROM
	Vendas;

-- USANDO O COMANDO 'COUNT' COM O COMANDO 'DISTINCT' PARA RETORNAR UMA CONTAGEM DE VALORES DISTINTOS DE UMA TABELA / COLUNA;
SELECT
	COUNT(DISTINCT ProdutoID)	 	AS contagem_distinta
FROM
	Vendas;

-- USANDOS OS COMANDOS 'MIN' E 'MAX', ESSES COMANDOS VÃO RETORNAR O VALOR MÍNIMO E O VALOR MÁXIMO DE UMA COLUNA OU DA TABELA;
SELECT
	MAX(Preco)
FROM
	Produtos
	
SELECT
	MIN(Preco)
FROM
	Produtos
	
SELECT
	MAX(Preco)			AS valor_preco_maximo
	,MIN(Preco)			AS valor_preco_minimo
FROM
	Produtos

-- USANDO O COMANDO 'AVG', ESSE COMANDO EXTRAI A MÉDIA DOS VALORES DE UMA COLUNA / TABELA;
	
SELECT
	AVG(Total)			AS media_venda_total 			
FROM
	Vendas;

SELECT
	AVG(Preco)			AS media_preco_produtos
FROM
	Produtos
	

SELECT
	AVG(Estoque)			AS media_estoque_produtos
FROM
	Produtos

	








	
	
	