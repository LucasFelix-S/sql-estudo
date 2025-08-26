-- SQL Views: COmandos CREATE VIEW, ALTER VIEW e DROP VIEW

USE BaseDeTreino;
USE LojaCompleta;

-- O que é uma View?
	-- Uma view é uma consulta que você deixa guardado em um Banco de Dados para ser reutilizado futuramente. Na descrição do curso uma view é uma tabela
	-- virtual criada a partir de uma consulta a uma ou mais tabelas (ou até mesmo de outras views) no Banco de Dados

-- Por que criar uma View?
	-- Reutilização, segurança e ganho de tempo.

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Criando a primeira View 

Quando falamos em Views, existem 3 ações envolvidas:
1. Criação de uma View;
2. Alteração de uma View;
3. Exclusão de uma View.

Para cada uma dessas ações, temos um comando associado:
1. CREATE VIEW;
2. ALTER VIEW;
3. DROP VIEW. 
  
*/

---------------------------------------------------1) CREATE VIEW---------------------------------------------------
-- OBS: O comando 'GO' é para delimitar até onde vai aquela query

-- View de estoque dos produtos:
CREATE VIEW vwEstoqueProdutos AS
SELECT 
	ProdutoID			AS 'código_do_produto'
	,Nome				AS 'descrição_do_produto'
	,Estoque			AS 'Estoque_total_do_produto'
FROM 
	Produtos
GO
	
SELECT * FROM vwEstoqueProdutos

-- View de vendas (completa):
GO
CREATE VIEW vwVendaCompleta AS
SELECT
	v.VendaID 				AS 'NF_venda'
	,v.ProdutoID 			AS 'Código_do_Produto'
	,p.Nome					AS 'Descrição_Produto'
	,v.Quantidade			AS 'Quantidade_vendida'
	,v.Total				AS 'Total_da_Venda'
FROM
	Vendas v
LEFT JOIN
	Produtos p
	ON v.ProdutoID = p.ProdutoID
GO
	
SELECT * FROM  Dados_cep

---------------------------------------------------2) ALTER VIEW---------------------------------------------------
USE LojaCompleta;

-- alterando a view vwEstoqueProdutos para adicionar o preço do produto
GO
ALTER VIEW vwEstoqueProdutos AS
SELECT
	ProdutoID			AS [código_do_produto]
	,Nome				AS [descrição_do_produto]
	,Estoque			AS [Estoque_total_do_produto]
	,Preco				AS [Preco_produto]
FROM 
	Produtos;
GO

SELECT * FROM vwEstoqueProdutos

-- alterando a view vwVendaCompleta para adicionar a data da venda
GO
ALTER VIEW vwVendaCompleta AS
SELECT
    v.VendaID      	AS [NF_venda],
    v.ProdutoID    	AS [Código_do_Produto],
    p.Nome         	AS [Descrição_Produto],
    v.Quantidade   	AS [Quantidade_vendida],
    v.Total        	AS [Total_da_Venda],
    v.DataVenda   	AS [Data_da_venda]
FROM
    Vendas v
LEFT JOIN
    Produtos p
    ON v.ProdutoID = p.ProdutoID;
GO
	
SELECT * FROM vwVendaCompleta

-- OBS: No ALTER VIEW eu não uso aspas simples ('') no ALIAS (AS), eu uso colchetes ([])


---------------------------------------------------3) DROP VIEW---------------------------------------------------
DROP VIEW vwEstoqueProdutos;












