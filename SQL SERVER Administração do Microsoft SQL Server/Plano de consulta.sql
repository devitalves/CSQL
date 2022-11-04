
/** O que é o plano de consultas? **/

SELECT N FROM Nums1 WHERE n = '10001'

SELECT N FROM Nums2 WHERE n = '10001'

SELECT A.CPF, A.NOME, B.DATA, SUM(C.QUANTIDADE) AS QUANTIDADE
FROM [TABELA DE CLIENTES] A
INNER JOIN [NOTAS FISCAIS] B ON A.CPF = B.CPF
INNER JOIN [ITENS NOTAS FISCAIS] C ON B.NUMERO = C.NUMERO
GROUP BY A.CPF, A.NOME, B.DATA



/** Seek e Scan **/

SET SHOWPLAN_ALL OFF

SELECT CPF FROM [TABELA DE CLIENTES] WHERE CIDADE = 'Rio de Janeiro'

SELECT CPF FROM [TABELA DE CLIENTES] WHERE CPF = '1471156710'

 SELECT N FROM Nums1 where N = '10001'

 SELECT N FROM Nums2 where N = '10001'



 /** Quais consultas são atendidas pelo índice? **/ 

 drop table T_heap;
CREATE TABLE T_heap (a int NOT NULL, b int NOT NULL, c int NOT NULL, d int NOT NULL, e int NOT NULL, f int NOT NULL); 
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),1)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),2)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),3)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),4)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),5)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),6)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),7)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),8)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),9)
insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),10)

SELECT b, c FROM t_heap where b = 68 and c= 55

CREATE NONCLUSTERED INDEX T_heap_a ON T_heap (a); 

SELECT b FROM t_heap WHERE b = 1

SELECT a FROM t_heap WHERE a = 1

CREATE INDEX T_heap_bc ON T_heap (b, c); 

SELECT b, c  FROM t_heap WHERE b = 1 and c = 1

SELECT b  FROM t_heap WHERE b = 1 and c = 1

SELECT a  FROM t_heap WHERE b = 1 and c = 1

CREATE INDEX T_heap_d ON T_heap (d) INCLUDE (e); 

SELECT d, e FROM t_heap WHERE d = 1 and e = 1

SELECT e, d FROM t_heap WHERE d = 1 and e = 1

SELECT e FROM t_heap WHERE d = 1 and e = 1

SELECT a FROM t_heap WHERE d = 1 and e = 1

CREATE UNIQUE INDEX T_heap_f ON T_heap (f); 

SELECT f FROM t_heap WHERE f = 1

SELECT a FROM t_heap WHERE f = 1

CREATE TABLE T_clu (a int, b int, c int, d int, e int, f int);

insert into T_clu (a,b,c,d,e,f) values (1, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),1)
insert into T_clu (a,b,c,d,e,f) values (2, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),2)
insert into T_clu (a,b,c,d,e,f) values (3, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),3)
insert into T_clu (a,b,c,d,e,f) values (4, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),4)
insert into T_clu (a,b,c,d,e,f) values (5, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),5)
insert into T_clu (a,b,c,d,e,f) values (6, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),6)
insert into T_clu (a,b,c,d,e,f) values (7, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),7)
insert into T_clu (a,b,c,d,e,f) values (8, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),8)
insert into T_clu (a,b,c,d,e,f) values (9, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),9)
insert into T_clu (a,b,c,d,e,f) values (10, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),10)

CREATE UNIQUE CLUSTERED INDEX T_clu_a ON T_clu (a); 

SELECT * FROM T_clu where b = 68 and c= 55

SELECT * FROM T_clu where a = 50

CREATE INDEX T_clu_b ON T_clu (b, c); 

SELECT b, c FROM T_clu where b = 50 and c = 50

SELECT e FROM T_clu where b = 50 and c = 50

CREATE INDEX T_clu_d ON T_clu (d) INCLUDE (e); 

SELECT d, e FROM T_clu where d = 2 and e = 2

CREATE UNIQUE INDEX T_clu_f ON T_clu (f);

SELECT * FROM T_clu where f = 1 


/** Joins **/

DROP TABLE T_heap1
DROP TABLE T_heap2
CREATE TABLE T_heap1 (a int NOT NULL, b int NOT NULL, c int NOT NULL, d int NOT NULL, e int NOT NULL, f int NOT NULL); 

insert into T_heap1 (a,b,c,d,e,f) values (1, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),1)
insert into T_heap1 (a,b,c,d,e,f) values (2, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),2)
insert into T_heap1 (a,b,c,d,e,f) values (3, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),3)
insert into T_heap1 (a,b,c,d,e,f) values (4, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),4)
insert into T_heap1 (a,b,c,d,e,f) values (5, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),5)
insert into T_heap1 (a,b,c,d,e,f) values (6, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),6)
insert into T_heap1 (a,b,c,d,e,f) values (7, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),7)
insert into T_heap1 (a,b,c,d,e,f) values (8, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),8)
insert into T_heap1 (a,b,c,d,e,f) values (9, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),9)
insert into T_heap1 (a,b,c,d,e,f) values (10, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),10)
insert into T_heap1 (a,b,c,d,e,f) values (11, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),11)
insert into T_heap1 (a,b,c,d,e,f) values (12, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),12)
insert into T_heap1 (a,b,c,d,e,f) values (13, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),13)
insert into T_heap1 (a,b,c,d,e,f) values (14, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),14)
insert into T_heap1 (a,b,c,d,e,f) values (15, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),15)
insert into T_heap1 (a,b,c,d,e,f) values (16, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),16)
insert into T_heap1 (a,b,c,d,e,f) values (17, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),17)
insert into T_heap1 (a,b,c,d,e,f) values (18, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),18)
insert into T_heap1 (a,b,c,d,e,f) values (19, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),19)
insert into T_heap1 (a,b,c,d,e,f) values (20, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),20)
insert into T_heap1 (a,b,c,d,e,f) values (21, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),21)

