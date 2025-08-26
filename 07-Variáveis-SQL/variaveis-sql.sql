-- NESSE MÓDULO VAMOS APRENDER A USAR VARIÁVEIS NO SQL Server
-- VAMOS APRENDER COMANDOS COMO: 'CAST' E 'FORMAT', 'ROUND', 'FLOOR' E 'CEILING', 'DECLARE' E 'SET', APLICALÇÕES DE VARIÁVEIS, 'PRINT' E VARIÁVEIS GLOBAIS.

-------------------------------TIPOS DE DADOS EM SQL--------------------------------

-- INTEIRO: INT
-- DECIMAL: FLOAT E DECIMAL (N, M)
	-- N É O NÚMERO DE DÍGITOS QUE O NÚMERO PODE TER, INCLUINDO AS CASAS DECIMAIS;
	-- M É O NÚMERO MÁXIMO DE CASAS DECIAMIS;
-- TEXTO/STRINGS: VARCHAR(N)
-- DATAS: DATETIME

-------------------------------OPERAÇÕES BÁSICAS-----------------------------------
USE BaseDeTreino;

-- imprimindo valores em tabelas sem selecionar nada:
SELECT   10 							AS 'NÚMERO';
SELECT  'LUCAS' 						AS 'NOME';
SELECT  '19/07/2025' 					AS 'DATA_DE_HOJE';

-- operações com números:
SELECT 10 + 10							AS 'SOMA';
SELECT 20 - 05 							AS 'SUBTRAÇÃO';
SELECT 31 * 40							AS 'MULTIPLICAÇÃO';
SELECT 431.0 / 23						AS 'DIVISÃO';

-- operações com texto:
SELECT 'LUCAS ' + 'FELIX ' + 'SANTOS' 	AS 'NOME_COMPLETO'

------------------------COMO IDENTIFICAR TIPOS DE DADDOS-----------------------------
SELECT   10 							AS 'NÚMERO';
SELECT 	 49.50							AS 'DECIMAL';
SELECT  'LUCAS' 						AS 'NOME';
SELECT  '19/07/2025' 					AS 'DATA_DE_HOJE';

-- usando o SQL_VARIANT_PROPERTY:
SELECT  SQL_VARIANT_PROPERTY(10, 'BaseType');
SELECT  SQL_VARIANT_PROPERTY(49.50, 'BaseType');
SELECT  SQL_VARIANT_PROPERTY('LUCAS', 'BaseType');
SELECT  SQL_VARIANT_PROPERTY('19/07/2025', 'BaseType');

------------------------------------FUNÇÃO CAST--------------------------------------
SELECT  SQL_VARIANT_PROPERTY(CAST(21.45 AS INT), 'BaseType'); -- CONVERTENDO NUMERIC PARA INT

SELECT CAST (21.45 AS INT)

SELECT CAST (21.45 AS FLOAT)

SELECT CAST (18.7 AS FLOAT)

SELECT CAST ('15.6' AS FLOAT)

SELECT CAST ('2021-06-20' AS DATETIME)

-- Execício 1: Crie uma consulta juntando o texto 'o preço do pastel é: ' com o valor 30.99
SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR(30))

-- Exercício 2: Adicione 1 dia à data '20/06/2021'

SELECT CAST('2021-06-20' AS DATETIME) + 1


------------------------------FUNÇÕES DE ARREDONDAMENTO-------------------------------
SELECT 10+20
SELECT 20-5
SELECT 31*40
SELECT 431.0/23

--ROUND
SELECT ROUND(18.739130, 2) -- ESSE 2 NO FINAL É A QUANTIDADE DE CASAS DECIMAIS QUE VOU DEIXAR PARA ARREDONDAR



--ROUND (Truncar)
SELECT ROUND(18.739130, 2, 1) -- ELE ARREDONDA MAS TRUNCA O VALOR


-- FLOOR
SELECT FLOOR(18.739130) -- ARREDONDA PARA BAIXO


-- CEILING
SELECT CEILING(18.739130) -- ARREDONDANDO PARA CIMA


------------------------------------VARIÁVEIS--------------------------------------
/*
 * DECLARANDO VARIÁVEIS:
 * 
 * 1) O que é uma variável?
 * Uma variável é um objeto que armazena o valor de um dado.
 * 
 * 2) Estrutura
 * DECLARE @var tipo
 * SET @var = valor
 * SELECT @var
 * 
 * Exemplo:
 * Em vez de:
 * 
 * SELECT 1000
 * SELECT 1000 * 1000
 * SELECT FORMAT(1000 * 1000, 'N')
 * 
 * Seria melhor...
 * 
 * DECLARE @numero FLOAT
 * SET @numero = 1000
 * 
 * SELECT @numero
 * SELECT @numero * @numero
 * SELECT FORMAT (@numero * @numero, N)
 * 
 * 
 * 
 */

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 23
DECLARE @idade INT
SET @idade = 23
SELECT @idade AS 'idade'

-- Exemplo 2: Declare uma variável chamada 'preço' e armazene o valor 10.89
DECLARE @preco FLOAT
SET @preco = 10.89
SELECT @preco AS 'Preço unitário do produto'

-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Lucas Felix Santos'
DECLARE @nome VARCHAR(30)
SET @nome = 'Lucas Felix Santos'
SELECT @nome AS 'Meu_nome'

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.
DECLARE @data DATETIME
SET @data = '2025-07-28'
SELECT @data


