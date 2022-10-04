/** VERIFICAR SE AS VENDAS FORAM INV�LIDAS **/

SELECT * FROM [TABELA DE CLIENTES]

SELECT * FROM [ITENS NOTAS FISCAIS]

SELECT * FROM [NOTAS FISCAIS]

SELECT * FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 

SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, INF.QUANTIDADE  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 

SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)

SELECT TC.NOME, TC.[VOLUME DE COMPRA] FROM [TABELA DE CLIENTES] TC

SELECT * FROM [TABELA DE CLIENTES] TC

SELECT TC.NOME, CQ.ANO_MES, CQ.QUANTIDADE_MES, TC.[VOLUME DE COMPRA]
FROM
(SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)) CQ
INNER JOIN [TABELA DE CLIENTES] TC ON TC.CPF = CQ.CPF

SELECT AUX1.NOME, AUX1.ANO_MES, AUX1.QUANTIDADE_MES, 
CASE WHEN AUX1.QUANTIDADE_MES <= AUX1.[VOLUME DE COMPRA] THEN 'VENDA V�LIDA'
WHEN AUX1.QUANTIDADE_MES > AUX1.[VOLUME DE COMPRA] THEN 'VENDA INV�LIDA'
END AS STATUS_VENDA
FROM 
(SELECT TC.NOME, CQ.ANO_MES, CQ.QUANTIDADE_MES, TC.[VOLUME DE COMPRA]
FROM
(SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)) CQ
INNER JOIN [TABELA DE CLIENTES] TC ON TC.CPF = CQ.CPF) AUX1
ORDER BY AUX1.NOME, AUX1.ANO_MES



/** RELAT�RIO DE VENDAS POR SABOR **/


SELECT * FROM [TABELA DE PRODUTOS] TP

SELECT * FROM [NOTAS FISCAIS] NF

SELECT * FROM [ITENS NOTAS FISCAIS] INF

SELECT TP.SABOR, NF.DATA, (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO

SELECT TP.SABOR, YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
GROUP BY TP.SABOR, YEAR(NF.DATA)

SELECT TP.SABOR, YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA)

SELECT YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA) = 2016
GROUP BY YEAR(NF.DATA)

SELECT AUX1.SABOR, AUX1.ANO, CONVERT(DECIMAL(15,2), AUX1.FATURAMENTO) AS FATURAMENTO
, CONVERT(VARCHAR, CONVERT(DECIMAL(15,2),(AUX1.FATURAMENTO/AUX2.TOTAL) * 100)) + ' %' 
AS PERCENTUAL FROM
(SELECT TP.SABOR, YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA)) AUX1
INNER JOIN (SELECT YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS TOTAL
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA) = 2016
GROUP BY YEAR(NF.DATA)) AUX2
ON AUX1.ANO = AUX2.ANO
ORDER BY AUX1.FATURAMENTO DESC

















