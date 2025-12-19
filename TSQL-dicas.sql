--------------------------------
--[PLANO DE EXECUÇÃO ESTIMADO]--
--------------------------------
/*
O Plano de execução estimado serve para mostrar como o SQL Server pretende executar a consulta,
ela nos ajuda a identificar gargalos, sugestões de melhorias, comparar estratégias, ou seja, é o raio-x pré-execução
Para executá-lo podemos usar o CTRL + L, ou clicar no ícone próximo ao botão de "executar" no SSMS.
*/

-------------------
--[USO DAS CTE'S]--
-------------------
/*
A CTE sempre precisa ser usada logo em seguida por um SELECT, INSERT, UPDATE ou DELETE. Se não você só cria a CTE e 
o SGBD "não sabe" o que fazer com ela após a sua criação.
*/

-------------------
--[USO DOS LOOPS]--
-------------------
/*
Sempre tomar cuidado com LOOPS infinitos, analisar anteriormente para ver se as variáveis estão sendo atualizadas corretamente.
*/

------------------------
-- [WINDOW FUNCTIONS] --
------------------------
/*
Para que server?
-> São utilizadas para cálculos mais avançados de Análise de Dados;
-> Possuem uso semelhante ao GROUP BY, só que mais avançado e personalizável;
-> A instrução OVER permite definir qual será a "janela" (conjunto de linhas) a ser considerado no cálculo;
-> A instrução PARTITION BY divide o conjunto em partições nas quais as fun~ções de janela são aplicadas.

As funções de janela possuem as seguintes finalidades:
1. Cálculos de agragação: COUNT, SUM, AVG, MIN, MAX...
2. Cálculos de deslocamento: FIRST_VALUE, LAST_VALUE, LEAD, LAG
3. Cálculos estatísticos: RANK, DENSE_RANK, NTILE
*/