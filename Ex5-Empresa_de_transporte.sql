CREATE TABLE Filiais (
    numero INT PRIMARY KEY,
    endereco VARCHAR(255),
    gerente_id INT,
    FOREIGN KEY (gerente_id) REFERENCES Funcionarios(id)
);

CREATE TABLE Funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,
    endereco VARCHAR(255),
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    filial_id INT,
    FOREIGN KEY (filial_id) REFERENCES Filiais(numero)
);

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cpf_cnpj VARCHAR(18) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Encomendas (
    numero_rastreamento INT PRIMARY KEY,
    remetente_id INT,
    destinatario_id INT,
    data_envio DATETIME,
    data_prevista_entrega DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (remetente_id) REFERENCES Clientes(id),
    FOREIGN KEY (destinatario_id) REFERENCES Clientes(id)
);

CREATE TABLE Movimentacoes (
    numero_movimentacao INT PRIMARY KEY,
    encomenda_id INT,
    data_hora DATETIME,
    tipo_movimentacao VARCHAR(100),
    localizacao VARCHAR(255),
    FOREIGN KEY (encomenda_id) REFERENCES Encomendas(numero_rastreamento)
);
