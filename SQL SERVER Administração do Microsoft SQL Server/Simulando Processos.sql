
/** Alguns aspectos sobre performance **/

USE SUCOS_VENDAS;
 
IF OBJECT_ID(' dbo.Nums2', 'U') IS NOT NULL DROP TABLE dbo.Nums2; 
CREATE TABLE dbo.Nums2( n float );

DECLARE @max AS INT, @rc AS INT; 
 SET @max = 3600; 
 SET @rc = 1; 
 WHILE @rc < = @max 
 BEGIN 
 DECLARE @X AS FLOAt
 SELECT @X = SUM(QUANTIDADE) FROM [ITENS NOTAS FISCAIS]
 INSERT INTO dbo.Nums2 (n) values (@X);
 SET @rc = @rc + 1;
 WAITFOR DELAY '00:00:02';  
 END 



 SET NOCOUNT ON; 

USE SUCOS_VENDAS;
 
IF OBJECT_ID(' dbo.Nums', 'U') IS NOT NULL DROP TABLE dbo.Nums; 
CREATE TABLE dbo.Nums( n INT NOT NULL PRIMARY KEY);

 DECLARE @max AS INT, @rc AS INT; 
 SET @max = 30000000; 
 SET @rc = 1; 
 INSERT INTO Nums VALUES( 1); 
 WHILE @rc * 2 < = @max 
 BEGIN 
 
 INSERT INTO dbo.Nums SELECT n + @rc FROM dbo.Nums; 
 SET @rc = @rc * 2; 
 
 END 
 INSERT INTO dbo.Nums SELECT n + @rc FROM dbo.Nums WHERE n + @rc < = @max;

SELECT n, n +  1 AS n_plus_one FROM dbo.Nums WHERE n < = 30000000;


/** Reduzindo base **/

USE SUCOS_VENDAS
ALTER DATABASE SUCOS_VENDAS SET RECOVERY SIMPLE
DBCC SHRINKDATABASE ('SUCOS_VENDAS', NOTRUNCATE)
DBCC SHRINKDATABASE ('SUCOS_VENDAS', TRUNCATEONLY)
ALTER DATABASE SUCOS_VENDAS SET RECOVERY FULL



/** SQL Server Profiler **/

SELECT * FROM [NOTAS FISCAIS] WHERE NUMERO = '100'

SELECT * FROM [NOTAS FISCAIS] 

SELECT * FROM [TABELA DE CLIENTES] A INNER JOIN [NOTAS FISCAIS] B
ON A.CPF = B.CPF INNER JOIN [ITENS NOTAS FISCAIS] C ON B.NUMERO = C.NUMERO


/** Teste trace **/

USE SUCOS_VENDAS;
 
IF OBJECT_ID(' dbo.Nums', 'U') IS NOT NULL DROP TABLE dbo.Nums; 
CREATE TABLE dbo.Nums( n INT NOT NULL PRIMARY KEY);

 DECLARE @max AS INT, @rc AS INT; 
 SET @max = 10000000; 
 SET @rc = 1; 
 INSERT INTO Nums VALUES( 1); 
 WHILE @rc * 2 < = @max 
 BEGIN 
 
 INSERT INTO dbo.Nums SELECT n + @rc FROM dbo.Nums; 
 SET @rc = @rc * 2; 
 
 END 
 INSERT INTO dbo.Nums SELECT n + @rc FROM dbo.Nums WHERE n + @rc < = @max;

SELECT n, n +  1 AS n_plus_one FROM dbo.Nums WHERE n < = 10000000;