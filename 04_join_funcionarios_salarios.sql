-- ============================================================
-- Exercício 4: Junção das tabelas Funcionarios e Salarios
-- (execute depois dos scripts 01 e 02)
-- ============================================================

USE Empresa;

-- Nome, salário e cargo de cada funcionário, unindo as duas tabelas pela chave estrangeira
SELECT
    f.nome,
    s.salario,
    f.cargo
FROM Funcionarios f
INNER JOIN Salarios s ON s.funcionario_id = f.id
ORDER BY f.nome;

-- Resultado esperado (após o UPDATE da Ana e o DELETE do Fábio):
-- Ana Souza     |  9000.00 | Desenvolvedor
-- Bruno Lima    |  7200.00 | Desenvolvedor
-- Carla Mendes  |  6800.00 | Analista de Dados
-- Diego Rocha   | 15000.00 | Gerente
-- Elisa Martins |  5400.00 | Designer
