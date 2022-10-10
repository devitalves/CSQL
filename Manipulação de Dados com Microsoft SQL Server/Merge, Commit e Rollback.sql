/** Usando Merge **/

SELECT * FROM [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = '1002334'

SELECT * FROM [PRODUTOS] WHERE [C�DIGO] = '1002334'

SELECT B.[CODIGO DO PRODUTO], B.[PRE�O DE LISTA], A.[C�DIGO], A.[PRE�O LISTA]
FROM [PRODUTOS] A INNER JOIN [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS] B
ON A.[C�DIGO] = B.[CODIGO DO PRODUTO]
WHERE [C�DIGO] = '1002334'

UPDATE [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS] SET [PRE�O DE LISTA] = 8
WHERE [CODIGO DO PRODUTO] = '1002334'

MERGE INTO [PRODUTOS] A
USING [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS] B
ON A.[C�DIGO] = B.[CODIGO DO PRODUTO]
AND A.[C�DIGO] = '1002334'
WHEN MATCHED THEN
UPDATE SET A.[PRE�O LISTA] = B.[PRE�O DE LISTA];

MERGE INTO [DBO].[CLIENTES] A
USING [DBO].[VENDEDORES] B
ON A.[BAIRRO] = B.[BAIRRO]
WHEN MATCHED THEN
UPDATE SET A.[VOLUME DE COMPRA] = 
    A.[VOLUME DE COMPRA] * 1.30;


	
	/** Apagando registros **/
	
	SELECT * from [PRODUTOS] WHERE SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

	 DELETE FROM [PRODUTOS] WHERE [C�DIGO] = '1001000'

	 SELECT * FROM [PRODUTOS]  WHERE [TAMANHO] = '1 Litro' AND SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

	 DELETE FROM [PRODUTOS] WHERE [TAMANHO] = '1 Litro' AND SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

	 SELECT [CODIGO DO PRODUTO] FROM [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS]

	 SELECT * FROM [PRODUTOS] WHERE [C�DIGO] NOT IN (SELECT [CODIGO DO PRODUTO] FROM [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS])

	 DELETE FROM [PRODUTOS] WHERE [C�DIGO] NOT IN (SELECT [CODIGO DO PRODUTO] FROM [SUCOS_VENDAS].[DBO].[TABELA DE PRODUTOS])

	 DELETE A FROM [NOTAS] A
INNER JOIN [CLIENTES] B ON A.[CPF] = B.[CPF] 
WHERE B.[IDADE] < 18


/** Incluindo registros **/

INSERT INTO [dbo].[PRODUTOS] ([C�DIGO],[DESCRITOR],[SABOR],[TAMANHO],[EMBALAGEM],[PRE�O LISTA])
     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
	 ('1001000','Sabor dos Alpes 700 ml - Mel�o','Mel�o','700 ml','Garrafa',7.50),
	 ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
	 ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
	 ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
	 ('1001005','Sabor dos Alpes 700 ml - A�ai','A�ai','700 ml','Garrafa',7.50),
	 ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
	 ('1001007','Sabor dos Alpes 1 Litro - Mel�o','Mel�o','1 Litro','Garrafa',7.50),
	 ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
	 ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
	 ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
	 ('1001011','Sabor dos Alpes 1 Litro - A�ai','A�ai','1 Litro','Garrafa',7.50)

	 SELECT * from [PRODUTOS] WHERE SUBSTRING([DESCRITOR],1,15) = 'Sabor dos Alpes'

	 /** Alterando e apagando toda a tabela **/


	 USE [VENDAS SUCOS]
GO

/****** Object:  Table [dbo].[PRODUTOS]    Script Date: 03/05/2018 15:16:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PRODUTOS_2](
	[C�DIGO] [varchar](10) NOT NULL,
	[DESCRITOR] [varchar](100) NULL,
	[SABOR] [varchar](50) NULL,
	[TAMANHO] [varchar](50) NULL,
	[EMBALAGEM] [varchar](50) NULL,
	[PRE�O LISTA] [float] NULL,
 CONSTRAINT [PK_PRODUTOS_2] PRIMARY KEY CLUSTERED 
(
	[C�DIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



INSERT INTO PRODUTOS_2
SELECT * FROM PRODUTOS

SELECT * FROM PRODUTOS_2

UPDATE PRODUTOS_2 SET [PRE�O LISTA] = [PRE�O LISTA] * 1.10

DELETE FROM PRODUTOS_2


/** Commit e Rollback **/

SELECT * FROM [VENDEDORES]

BEGIN TRANSACTION

UPDATE [VENDEDORES] SET [COMISS�O] = [COMISS�O] * 1.15

INSERT INTO [VENDEDORES] ([MATR�CULA], [NOME], [BAIRRO],[COMISS�O], [DATA ADMISS�O], [F�RIAS])
VALUES ('99999','Jo�o da Silva','Icara�',0.08,'2014-09-01',0)

ROLLBACK

COMMIT


