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