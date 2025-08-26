-- USANDO FUNÇÕES DE AGRAGAÇÃO:
-- USO DE COMANDOS ''GROUP BY', 'GROUP BY' + 'ORDER BY', 'GROUP BY' + 'WHERE', 'HAVING', 'HAVING VS. WHERE';
USE LojaCompleta;

-- UTILIZANDO O COMANDO 'GROUP BY' PARA CRIAR AGRUPAMENTOS:
SELECT 
	v.ProdutoID		AS codigo_do_produto
	,COUNT(*)		AS total_vendas
FROM
	Vendas v
GROUP BY
	v.ProdutoID
ORDER BY
	v.ProdutoID;


-- USANDO O COMANDO 'GROUP BY' COM AS DEMAIS FUNÇÕES DE AGREGAÇÃO (SUM, AVG, MAX, MIN):
SELECT * FROM VENDAS;

SELECT
	ProdutoID					AS 'código_produto'
	,SUM(Quantidade)			AS 'total_vendido'
FROM
	Vendas
GROUP BY
	ProdutoID
ORDER BY
	ProdutoID;

SELECT
	ProdutoID					AS 'código_produto'
	,AVG(Total)					AS 'media_de_vendas'
FROM
	Vendas
GROUP BY
	ProdutoID 
ORDER BY
	ProdutoID 
	
SELECT
	ProdutoID					AS 'código_produto'
	,MAX(Total)					AS 'máximo_vendido'
FROM
	Vendas
GROUP BY
	ProdutoID 
ORDER BY
	ProdutoID
	


	
	
	
	