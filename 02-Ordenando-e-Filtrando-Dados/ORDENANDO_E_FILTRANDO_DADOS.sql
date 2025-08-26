-- ORDENANDO E FILTRANDO DADOS --
-- COMANDOS 'ORDER BY', 'WHERE', 'WHERE LIKE', 'WHERE OR/AND' 'WHERE IN', 'WHERE (NOT)BETWEEN' 'WHERE IS (NOT) NULL'

-- UTILIZANDO O FILTRO DE ORDENAÇÃO ORDER BY, POR PADRÃO ELE ORDENA DE ORDEM ASCENDENTE 'ASC' (MENOR PARA O MAIOR);
USE LojaCompleta;

SELECT TOP(5) 
	*
FROM 
	Vendas
ORDER BY
	Total
		
-- DESSA FORMA FILTRAMOS DO MAIOR PARA O MENOR;	
USE LojaCompleta;
	
SELECT TOP(5)
	*
FROM
	Vendas
ORDER BY
	Total DESC
	
-- ORDENANDO DUAS COLUNAS DIFERENTES COM O GROUP BY 
USE LojaCompleta;	
	
SELECT TOP(10)
	ProdutoID as codigo_produto,
	Nome	  as nome,
	Preco	  as preco,
	Estoque	  as qtd
FROM
	Produtos
ORDER BY
	Estoque DESC, Preco DESC
	
SELECT TOP(20)
	
-- FILTRANDO NOSSA CONSULTA COM O COMANDO 'WHERE' (FILTRO NUMÉRICO);
USE BaseDeTreino;

SELECT 
	*
FROM
	dados_itec
WHERE
	estoqueItec >= 50
ORDER BY
	estoqueItec DESC

-- FILTRANDO NOSSA CONSULTA COM O COMANDO 'WHERE' (FILTRO DE TEXTO);
USE BaseDeTreino;
	
SELECT 
	*
FROM
	dados_itec
WHERE
	linha = 'Etico'
	
-- FILTRO DE DATA COM O COMANDO WHERE DEVE SEGUIR O PADRÃO: 'YYYY-MM-DD';
	
	
-- TRABALHANDO COM COMANDOS 'AND', 'OR' e 'NOT';
-- TRABALHANDO COM O COMANDO 'AND';
USE BaseDeTreino;

SELECT 
	*
FROM
	dados_itec
WHERE
	linha = 'Etico'
	AND statusProduto = 'ATIVO' 
	AND estoqueItec > 0
ORDER BY
	estoqueItec DESC;

-- TRABALHANDO COM O COMANDO 'OR';	
USE BaseDeTreino;

SELECT 
	*
FROM
	dados_itec
WHERE	
	prateleira = 'medicamentos cd-86' OR prateleira = 'nd'

	
-- TRABALHANDO COM O COMANDO 'NOT' (AQUI CONCATENEI O 'NOT' COM O 'AND';
USE BaseDeTreino;

SELECT 
	*
FROM
	dados_itec
WHERE NOT
	linha = 'Etico otc' AND NOT linha = 'Etico';

-- COMBINANDO O COMANDO 'AND' E 'OR', OBS: USAR O PARÊNTESES PARA ELE FILTRAR PRIMEIRO O 'OR' E DEPOIS O 'AND';
USE BaseDeTreino;

SELECT
	*
FROM
	dados_itec
WHERE
	(linha = 'ETICO' OR linha = 'ETICO OTC')
AND
	prateleira = 'ND'

-- COMANDO 'IN' PARA EVITAR MUITOS COMANDOS 'OR';
USE BaseDeTreino;
	
SELECT
	*
FROM
	dados_itec
WHERE
	linha IN ('ETICO', 'SIMILAR')
	
	
SELECT
	*
FROM
	dados_itec
WHERE
	prateleira IN ('ND', 'HPC CD-86')

-- USANDO COMANDO 'LIKE' E OS CORINGAS '_' E '%';
USE BaseDeTreino;

SELECT
	*
FROM
	dados_itec
WHERE
	dsProduto LIKE '%ADULTO%'

	
SELECT
	*
FROM
	dados_itec
WHERE
	dsProduto LIKE '%400__%'

-- USANDO O COMANDO 'BETWEEN' PARA ANALISAR ENTRE UM VALOR E OUTRO. OBS: DA PRA USAR BETWEEN COM DATAS;
USE BaseDeTreino;
	
SELECT
	*
FROM
	dados_WMS
WHERE
	estoqueWms BETWEEN 50 AND 100
ORDER BY
	estoqueWms DESC 
	
	
SELECT
	*
FROM
	dados_WMS
WHERE
	estoqueWms NOT BETWEEN 10 AND 300
ORDER BY
	estoqueWms
	
-- TRABALHANDO COM OS COMANDOS 'IS NULL' E 'IS NOT NULL' PARA FILTRAR VALORES NULOS;
USE BaseDeTreino;
	
SELECT
	*
FROM
	dados_WMS
WHERE
	enderecoProduto IS NOT NULL	
	
SELECT
	*
FROM
	analiseEngavetamento
WHERE
	'estoque itec' IS NULL
	
SELECT
	idProduto			AS 'codigo_do_produto',
	dsProduto			AS 'descricao_do_produto',
	prateleira			AS 'engavetamento',
	linha				AS 'linha',
	statusProduto		AS 'status_do_produto',
	estoqueItec			AS 'estoque_itec',
	estoqueWms			AS 'estoque_wms',
	enderecoProduto		AS 'endereco_wms'
FROM
	dados_itec di
LEFT JOIN
	dados_wms dw ON di.idProduto = dw.idProdutoWms
WHERE enderecoProduto IS NULL 
	
	

