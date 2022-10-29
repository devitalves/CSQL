
USE SUCOS_VENDAS
SELECT * FROM SYS.database_files

CREATE DATABASE newDB

USE newDB
SELECT * FROM SYS.database_files

CREATE DATABASE ARCHIVE
ON PRIMARY (NAME = ARCH1, FILENAME = 'C:\TEMP\archive1.mdf', SIZE = 100MB, 
MAXSIZE = 200MB, FILEGROWTH = 20MB),
(NAME = ARCH2, FILENAME = 'C:\TEMP\archive2.ndf', SIZE = 100MB, 
MAXSIZE = 200MB, FILEGROWTH = 20MB)
LOG ON  (NAME = ARCH1LOG, FILENAME = 'C:\TEMP\archive2.ldf', SIZE = 100MB, 
MAXSIZE = 200MB, FILEGROWTH = 20MB)

USE SUCOS_VENDAS
ALTER DATABASE SUCOS_VENDAS SET RECOVERY SIMPLE
DBCC SHRINKDATABASE ('SUCOS_VENDAS', NOTRUNCATE)
DBCC SHRINKDATABASE ('SUCOS_VENDAS', TRUNCATEONLY)
ALTER DATABASE SUCOS_VENDAS SET RECOVERY FULL






