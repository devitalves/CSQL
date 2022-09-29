/*** Consultas com DISTINCT ***/

SELECT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

SELECT DISTINCT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

SELECT DISTINCT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS] WHERE
[SABOR] = 'Laranja'

SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM [TABELA DE PRODUTOS]

SELECT DISTINCT BAIRRO FROM [TABELA DE CLIENTES]
WHERE CIDADE = 'Rio de Janeiro'

SELECT * FROM [TABELA DE PRODUTOS]

SELECT TOP 3 * FROM [TABELA DE PRODUTOS]

SELECT * FROM [TABELA DE PRODUTOS] WHERE [SABOR] = 'Laranja'

SELECT TOP 3 * FROM [TABELA DE PRODUTOS] WHERE [SABOR] = 'Laranja'

SELECT EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

SELECT DISTINCT TOP 3 EMBALAGEM, TAMANHO FROM [TABELA DE PRODUTOS]

SELECT TOP 10 * FROM [NOTAS FISCAIS] WHERE [DATA] = '2017-01-01'

