-- ============================================================
-- Exercício 3: Salário médio por cargo (agrupamento)
-- (execute depois dos scripts 01 e 02)
-- ============================================================

USE Empresa;

-- O cargo está em Funcionarios e o salário em Salarios, então é preciso unir as tabelas
-- antes de agrupar por cargo e calcular a média com AVG().
SELECT
    f.cargo,
    COUNT(*)                 AS quantidade_funcionarios,
    ROUND(AVG(s.salario), 2) AS salario_medio
FROM Funcionarios f
INNER JOIN Salarios s ON s.funcionario_id = f.id
GROUP BY f.cargo
ORDER BY f.cargo;

-- Resultado esperado (após o UPDATE da Ana e o DELETE do Fábio):
-- Analista de Dados | 1 |  6800.00
-- Designer          | 1 |  5400.00
-- Desenvolvedor     | 2 |  8100.00
-- Gerente           | 1 | 15000.00
