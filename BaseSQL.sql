-- Estruturas Básicas
--FONTE: https://www.linkedin.com/feed/update/urn:li:activity:7219694654357671936/

--Selecionar dados de uma tabela
SELECT NOME FROM CLIENTES;

--Eliminar duplicatas em um resultado de consulta
SELECT DISTINCT NOMECLIENTE FROM CLIENTES;

--Utilizado Para Especificar a Tabela de Onde os Dados Serão Selecionados
SELECT NOME FROM CLIENTES;

--Utilizado para combinar dados de duas ou mais tabelas
--CLIENTES C; C = REFERÊNCIA A TABELA CLIENTES
--ON C.CLIENTE_ID = V.CLIENTE_ID;ESTABELECE UMA RELAÇÃO ENTRE AS DUAS TABELAS
SELECT C.NOME, V.VALOR_VENDA FROM CLIENTES C JOIN VENDAS V ON C.CLIENTE_ID = V.CLIENTE_ID;

--Utilizado para filtrar registros que atendem a uma condição específica;
-- IDADE > 30; CONDIÇÃO ESTABELECIDA PARA A TABELA CLIENTE; 
SELECT NOME FROM CLIENTES WHERE IDADE > 30;

--Utilizado para filtar registros após a aplicação de funções de agregação
--SELECIONE DE FUNCIONARIOS A QUANTIDADES DE VALORES QUE SÃO MAIORES QUE 5; AGRUPAMENTO + CONDIÇÃO
SELECT DEPARTAMENTO, COUNT() FROM FUNCIONARIOS GROUP BY DEPARTAMENTO HAVING COUNT() > 5;

--Utilizado para buscar um padrão específico em uma coluna
SELECT NOME FROM CLIENTES WHERE NOME LIKE 'A%';

--Utilizado para agrupar registros por uma ou mais colunas
SELECT DEPARTAMENTO, COUNT(*) FROM FUNCIONARIOS GROUP BY DEPARTAMENTO

--Utilizado para ordenar os resultados de uma consulta por uma ou mais colunas;
SELECT NOME, IDADE FROM CLIENTES ORDER BY IDADE DESC;

--Utilizado para contar o número de reistros em uma tabela
SELECT COUNT(*) FROM CLIENTES;

--Utilizado para calcular o valor máximo, mínimo e a média de uma coluna;
SELECT MAX(SALARIO), MIN(SALARIO), AVG(SALARIO) FROM FUNCIONARIOS;

--Utilizado para calcular a soma de uma coluna
SELECT SUM(SALARIO) FROM FUNCIONARIOS;

--Utilizado para realizar cálculos condicionais em consultas SQL
SELECT NOME, SALARIO, CASE WHEN SALARIO > 7000 THEN 'ALTO' WHERE SALARIO > 5000 THEN 'MEDIO' ELSE 'BAIXO'END AS CLASSIFICA_SALARIO FROM FUNCIONARIOS;

--Utilizado para dividir os dados em partições para aplicação de funções de janela;
SELECT NOME, SALARIO, RANK() OVER(PARTITION BY DEPARTAMENTO ORDER BY SALARIO DESC) AS RANKING FROM FUNCIONARIOS;


--Utilizado para definir expressões de tabela comuns que podem ser referenciadas em uma consulta
WITH CTE AS (SELECT NOME, SALARIO FROM FUNCIONARIOS) SELECT * FROM CTE WHERE SALARIO > 5000;

--Utilizado para combinar os resultados de duas ou mais consultas SQL
--UNION REMOVE DUPLICATAS, UNION ALL MATÉM TODAS AS DUPLICADAS
SELECT PRIMEIRO_NOME, SEGUNDO_NOME FROM FUNCIONARIOS UNION SELECT PRIMEIRO_NOME, SEGUNDO_NOME FROM COLABORADORES;