CREATE TABLE T_heap2 (a int NOT NULL, b int NOT NULL, c int NOT NULL, d int NOT NULL, e int NOT NULL, f int NOT NULL); 

insert into T_heap2 (a,b,c,d,e,f) values (1, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),1)
insert into T_heap2 (a,b,c,d,e,f) values (2, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),2)
insert into T_heap2 (a,b,c,d,e,f) values (3, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),3)
insert into T_heap2 (a,b,c,d,e,f) values (4, [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),4)

SELECT T_heap1.a, T_heap2.a from T_heap1 INNER JOIN T_heap2 ON T_heap1.a = T_heap2.a

SELECT T_heap1.a, T_heap2.a from T_heap1 INNER JOIN T_heap2 ON T_heap1.a = T_heap2.a
where T_heap1.a <=2 

CREATE INDEX T_heap1_a ON T_heap1 (a);
DROP INDEX  T_heap1_a ON T_heap1

CREATE INDEX T_heap2_a ON T_heap2 (a);
DROP INDEX  T_heap2_a ON T_heap2



/** Sugestão de índices **/

SELECT A.CPF, B.NUMERO, C.QUANTIDADE FROM
[TABELA DE CLIENTES] A 
INNER JOIN [NOTAS FISCAIS] B ON A.CPF = B.CPF AND A.CPF = '7771579779' 
INNER JOIN [ITENS NOTAS FISCAIS] C ON B.NUMERO = C.NUMERO

SELECT A.CPF, B.NUMERO, C.QUANTIDADE FROM
[ITENS NOTAS FISCAIS] C
INNER JOIN [NOTAS FISCAIS] B ON B.NUMERO = C.NUMERO
INNER JOIN [TABELA DE CLIENTES] A ON A.CPF = B.CPF AND A.CPF = '7771579779' 

SELECT  sys.objects.name
, (avg_total_user_cost * avg_user_impact) * (user_seeks + user_scans) AS Impact
,  'CREATE NONCLUSTERED INDEX ix_IndexName ON ' + sys.objects.name COLLATE DATABASE_DEFAULT + ' ( ' + IsNull(mid.equality_columns, '') + CASE WHEN mid.inequality_columns IS NULL
                THEN '' 
    ELSE CASE WHEN mid.equality_columns IS NULL
                    THEN '' 
        ELSE ',' END + mid.inequality_columns END + ' ) ' + CASE WHEN mid.included_columns IS NULL
                THEN '' 
    ELSE 'INCLUDE (' + mid.included_columns + ')' END + ';' AS CreateIndexStatement
, mid.equality_columns
, mid.inequality_columns
, mid.included_columns 
    FROM sys.dm_db_missing_index_group_stats AS migs 
            INNER JOIN sys.dm_db_missing_index_groups AS mig ON migs.group_handle = mig.index_group_handle 
            INNER JOIN sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle AND mid.database_id = DB_ID() 
            INNER JOIN sys.objects WITH (nolock) ON mid.OBJECT_ID = sys.objects.OBJECT_ID 
    WHERE     (migs.group_handle IN
        ( 
        SELECT     TOP (500) group_handle 
            FROM          sys.dm_db_missing_index_group_stats WITH (nolock) 
            ORDER BY (avg_total_user_cost * avg_user_impact) * (user_seeks + user_scans) DESC))  
        AND OBJECTPROPERTY(sys.objects.OBJECT_ID, 'isusertable')=1 
    ORDER BY 2 DESC , 3 DESC


	SELECT o.name, indexname=i.name, i.index_id 
, reads=user_seeks + user_scans + user_lookups 
, writes = user_updates 
, rows = (SELECT SUM(p.rows) FROM sys.partitions p WHERE p.index_id = s.index_id AND s.object_id = p.object_id)
, CASE
 WHEN s.user_updates < 1 THEN 100
 ELSE 1.00 * (s.user_seeks + s.user_scans + s.user_lookups) / s.user_updates
 END AS reads_per_write
, 'DROP INDEX ' + QUOTENAME(i.name) 
+ ' ON ' + QUOTENAME(c.name) + '.' + QUOTENAME(OBJECT_NAME(s.object_id)) as 'drop statement'
FROM sys.dm_db_index_usage_stats s 
INNER JOIN sys.indexes i ON i.index_id = s.index_id AND s.object_id = i.object_id 
INNER JOIN sys.objects o on s.object_id = o.object_id
INNER JOIN sys.schemas c on o.schema_id = c.schema_id
WHERE OBJECTPROPERTY(s.object_id,'IsUserTable') = 1
AND s.database_id = DB_ID() 
AND i.type_desc = 'nonclustered'
AND i.is_primary_key = 0
AND i.is_unique_constraint = 0
AND (SELECT SUM(p.rows) FROM sys.partitions p WHERE p.index_id = s.index_id AND s.object_id = p.object_id) > 10000
ORDER BY reads
