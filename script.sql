-- EX 1:
SELECT i.id_instrutor, i.nome_instrutor, COUNT(s.id_section) AS num_sections
FROM instrutores i
LEFT OUTER JOIN sections s ON i.id_instrutor = s.id_instrutor
GROUP BY i.id_instrutor, i.nome_instrutor;

-- EX 2:
SELECT 
    i.id_instrutor,
    i.nome_instrutor,
    (SELECT COUNT(s.id_section)
     FROM sections s
     WHERE s.id_instrutor = i.id_instrutor) AS num_sections
FROM instrutores i;

-- EX 3
SELECT 
    s.id_section,
    s.nome_section,
    COALESCE(i.nome_instrutor, '-') AS nome_instrutor
FROM 
    sections s
LEFT JOIN 
    instrutores_sections isec ON s.id_section = isec.id_section
LEFT JOIN 
    instrutores i ON isec.id_instrutor = i.id_instrutor
WHERE 
    s.ano = 2010 AND s.semestre = 'Primavera';

-- EX 4
SELECT 
    t.id_aluno, 
    SUM(s.credits * gp.points) AS pontos_totais
FROM 
    takes t
JOIN 
    sections s ON t.id_section = s.id_section
JOIN 
    grade_points gp ON t.nota = gp.grade
GROUP BY 
    t.id_aluno;


-- EX 5
CREATE VIEW coeficiente_rendimento AS
SELECT 
    t.id_aluno, 
    SUM(s.creditos * gp.points) AS pontos_totais
FROM 
    takes t
JOIN 
    sections s ON t.id_section = s.id_section
JOIN 
    grade_points gp ON t.nota = gp.grade
GROUP BY 
    t.id_aluno;
