
/**Associando um usuário ao Windows **/

CREATE LOGIN marcos WITH PASSWORD = 'marcos@123'


/** Usuário de conexão do SQL Server **/

SELECT * FROM MASTER.SYS.sql_logins

SELECT name, LOGINPROPERTY(name, 'PasswordLastSetTime') from MASTER.SYS.sql_logins

CREATE LOGIN pedro WITH PASSWORD = 'pedro'

SELECT SERVERPROPERTY('DESKTOP-N51LB16') AS SERVER_NAME
, NAME AS LOGIN_NAME FROM  MASTER.SYS.sql_logins
WHERE PWDCOMPARE(NAME, PASSWORD_HASH) <> 1


/** Autorizações **/

ALTER SERVER ROLE [dbcreator] ADD MEMBER [marco] 

ALTER SERVER ROLE [dbcreator] DROP MEMBER [marco] 



/** Autorizações a nível de servidor e banco **/

SELECT * FROM sys.fn_builtin_permissions('') where class_desc = 'SERVER'


USE SUCOS_VENDAS
CREATE LOGIN jorge WITH PASSWORD = 'jorge@123'
CREATE USER jorge FOR LOGIN jorge

USE SUCOS_VENDAS
EXEC sp_addrolemember 'db_datareader', 'jorge'


USE SUCOS_VENDAS
SELECT * FROM [NOTAS FISCAIS]
INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO) VALUES ('7771579779','00235','2018-06-01','10000000',0.1)
SELECT * FROM [NOTAS FISCAIS] WHERE NUMERO = 10000000
DELETE FROM [NOTAS FISCAIS] WHERE NUMERO = 10000000