----------------------------DECLARANDO MAIS DE UMA VARIÁVEL------------------------
-- OPÇÃO 1
DECLARE @var1 INT
DECLARE @texto VARCHAR(30)
DECLARE @data DATETIME

SET @var1 								= 10
SET @texto 								= 'Um texto qualquer'
SET @data 								= '2025-07-29'


SELECT 
	@var1 								AS 'inteiro'
	,@texto 							AS 'texto'
	,@data								AS 'data'

-- OPÇÃO 2
DECLARE @var1 INT
		,@texto1 VARCHAR(30)
		,@data1 DATETIME

SET @var1 								= 55
SET @texto1 							= 'Um texto qualquer dois'
SET @data1 								= '2025-07-29'

SELECT 
	@var1								AS 'inteiro'
	,@texto1 							AS 'texto'
	,@data1								AS 'data'

-- OPÇÃO 3
-- DECLARANDO E ATRIBUINDO VALORES NA VARIÁVEL:
DECLARE @var2 INT 						= 95
		,@texto2 VARCHAR(30) 			= 'um texto qualquer três'
		,@data2 DATETIME 				= '2025-07-29'
	
SELECT 
	@var2								AS 'inteiro'
	,@texto2 							AS 'texto'
	,@data2								AS 'data'	
	
-- EXERCÍCIO 1
DECLARE @multiplicador INT
DECLARE @multiplicador2 FLOAT

SET @multiplicador				= 100
SET @multiplicador2				= 89.99
	
SELECT 
	@multiplicador * @multiplicador2	AS 'calculo'
	
	
-------------------------UTILIZANDO UMA VARIÁVEL EM UAM CONSULTA---------------------
USE LojaCompleta;

-- Exemplo 1

DECLARE @varDesconto FLOAT
SET @varDesconto = 0.10

SELECT 
	ProdutoID 							AS 'código_do_produto'
	,Nome 								AS 'descrição_do_produto'
	,Preco 								AS 'preço_do_produto'
	,Estoque 							AS 'estoque_atual'
	,Preco * (1 - @varDesconto)			AS 'preco_com_desconto'
FROM 
	Produtos

-- Exemplo 2
	
DECLARE @data DATETIME
SET @data = '2025-05-01'

SELECT 	
	ClienteID
	,Nome
	,Email
	,DataCadastro
FROM
	Clientes
WHERE
	DataCadastro >= @data

	
-------------------------ARMAZENANDO UM SELECT EM UMA VARIÁVEL---------------------
-- Exemplo 1: Crie uma variável para armazenar a quantidade total de clientes da tabela Clientes=
EXEC SP_HELP 'Clientes';
	
DECLARE @totalClientes INT
SET @totalClientes = (SELECT COUNT(ClienteID) FROM Clientes)
SELECT @totalClientes AS 'total de clientes'


	
-- Exemplo 2: Crie uma variável para armazenar a quantidade total de produtos da tabela Produtos=
DECLARE @totalProdutos INT
SET @totalProdutos = (SELECT COUNT (ProdutoID) FROM Produtos WHERE Estoque > 50)
SELECT @totalProdutos AS 'total de produtos'


-------------------------UTILIZANDO O PRINT---------------------
SELECT * FROM Produtos;
SELECT COUNT(*) FROM Produtos;

-- Exemplo 1: Printe na tela a quantidade de estoque total de todos os produtos e a quantidade de SKU.
DECLARE @totalEstoque INT, @totalSKu INT
SET @totalEstoque = (SELECT SUM(Estoque) FROM Produtos)
SET @totalSku = (SELECT DISTINCT COUNT(ProdutoID) FROM Produtos)

		
PRINT 'O estoque total é = ' + CAST(@totalEstoque AS VARCHAR (30))
PRINT 'O total de SKU é = ' + CAST(@totalSku AS VARCHAR (30))

-------------------------ARMAZENANDO EM UMA VARIÁVEL O REGISTRO DE UMA CONSULTA---------------------
USE LojaCompleta

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT


SELECT TOP(1)
	@varProdutoMaisVEndido = v.ProdutoID
	,@varTotalMaisVendido = v.Quantidade
FROM 
	Vendas v
ORDER BY
	v.Quantidade DESC

PRINT 'Produto mais vendido = ' + CAST(@varProdutoMaisVEndido AS VARCHAR(30)) 
PRINT 'Maior quantidade vendida = ' + CAST(@varTotalMaisVendido AS VARCHAR(30))


-------------------------ACUMULANDO VALORES DENTRO DE UMA VARIÁVEL---------------------
USE BaseDeTreino;

DECLARE @varListaLinha VARCHAR(100)
SET @varListaLinha = ''

SELECT 
	@varListaLinha = @varListaLinha + dsProduto + ', '
FROM
	dados_itec
WHERE
 	dsProduto IN ('ETICO OTC') AND prateleira IN('MEDICAMENTOS CD-86')
 	
PRINT @varListaLinha

-------------------------VARIÁVEIS GLOBAIS DO SQL SERVER---------------------	
-- Algumas variáveis globaias já existem no SQL Server para facilitar nosso serviço, segue abaixo alguns exemplos:

-- Nome do servidor.
SELECT @@SERVERNAME

-- Versão do sistema.
SELECT @@VERSION
	
-- Quantidade de linhas de uma tabela.
SELECT * FROM dados_itec
SELECT @@ROWCOUNT	







