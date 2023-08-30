CREATE TABLE Usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    numero_cartao_credito VARCHAR(16)
);

CREATE TABLE Motoristas (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    num_carteira_habilitacao VARCHAR(20),
    conta_bancaria VARCHAR(30)
);

CREATE TABLE Veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    fabricante VARCHAR(255),
    modelo VARCHAR(255),
    numero_chassi VARCHAR(30),
    ano_fabricacao YEAR,
    lugares_disponiveis INT,
    tipo_carro ENUM('convencional', 'luxo')
);

CREATE TABLE Turnos (
    motorista_cpf VARCHAR(14),
    veiculo_placa VARCHAR(10),
    data_hora_inicio DATETIME,
    data_hora_fim DATETIME,
    PRIMARY KEY (motorista_cpf, veiculo_placa, data_hora_inicio),
    FOREIGN KEY (motorista_cpf) REFERENCES Motoristas(cpf),
    FOREIGN KEY (veiculo_placa) REFERENCES Veiculos(placa)
);

CREATE TABLE Viagens (
    id INT PRIMARY KEY,
    usuario_id INT,
    turno_motorista_cpf VARCHAR(14),
    turno_veiculo_placa VARCHAR(10),
    ponto_partida VARCHAR(255),
    ponto_chegada VARCHAR(255),
    data_hora_inicio DATETIME,
    data_hora_fim DATETIME,
    quilometragem DECIMAL(10, 2),
    valor_corrida DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (turno_motorista_cpf, turno_veiculo_placa, data_hora_inicio) 
        REFERENCES Turnos(motorista_cpf, veiculo_placa, data_hora_inicio)
);
