/** Criando fun��o para obter dados das entidades **/

CREATE FUNCTION EntidadeAleatoria (@TIPO VARCHAR(12)) RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @ENTIDADE_ALEATORIO VARCHAR(12)
DECLARE @TABELA TABLE (CODIGO VARCHAR(20))
DECLARE @VAL_INICIAL INT
DECLARE @VAL_FINAL INT
DECLARE @ALEATORIO INT
DECLARE @CONTADOR INT

IF @TIPO = 'CLIENTE'
BEGIN
   INSERT INTO @TABELA (CODIGO) SELECT CPF AS CODIGO FROM [TABELA DE CLIENTES]
END
IF @TIPO = 'VENDEDOR'
BEGIN
   INSERT INTO @TABELA (CODIGO) SELECT MATRICULA FROM [TABELA DE VENDEDORES]
END
IF @TIPO = 'PRODUTO'
BEGIN
   INSERT INTO @TABELA (CODIGO) SELECT [CODIGO DO PRODUTO] FROM [TABELA DE PRODUTOS]
END

SET @CONTADOR = 1
SET @VAL_INICIAL = 1
SELECT @VAL_FINAL = COUNT(*) FROM @TABELA
SET @ALEATORIO = [dbo].[NumeroAleatorio](@VAL_INICIAL, @VAL_FINAL)
DECLARE CURSOR1 CURSOR FOR SELECT CODIGO FROM @TABELA
OPEN CURSOR1
FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO
WHILE @CONTADOR < @ALEATORIO
BEGIN
   FETCH NEXT FROM CURSOR1 INTO @ENTIDADE_ALEATORIO
   SET @CONTADOR = @CONTADOR + 1
END
CLOSE CURSOR1
DEALLOCATE CURSOR1
RETURN @ENTIDADE_ALEATORIO
END



SELECT [dbo].[EntidadeAleatoria]('CLIENTE'), [dbo].[EntidadeAleatoria]('PRODUTO'),
[dbo].[EntidadeAleatoria]('VENDEDOR')


DECLARE @CLIENTE VARCHAR(20)
DECLARE @VENDEDOR VARCHAR(20)
DECLARE @PRODUTO VARCHAR(20)

SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')

PRINT @VENDEDOR
PRINT @CLIENTE
PRINT @PRODUTO



/** Outros dados da nota fiscal **/

DECLARE @CLIENTE VARCHAR(12)
DECLARE @VENDEDOR VARCHAR(12)
DECLARE @PRODUTO VARCHAR(12)
DECLARE @DATA DATE
DECLARE @NUMERO INT
DECLARE @IMPOSTO FLOAT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT

SET @DATA = '20180521'
SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @CONTADOR = 1
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

PRINT 'CABE�ARIO'
PRINT @DATA
PRINT @CLIENTE
PRINT @VENDEDOR
PRINT @IMPOSTO
PRINT @NUMERO
PRINT ''
PRINT 'ITENS'
WHILE @CONTADOR <= @NUM_ITENS
BEGIN
	SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')
	SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
	SELECT @PRECO = [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO
	PRINT @NUMERO
	PRINT @PRODUTO
	PRINT @QUANTIDADE
	PRINT @PRECO
	PRINT ''
	SET @CONTADOR = @CONTADOR + 1
END 



DECLARE @CLIENTE VARCHAR(12)
DECLARE @VENDEDOR VARCHAR(12)
DECLARE @PRODUTO VARCHAR(12)
DECLARE @DATA DATE
DECLARE @NUMERO INT
DECLARE @IMPOSTO FLOAT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT

SET @DATA = '20180521'
SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @CONTADOR = 1
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO)

WHILE @CONTADOR <= @NUM_ITENS
BEGIN
    SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')
    SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
    SELECT @PRECO = [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS] 
        WHERE [CODIGO DO PRODUTO] = @PRODUTO

    INSERT INTO [ITENS NOTAS FISCAIS] 
        (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PRE�O)
    VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)

    SET @CONTADOR = @CONTADOR + 1
END



/** Resolvendo problema de PK **/ 

CREATE PROCEDURE CriaNotaFiscal 
@DATA AS DATE
AS
BEGIN

DECLARE @CLIENTE VARCHAR(12)
DECLARE @VENDEDOR VARCHAR(12)
DECLARE @PRODUTO VARCHAR(12)
DECLARE @NUMERO INT
DECLARE @IMPOSTO FLOAT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT
DECLARE @LISTAPRODUTOS TABLE (PRODUTO VARCHAR(20))
DECLARE @AUXPRODUTO INT

SET @DATA = '20180521'
SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @CONTADOR = 1
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO)

WHILE @CONTADOR <= @NUM_ITENS
BEGIN
	SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')
	SELECT @AUXPRODUTO = COUNT(*) FROM @LISTAPRODUTOS WHERE PRODUTO = @PRODUTO 
	IF @AUXPRODUTO = 0
	BEGIN
	   SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
	   SELECT @PRECO = [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = @PRODUTO
	   INSERT INTO [ITENS NOTAS FISCAIS] (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PRE�O)
	   VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)
	   SET @CONTADOR = @CONTADOR + 1
	END
	INSERT INTO @LISTAPRODUTOS (PRODUTO) VALUES (@PRODUTO)
END 
END;

EXEC [dbo].[CriaNotaFiscal] '20180521'



/** Transformando o script em uma SP **/

CREATE PROCEDURE CriaNotaFiscal 
@DATA AS DATE
AS
BEGIN

DECLARE @CLIENTE VARCHAR(12)
DECLARE @VENDEDOR VARCHAR(12)
DECLARE @PRODUTO VARCHAR(12)
DECLARE @NUMERO INT
DECLARE @IMPOSTO FLOAT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT
DECLARE @LISTAPRODUTOS TABLE (PRODUTO VARCHAR(20))
DECLARE @AUXPRODUTO INT

SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @CONTADOR = 1
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO)

WHILE @CONTADOR <= @NUM_ITENS
BEGIN
    SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')
    SELECT @AUXPRODUTO = COUNT(*) FROM @LISTAPRODUTOS 
        WHERE PRODUTO = @PRODUTO 
    IF @AUXPRODUTO = 0
    BEGIN
        SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
        SELECT @PRECO = [PRE�O DE LISTA] FROM [TABELA DE PRODUTOS] 
            WHERE [CODIGO DO PRODUTO] = @PRODUTO
        INSERT INTO [ITENS NOTAS FISCAIS] 
            (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PRE�O)
        VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)
        SET @CONTADOR = @CONTADOR + 1
    END
    INSERT INTO @LISTAPRODUTOS (PRODUTO) VALUES (@PRODUTO)
END 
END;

EXEC [dbo].[CriaNotaFiscal] '20180521'
EXEC [dbo].[CriaNotaFiscal] '20180521'
EXEC [dbo].[CriaNotaFiscal] '20180521'