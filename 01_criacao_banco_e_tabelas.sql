-- ============================================================
-- Exercício 1: Criação do banco de dados Empresa e das tabelas
-- ============================================================

-- Recria o banco do zero, para o script poder ser executado quantas vezes for preciso
DROP DATABASE IF EXISTS Empresa;

CREATE DATABASE Empresa
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE Empresa;

-- Tabela de funcionários
CREATE TABLE Funcionarios (
    id    INT AUTO_INCREMENT,
    nome  VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

-- Tabela de salários: cada salário pertence a um funcionário (chave estrangeira)
CREATE TABLE Salarios (
    id             INT AUTO_INCREMENT,
    funcionario_id INT            NOT NULL,
    salario        DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE           NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_salarios_funcionario
        FOREIGN KEY (funcionario_id) REFERENCES Funcionarios (id)
) ENGINE = InnoDB;

-- Conferência da estrutura criada
DESCRIBE Funcionarios;
DESCRIBE Salarios;
