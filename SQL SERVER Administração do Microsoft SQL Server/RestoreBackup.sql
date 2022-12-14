/** Restaurando o backup **/


RESTORE VERIFYONLY FROM DISK = 'C:\TEMP\SUCOS_VENDAS.BAK'

RESTORE HEADERONLY FROM DISK = 'C:\TEMP\SUCOS_VENDAS.BAK'
RESTORE HEADERONLY FROM DISK = 'C:\TEMP\SUCOS_VENDAS3.BAK'

RESTORE FILELISTONLY FROM DISK = 'C:\TEMP\SUCOS_VENDAS3.BAK'

ALTER DATABASE SUCOS_VENDAS SET RECOVERY FULL
BACKUP DATABASE SUCOS_VENDAS TO DISK = 'C:\TEMP\SUCOS_VENDAS3.BAK' WITH INIT

SELECT * FROM [NOTAS FISCAIS] WHERE DATA = '20180404'
EXEC [dbo].[CriaNotaFiscal] '20180404'
SELECT * FROM [NOTAS FISCAIS] WHERE DATA = '20180404'

USE MASTER
ALTER DATABASE SUCOS_VENDAS SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE SUCOS_VENDAS
RESTORE DATABASE SUCOS_VENDAS FROM DISK = 'C:\TEMP\SUCOS_VENDAS3.BAK' WITH RECOVERY


-- SIMULANDO UMA POLITICA DE BACKUP

-- POLITICAS DE BACKUP -

BACKUP DATABASE SUCOS_VENDAS TO DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK' WITH INIT -- INICIAL
BACKUP DATABASE SUCOS_VENDAS TO DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK' -- BACKUP 2
BACKUP DATABASE SUCOS_VENDAS TO DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK' -- BACKUP 3
BACKUP DATABASE SUCOS_VENDAS TO DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK' -- BACKUP 4

RESTORE HEADERONLY FROM DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK'

USE MASTER
ALTER DATABASE SUCOS_VENDAS SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE SUCOS_VENDAS
RESTORE DATABASE SUCOS_VENDAS FROM DISK = 'C:\TEMP\SUCOS_VENDAS4.BAK' WITH FILE = 4, RECOVERY



