
/** Alterando a fun��o que lista o n�mero de notas fiscais **/

CREATE FUNCTION EnderecoCompleto 
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
   DECLARE @ENDERECO_COMPLETO VARCHAR(250)
   SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
   RETURN @ENDERECO_COMPLETO
END

SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM [TABELA DE CLIENTES]

ALTER FUNCTION EnderecoCompleto 
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
   DECLARE @ENDERECO_COMPLETO VARCHAR(250)
   SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP
   RETURN @ENDERECO_COMPLETO
END

SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], CIDADE, ESTADO, CEP) AS END_COMPLETO
FROM [TABELA DE CLIENTES]


ALTER FUNCTION FuncTabelaNotas (
    @DATAINICIAL AS DATE, 
    @DATAFINAL AS DATE
) RETURNS TABLE
RETURN SELECT DATA, COUNT(*) AS NUMERO 
    FROM [NOTAS FISCAIS] WHERE DATA >= @DATAINICIAL AND 
        DATA <= @DATAFINAL 
GROUP BY DATA 

SELECT * FROM [dbo].[FuncTabelaNotas]('20170101','20170110')

/** Excluindo uma fun��o **/

IF OBJECT_ID ('EnderecoCompleto3', 'FN') IS NOT NULL
DROP FUNCTION [dbo].[EnderecoCompleto3] 

CREATE FUNCTION [dbo].[EnderecoCompleto3] 
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
   DECLARE @ENDERECO_COMPLETO VARCHAR(250)
   SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP
   RETURN @ENDERECO_COMPLETO
END


USE [SUCOS_VENDAS]
GO

DROP FUNCTION [dbo].[EnderecoCompleto3]
GO