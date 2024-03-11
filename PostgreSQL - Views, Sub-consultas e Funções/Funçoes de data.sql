

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo FROM aluno;

SELECT UPPER(CONCAT('Vinicius', NULL, 'Dias') || ' ');

SELECT TRIM(UPPER(CONCAT('Vinicius', NULL, 'Dias') || ' '));


SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
FROM aluno;

