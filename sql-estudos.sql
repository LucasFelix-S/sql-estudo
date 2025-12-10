------------
-- [JOIN] --
------------
SELECT
	v.id_venda
	,v.codigo_produto
	,p.descricao_produto
	,p.status_produto
	,v.qtd_venda
	,v.valor_venda
FROM
	tbVendas v
LEFT JOIN
	tbProdutos p
	ON v.codigo_produto = p.codigo_produto

---------------------------
-- [GROUP BY] e [HAVING] --
---------------------------
SELECT
	v.codigo_produto			AS 'código do produto'
	,p.descricao_produto		AS 'descrição do produto'
	,SUM(qtd_venda)				AS 'total vendido do produto'
FROM
	tbVendas v
LEFT JOIN
	tbProdutos p
	ON v.codigo_produto = p.codigo_produto
GROUP BY
	v.codigo_produto,
	p.descricao_produto
HAVING
	SUM(qtd_venda) > 10
ORDER BY
	SUM(qtd_venda) DESC

-------------
-- [VIEWS] --
-------------
GO
CREATE VIEW vwAnaliseVendasPorProdutos AS
SELECT
	v.id_venda
	,v.codigo_produto
	,p.descricao_produto
	,p.status_produto
	,v.qtd_venda
	,v.valor_venda
FROM
	tbVendas v
LEFT JOIN
	tbProdutos p
	ON v.codigo_produto = p.codigo_produto
GO

SELECT * FROM vwAnaliseVendasPorProdutos

-----------------
-- [OPERAÇÕES] --
-----------------
SELECT 10 + 10							AS SOMA;
SELECT 10 - 10							AS SUBTRAÇÃO;
SELECT 10 * 10							AS MULTIPLICAÇÃO;
SELECT 10.5 / 10						AS DIVISÃO;
SELECT 'LUCAS ' + 'FELIX ' + 'SANTOS'	AS NOME_COMPLETO;

----------------------------------
-- [IDENTIFICAR TIPOS DE DADOS] --
----------------------------------

SELECT SQL_VARIANT_PROPERTY(10, 'BaseType');
SELECT SQL_VARIANT_PROPERTY(13.5, 'BaseType');
SELECT SQL_VARIANT_PROPERTY('LUCAS', 'BaseType');
SELECT SQL_VARIANT_PROPERTY('16/11/2025', 'BaseType'); -- ISSO RETORNA UM VARCHAR E NÃO UM DATETIME
SELECT SQL_VARIANT_PROPERTY(CAST('2025-11-16' AS DATE), 'BaseType');

-----------------
-- [CAST] --
-----------------

SELECT CAST(21.45 AS INT)
SELECT CAST(21.45 AS FLOAT)
SELECT CAST('2025-11-16' AS DATE)
SELECT 'O preço do Notebook Loq Lenovo é: ' + CAST(3.599 AS VARCHAR(20));

-----------------
-- [VARIÁVEIS] --
-----------------
DECLARE @produto VARCHAR
SET		@produto = 3

SELECT
	*
FROM
	tbProdutos
WHERE
	codigo_produto = @produto;

-----------------------
-- [ARREDONDAMENTO] --
-----------------------
SELECT ROUND(18.739130, 2)		-- ESSE 2 NO FINAL É A QUANTIDADE DE CASAS DECIMAIS QUE VOU DEIXAR PARA ARREDONDAR.
SELECT ROUND(18.739130, 2, 1)	-- ELE ARREDONDA MAS TRUNCA O VALOR
SELECT FLOOR(18.739130)			-- ARREDONDA PARA BAIXO
SELECT FLOOR(18.739130)			-- ARREDONDA PARA CIMA


-------------------
-- [SUBQUERIES] --
-------------------
SELECT
	*
FROM
	tbVendas v
WHERE
	v.valor_venda >= (SELECT AVG(valor_venda) FROM tbVendas)
ORDER BY
	v.valor_venda DESC


-- Subqueries com EXISTS
SELECT
	p.codigo_produto			AS 'código do produto'
	,p.descricao_produto		AS 'descrição do produto'
	,p.linha_produto			AS 'linha do produto'
FROM
	tbProdutos p
WHERE
	EXISTS (
			SELECT
				* 
			FROM 
				tbVendas v 
			WHERE qtd_venda > 6 
			AND v.codigo_produto = p.codigo_produto
			);