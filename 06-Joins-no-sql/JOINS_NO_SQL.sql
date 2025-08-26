-- USO DOS JOINS (JUNÇÕES ENTRE TABELA NO SQL)
USE BaseDeTreino;
USE LojaCompleta;
USE master;

SELECT * FROM dados_itec;
SELECT * FROM dados_wms;

-- LEFT (OUTER) JOIN - TODAS AS LINHAS DA TABELA "A" (dados_itec) + A INTERSEÇÃO COM A TABELA "B" (dados_wms) 

SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_itec i
LEFT JOIN
	dados_wms w
	ON i.idProduto = w.idProdutoWms
	
-- RIGHT (OUTER) JOIN - TODAS AS LINHAS DA TABELA "B" (dados_wms) + A INTERSEÇÃO COM A TABELA "A" (dados_itec) 
	
SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_itec i
RIGHT JOIN
	dados_wms w
	ON i.idProduto = w.idProdutoWMs
	
-- INNER (OUTER) JOIN - TRAZ A INTERSEÇÃO ENTRE AS DUAS TABELAS (APENAS LINHAS CORRESPONDENTES NAS DUAS TABELAS)
	
SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_itec i
INNER JOIN
	dados_wms w
	ON i.idProduto = w.idProdutoWMs
	
	
-- FULL (OUTER) JOIN - TODAS AS LINHAS DAS DUAS TABELA (O QUE NÃO ENCONTRAR EM UMA TABELA COLOQUE O NULL)
SELECT 
	i.idProduto									AS 'codigo_produto'
	,i.dsProduto								AS 'descricao_produto'
	,i.prateleira								AS 'prateleira'
	,w.estoqueWms								AS 'estoque_wms'
	,CASE
		WHEN w.estoqueWms IS NULL THEN 0
		ELSE w.estoqueWms
	END											AS 'estoque_corrigido'
	
FROM
	dados_itec i	
FULL JOIN
	dados_wms w
	ON i.idProduto = w.idProdutoWms


-- LEFT, RIGHT, FULL (ANTI) JOIN - SÃO MAIS RARAS, MAS É BOM SABER

-- LEFT (ANTI) JOIN:
SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_itec i
LEFT JOIN
	dados_wms w
	ON i.idProduto = w.idProdutoWMs
WHERE
	w.estoqueWms IS NULL

-- RIGHT (ANTI) JOIN:
SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_wms w
RIGHT JOIN
	dados_itec i
	ON i.idProduto = w.idProdutoWMs
WHERE
	w.estoqueWms IS NULL
	
	
-- FULL (ANTI) JOIN:
SELECT 
	i.idProduto
	,i.dsProduto
	,i.prateleira
	,w.estoqueWms
FROM
	dados_wms w
RIGHT JOIN
	dados_itec i
	ON i.idProduto = w.idProdutoWMs
WHERE
	w.estoqueWms IS NULL 
	OR i.prateleira IS NULL -- NESSE CASO NÃO TEM NULOS NA TABELA DA ESQUERDA (dados_itec)
	
	
-- CROSS JOIN:
SELECT
	idProdutoWms,
	dsProduto
FROM
	dados_wms
CROSS JOIN
	dados_itec
	

SELECT * FROM Clientes;
SELECT * FROM Produtos;
SELECT * FROM Vendas;


-- MÚLTIPLOS JOINS
SELECT
	v.VendaID,
	c.Nome,
	c.Email,
	p.Nome,
	v.Quantidade
FROM
	Vendas v
LEFT JOIN
	Clientes c
	ON v.ClienteID = c.ClienteID
LEFT JOIN
	Produtos p
	ON v.ProdutoID = p.ProdutoID

-- 'UNION' E 'UNION ALL' (USAR APENAS EM TABELAS COM A MESMA ESTRUTURA).
-- 'UNION' JUNTA AS TABELAS E EXCLUIR AS LINHAS DUPLICADAS.
-- 'UNION ALL' JUNTA AS TABELAS E TRÁS AS LINHAS DUPLICADAS.
	
SELECT
	* 
FROM
	dados_itec
WHERE
	linha IN ('SIMILAR')
	
UNION ALL

SELECT
	* 
FROM
	dados_itec
WHERE
	linha IN ('ETICO')
	
-- JOIN + GROUP BY	
	
	
	
	