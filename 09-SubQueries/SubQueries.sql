-- SUBQUERIES:
-- Nesse módulo vamos aprender a criar subqueries no SQL.
-- O que é uma subquery? Aplicações de subqueries, subquery aninhada, subquery correlacionada, CTE's

-- O que é uma subquery? 
	/*
	 * Uma subquery (ou subconsulta ou subselect) nada mais é do que uma consulta dentro de outra consulta. Ou seja, com uma subquery conseguimos
	 * utilizar o resultado de uma query (consulta ou select) dentro de outra consulta / SELECT.
	 * 
	 * Em resumo, uma subquery é um SELECT dentro de outro SELECT.
	 */ 

-- Onde utilizamos uma subquery? 
	/*
	* Subqueries podem ser utilizadas em 3 situações possíveis:
	* 
	* 1. Junto com o Where, funcionando como um filtro variável;
	* 2. Junto com o SELECT, como uma nova coluna na tabela;
	* 3. Junto com o FROM, como uma nova tabela.
	*
	*/

-------------------------SUBQUERY NA PRÁTICA---------------------
USE LojaCompleta;

SELECT
	AVG(Preco) 					AS 'Média de preço' 		--295.895900
FROM 
	Produtos;
	
-- Pegando todos os produtos que tem o preço maior que o preço médio de todos os produtos:
SELECT
	p.ProdutoID					AS 'Código do Produto'
	,p.Nome						AS 'Descrição do Produto'
	,p.Preco					AS 'Preço do Produto'
FROM
	Produtos p
WHERE 
	Preco >= (SELECT
				AVG(Preco)
			FROM 
				Produtos)
ORDER BY
	p.Preco
	
	
-- Pegando todas as vendas onde o ID do Cliente é 1.
SELECT
	v.VendaID
	,v.ClienteID
FROM
	Vendas v
WHERE
	ClienteID = (
		SELECT 
			c.ClienteID
		FROM
			Clientes c
		WHERE
			ClienteID = 1
	)

-- SELECIONANDO TODOS OS CLIENTES CADASTRADOS APÓS O DIA 01/05/2025 E QUE TIVERAM TEM COMPRAS REGISTRADAS NA TABELA DE VENDAS

SELECT 
	*
FROM
	Vendas
WHERE
	ClienteID IN (SELECT ClienteID FROM Clientes WHERE DataCadastro > '2025-05-01')
	







	
	
	
	
	