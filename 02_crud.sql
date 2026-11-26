-- ============================================================
-- Exercício 2: Operações de CRUD
-- (execute depois do script 01)
-- ============================================================

USE Empresa;

-- ---------- CREATE: inserção de 6 funcionários ----------
INSERT INTO Funcionarios (id, nome, cargo) VALUES
    (1, 'Ana Souza',     'Desenvolvedor'),
    (2, 'Bruno Lima',    'Desenvolvedor'),
    (3, 'Carla Mendes',  'Analista de Dados'),
    (4, 'Diego Rocha',   'Gerente'),
    (5, 'Elisa Martins', 'Designer'),
    (6, 'Fábio Alves',   'Analista de Dados');

-- ---------- CREATE: um salário para cada funcionário ----------
INSERT INTO Salarios (funcionario_id, salario, data_pagamento) VALUES
    (1,  8500.00, '2026-11-05'),
    (2,  7200.00, '2026-11-05'),
    (3,  6800.00, '2026-11-05'),
    (4, 15000.00, '2026-11-05'),
    (5,  5400.00, '2026-11-05'),
    (6,  6200.00, '2026-11-05');

-- ---------- READ: lista todos os funcionários com seus salários ----------
SELECT f.id, f.nome, f.cargo, s.salario, s.data_pagamento
FROM Funcionarios f
INNER JOIN Salarios s ON s.funcionario_id = f.id
ORDER BY f.id;

-- ---------- UPDATE: atualiza o salário da Ana (de 8500,00 para 9000,00) ----------
UPDATE Salarios
SET salario = 9000.00
WHERE funcionario_id = 1;

-- Conferência do UPDATE
SELECT f.nome, s.salario
FROM Funcionarios f
INNER JOIN Salarios s ON s.funcionario_id = f.id
WHERE f.id = 1;

-- ---------- DELETE: exclui o funcionário Fábio (id 6) e o seu salário ----------
-- A ordem importa: primeiro o salário (tabela filha, que tem a chave estrangeira)
-- e só depois o funcionário (tabela pai). Na ordem inversa o MySQL recusaria a exclusão.
DELETE FROM Salarios
WHERE funcionario_id = 6;

DELETE FROM Funcionarios
WHERE id = 6;

-- ---------- READ: lista final, depois do UPDATE e do DELETE ----------
SELECT f.id, f.nome, f.cargo, s.salario, s.data_pagamento
FROM Funcionarios f
INNER JOIN Salarios s ON s.funcionario_id = f.id
ORDER BY f.id;
