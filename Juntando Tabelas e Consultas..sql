/** USANDO FULL E CROSS JOIN. **/

SELECT * FROM [TABELA DE VENDEDORES]

SELECT * FROM [TABELA DE CLIENTES]


SELECT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE CLIENTES].BAIRRO FROM
[TABELA DE VENDEDORES] INNER JOIN [TABELA DE CLIENTES] ON 
[TABELA DE VENDEDORES].BAIRRO = [TABELA DE CLIENTES].BAIRRO

SELECT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME],  
[TABELA DE CLIENTES].BAIRRO, [TABELA DE CLIENTES].[NOME] FROM
[TABELA DE VENDEDORES] LEFT JOIN [TABELA DE CLIENTES] ON 
[TABELA DE VENDEDORES].BAIRRO = [TABELA DE CLIENTES].BAIRRO

SELECT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME],  
[TABELA DE CLIENTES].BAIRRO, [TABELA DE CLIENTES].[NOME] FROM
[TABELA DE VENDEDORES] RIGHT JOIN [TABELA DE CLIENTES] ON 
[TABELA DE VENDEDORES].BAIRRO = [TABELA DE CLIENTES].BAIRRO

SELECT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME],  
[TABELA DE CLIENTES].BAIRRO, [TABELA DE CLIENTES].[NOME] FROM
[TABELA DE VENDEDORES] FULL JOIN [TABELA DE CLIENTES] ON 
[TABELA DE VENDEDORES].BAIRRO = [TABELA DE CLIENTES].BAIRRO

SELECT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE CLIENTES].BAIRRO FROM
[TABELA DE VENDEDORES] CROSS JOIN [TABELA DE CLIENTES] 


/** USANDO UNION **/


SELECT DISTINCT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]

SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

SELECT DISTINCT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]
UNION
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

SELECT DISTINCT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

SELECT DISTINCT [TABELA DE CLIENTES].[BAIRRO], [TABELA DE CLIENTES].[DATA DE NASCIMENTO] FROM [TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME] FROM [TABELA DE VENDEDORES]

SELECT DISTINCT [TABELA DE CLIENTES].[BAIRRO], [TABELA DE CLIENTES].[NOME] FROM [TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME] FROM [TABELA DE VENDEDORES]

SELECT DISTINCT [TABELA DE CLIENTES].[BAIRRO], [TABELA DE CLIENTES].[NOME], 'CLIENTE' FROM [TABELA DE CLIENTES]
UNION ALL
SELECT DISTINCT [TABELA DE VENDEDORES].BAIRRO, [TABELA DE VENDEDORES].[NOME], 'VENDEDOR' FROM [TABELA DE VENDEDORES]


/** SUB CONSULTAS **/

SELECT NOME, BAIRRO FROM [TABELA DE CLIENTES]

SELECT NOME, BAIRRO FROM [TABELA DE CLIENTES]
WHERE BAIRRO IN (SELECT BAIRRO FROM [TABELA DE VENDEDORES])

SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM

SELECT NOVA_CONSULTA.EMBALAGEM, NOVA_CONSULTA.MAX_PRECO
FROM (SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) AS MAX_PRECO FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM)
NOVA_CONSULTA
WHERE NOVA_CONSULTA.MAX_PRECO <= 5


SELECT X.CPF, X.CONTADOR FROM 
(SELECT CPF, COUNT(*) AS CONTADOR FROM [NOTAS FISCAIS]
WHERE YEAR(DATA) = 2016
GROUP BY CPF) X WHERE X.CONTADOR > 2000


/** VIEW **/

SELECT EMBALAGEM, MAX([PREÇO DE LISTA]) AS MAX_PRECO FROM [TABELA DE PRODUTOS] GROUP BY EMBALAGEM

SELECT * FROM [dbo].[VW_EMBALAGENS]

SELECT NOVA_CONSULTA.EMBALAGEM, NOVA_CONSULTA.MAX_PRECO
FROM VW_EMBALAGENS NOVA_CONSULTA
WHERE NOVA_CONSULTA.MAX_PRECO <= 5