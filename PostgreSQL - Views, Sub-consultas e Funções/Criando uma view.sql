SELECT * FROM vw_cusrsos_por_cateegoria;


CREAT VIEW vw_cursos_por_cateegoria AS  SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
    GROUP BY categoria


CREAT VIEW vw_cursos_programacao AS SELECT nome FROM curso WHERE categoria_id = 2;

SELECT * FROM vw_cursos_programacao;


