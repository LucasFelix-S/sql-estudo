-----------------------
-- [SELECTS SIMPLES] --
-----------------------
-- SELECT simples:
SELECT
	*
FROM
	tbProdutos;

-- SELECT com SUM:
SELECT 
	SUM(qtd_venda)		AS 'valor total da venda'
FROM
	tbVendas;
	
-- SELECT com AVG:
SELECT 
	AVG(qtd_venda)		AS 'valor total da venda'
FROM
	tbVendas;

-- SELECT com LIKE:
SELECT
	*
FROM
	tbProdutos 
WHERE
	descricao_produto LIKE ('%Bermuda%');

-- SELECT com BETWEEN:
SELECT 
	*
FROM
	tbVendas
WHERE
	valor_venda
	BETWEEN 100 AND 500;

-- SELECT com COUNT:
SELECT
	COUNT(*)
FROM
	tbProdutos;

-- SELECT com DISTINCT COUNT:
SELECT
	DISTINCT COUNT(*)
FROM
	tbProdutos
WHERE 
	linha_produto = 'Calçados';

-- SELECT com WHERE:
SELECT
	*
FROM
	tbProdutos
WHERE
	linha_produto = 'Medicamento';

-- SELECT com WHERE e AND:
SELECT
	*
FROM
	tbProdutos
WHERE
	linha_produto = 'Medicamento'
	AND status_produto = 'Ativo'
	
-- SELECT com WHERE e NOT:
SELECT
	*
FROM
	tbProdutos
WHERE
	NOT linha_produto = 'Medicamento';

-- SELECT com WHERE e OR:
SELECT
	*
FROM
	tbProdutos
WHERE
	linha_produto = 'Medicamento'
	OR linha_produto = 'Calçados';

-- SELECT com WHERE e IN:
SELECT
	*
FROM
	tbProdutos
WHERE
	linha_produto IN ('Medicamento', 'Calçados');

--------------
-- [ORDER] --
--------------
-- Ordenamento decrescente:
SELECT 
	*
FROM
	tbVendas
WHERE
	valor_venda
	BETWEEN 100 AND 500
ORDER BY
	valor_venda DESC

-- Ordenamento crescente:
SELECT 
	*
FROM
	tbVendas
WHERE
	valor_venda
	BETWEEN 100 AND 500
ORDER BY
	valor_venda ASC

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

-----------------------
-- [ARREDONDAMENTO] --
-----------------------
SELECT ROUND(18.739130, 2)		-- ESSE 2 NO FINAL É A QUANTIDADE DE CASAS DECIMAIS QUE VOU DEIXAR PARA ARREDONDAR.
SELECT ROUND(18.739130, 2, 1)	-- ELE ARREDONDA MAS TRUNCA O VALOR
SELECT FLOOR(18.739130)			-- ARREDONDA PARA BAIXO
SELECT FLOOR(18.739130)			-- ARREDONDA PARA CIMA

------------
-- [JOIN] --
------------
-- Conceito dos JOINS
-- LEFT JOIN: Tudo da tabela da esquerda, o que não houver correspondência na tabela da direita retorna Null
-- INNER JOIN: Retorna apenas as correspondências entre as duas tabelas
-- RIGHT JOIN: Tudo da tabela da direita o que não houver correspondência na tabela da esquerda retorna Null

-- LEFT JOIN:
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

------------
-- [CASE] --
------------
SELECT
	v.codigo_produto		AS 'código do produto'
	,p.descricao_produto	AS 'descrição do produto'
	,CASE
		WHEN p.status_produto = 'Inativo' THEN 'inativo para compra e venda'
		ELSE 'ativo para compra e venda'
	END						AS 'situação de compra e venda'
	,p.status_produto		AS 'status do produto'
	,v.qtd_venda			AS 'quantidade da venda'
	,v.valor_venda			AS 'valor da venda'
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
-- CRIANDO uma VIEW:
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

-- ALTERANDO uma VIEW:
GO
ALTER VIEW vwAnaliseVendasPorProdutos AS
SELECT
	v.id_venda
	,v.codigo_produto
	,p.descricao_produto
	,v.qtd_venda
	,v.valor_venda
FROM
	tbVendas v
LEFT JOIN
	tbProdutos p
	ON v.codigo_produto = p.codigo_produto
GO

SELECT * FROM vwAnaliseVendasPorProdutos

-- APAGANDO uma VIEW:
DROP VIEW vwAnaliseVendasPorProdutos

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


-- Subqueries com EXISTS:
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

-- Subquery aninhada (uma subquery dentro de outra):
SELECT
	erp.codigo_produto
	,p.descricao_produto
	,erp.estoque_erp
