
SELECT categoria,
    numero_cursos
FROM (
    SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
    GROUP BY categoria
) AS categoria_cursos
WHERE numero_cursos > 3;