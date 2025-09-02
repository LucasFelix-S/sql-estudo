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

	
-------------------------ANY, SOME e ALL---------------------
USE BaseDeTreino;

CREATE TABLE funcionarios(
id_funcionario INT,
nome VARCHAR(150),
idade INT,
sexo VARCHAR(50)
)

INSERT INTO
	funcionarios (id_funcionario, nome, idade, sexo) 
VALUES
	(1, 'Júlia', 20, 'F'),
	(2, 'Daniel', 21, 'M'),
	(3, 'Amanda', 22, 'F'),
	(4, 'Pedro', 23, 'M'),
	(5, 'Otávio', 24, 'M'),
	(6, 'Luísa', 25, 'F')
	
SELECT * FROM funcionarios

/*
 * Selecione os funcionários do sexo masculino (MAS, utilizando a coluna de IDADE para isso):
 * Usando o ANY, que equivale a qualquer, nesse contexto a qualquer um dos valores da subquerie.
 */ 


/*
 *  = ANY (valor1, valor2, valor3):
 * 	Equivalente ao IN, retorna linhas da tabela que sejam iguais ao valor1, OU valor2, OU valor3
 */

SELECT
	*
FROM
	funcionarios
WHERE
	idade = ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')
	
/*
 *  > ANY (valor1, valor2, valor3):
 * 	Retorna as linhas da tabela com valores maiores que o valor1, OU valor2, OU valor3. OU seja, maior que o mínimo.
 */
SELECT
	*
FROM
	funcionarios
WHERE
	idade > ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')

/*
 *  < ANY (valor1, valor2, valor3):
 * 	Retorna as linhas da tabela com valores menores que o valor1, OU valor2, OU valor3. Ou seja, menor que o máximo
 */
SELECT
	*
FROM
	funcionarios
WHERE
	idade < ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')

-- Podemos usar o "SOME", ele possui o mesmo efeito do ANY, mas o mais usando o "ANY"
	

/*
 *  > ALL (valor1, valor2, valor3):
 * 	Retorna as linhas da tabela contendo valores maiores que valor1, E valor2, E valor3. Ou seja, maior que o máximo
 */
SELECT
	*
FROM
	funcionarios
WHERE
	idade > ALL (SELECT idade FROM funcionarios WHERE sexo = 'M')

	
/*
 *  < ALL (valor1, valor2, valor3):
 * 	Retorna as linhas da tabela contendo valores menores que valor1, E valor2, E valor3. Ou seja, menor que o máximo
 */
SELECT
	*
FROM
	funcionarios
WHERE
	idade < ALL (SELECT idade FROM funcionarios WHERE sexo = 'M')


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	