FROM
	tbEstoqueProdutoERP erp
LEFT JOIN
	tbProdutos p
	ON p.codigo_produto = erp.codigo_produto
WHERE
	estoque_erp = (
		SELECT
			MAX(estoque_erp)
		FROM
			tbEstoqueProdutoERP
		WHERE estoque_erp < (
			SELECT
				MAX(estoque_erp)
			FROM
				tbEstoqueProdutoERP
		)
	)

-----------
-- [CTE] --
-----------
-- Commom Table Expression:
WITH cte AS (
SELECT
	codigo_produto
	,descricao_produto
	,status_produto
FROM 
	tbProdutos
WHERE
	linha_produto = 'Calçados'
)

SELECT
	COUNT(*) AS 'linhas da CTE'
FROM 
	cte;

-- CTE, Calculando agregações:
WITH AgregadoPorLinha AS (
SELECT
	linha_produto
	,COUNT(*)		AS 'total'
FROM
	tbProdutos
GROUP BY
	linha_produto
)

SELECT AVG(total) AS 'total' FROM AgregadoPorLinha;

-- CTE, Nomeando colunas de uma CTE na declaração dela:
WITH VendasPorLinha(CdProduto, DsProduto, LnProduto, TotalVenda) AS (
SELECT
	v.codigo_produto
	,p.descricao_produto
	,p.linha_produto
	,SUM(v.valor_venda)
FROM
	tbVendas v
LEFT JOIN
	tbProdutos p
	ON v.codigo_produto = p.codigo_produto
GROUP BY
	v.codigo_produto
	,p.descricao_produto
	,p.linha_produto
)

SELECT * FROM VendasPorLinha;

-- CTE, Criando múltiplas CTE's e realizando um JOIN com CTE's:
WITH DadosProdutos AS (
SELECT
	codigo_produto
	,descricao_produto
FROM
	tbProdutos
),
VendasTop10 AS (
SELECT
	codigo_produto
	,SUM(valor_venda)	AS 'total vendido R$'
FROM
	tbVendas
GROUP BY
	codigo_produto
)

SELECT 
	v.codigo_produto
	,p.descricao_produto
	,v.[total vendido R$]
FROM
	VendasTop10 v
LEFT JOIN
	DadosProdutos p
	ON v.codigo_produto = p.codigo_produto
ORDER BY
	v.[total vendido R$] DESC

-------------
-- [LOOPS] --
-------------
-- WHILE, BREAK e CONTINUE

-- WHILE:
DECLARE @variavel INT
SET @variavel = 1

WHILE @variavel <= 10
BEGIN
	PRINT 'O valor do contador é: ' + CAST(@variavel AS VARCHAR)
	SET @variavel = @variavel + 1
END

-- BREAK:
DECLARE @vContador INT
SET @vContador = 1

WHILE @vContador <= 100
BEGIN
	PRINT 'O valor do contador é: ' + CAST(@vContador AS VARCHAR)
	IF @vContador = 15
	BREAK
	SET @vContador += 1
END

-- CONTINUE:
DECLARE @varContador INT
SET @varContador = 0

WHILE @varContador < 10
BEGIN
	SET @varContador += 1
	IF @varContador = 3 OR @varContador = 6
	CONTINUE
	PRINT 'O valor do contador é: ' + CAST(@varContador AS VARCHAR)
END

------------------------
-- [WINDOW FUNCTIONS] --
------------------------

-- Usando o comando OVER para saber o total vendido:
SELECT 
	ID_Loja
	,NomeLoja
	,Regiao
	,Qtd_Vendida
	,SUM(Qtd_Vendida) OVER() AS 'total vendido'
FROM  
	Lojas
ORDER BY
	ID_Loja ASC

-- Usando o comando OVER + PARTITION BY para saber o total vendido por região:
SELECT 
	ID_Loja
	,NomeLoja
	,Regiao
	,Qtd_Vendida
	,SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'total vendido'
FROM  
	Lojas
ORDER BY
	ID_Loja ASC

-- Usando o comando OVER para saber o total de lojas:
SELECT
	ID_Loja
	,NomeLoja
	,Regiao
	,Qtd_Vendida
	,COUNT(*) OVER() AS 'Qtd. Lojas'
FROM
	Lojas
ORDER BY
	ID_Loja ASC

-- Usando o comando OVER + PARTITION BY para saber o total de lojas por região:
SELECT
	ID_Loja
	,NomeLoja
	,Regiao
	,Qtd_Vendida
	,COUNT(*) OVER(PARTITION BY Regiao) AS 'Qtd. Lojas'
FROM
	Lojas
ORDER BY
	ID_Loja ASC