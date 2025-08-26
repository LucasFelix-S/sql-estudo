USE LojaCompleta;
-- AULAS DE INTRODUÇÃO -- 
-- COMANDOS SELECT

-- SELECIONANDO TODA A TABELA DE CLIENTES;
SELECT * FROM Clientes;

-- SELECIONANDO TODA A TABELA DE PRODUTOS;
SELECT * FROM Produtos;

-- SELECIONANDO TODA A TABELA DE VENDAS;
SELECT * FROM Vendas;

-- FAZENDO UM SELECT MAIS AVANÇADO, SELECIONANDO E RENOMEANDO DETERMINADAS COLUNAS E FILTRANDO OS RESULTADOS COM 'WHERE';
SELECT
	VendaID 	as venda,
	Quantidade  as qtd,
	DataVenda   as data,
	Total 		as total
FROM 
	Vendas
WHERE
	VendaID = 1;

-- RETORNANDO APENAS ALGUMAS LINHAS DA TABELA USANDO O COMANDO 'TOP(quantidade de linhas);
SELECT TOP(5)
	VendaID 	as venda,
	Quantidade  as qtd,
	DataVenda   as data,
	Total 		as total
FROM 
	Vendas

-- RETORNANDO APENAS UM PERCENTUAL DA TABELA USANDO O COMANDO 'PERCENT';
SELECT TOP(3) PERCENT
	VendaID 	as venda,
	Quantidade  as qtd,
	DataVenda   as data,
	Total 		as total
FROM
	Vendas
	
-- RETORNANDO VALORES DISTINTOS DE UMA TABELA COM O COMANDO 'SELECT DISTINCT';
SELECT
	DISTINCT ProdutoID as cd_produto
FROM 
	Vendas
	
-- COMANDO 'AS': Renomeando as colunas (aliasing)
SELECT
	VendaID		AS num_venda,
	ProdutoID 	AS cd_produto,
	Quantidade 	AS qtd_vendas,
	Total 		AS Total
FROM
	Vendas

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-+*-