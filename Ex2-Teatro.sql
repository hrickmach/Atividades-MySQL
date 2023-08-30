CREATE TABLE salas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) UNIQUE,
    capacidade INT
);

CREATE TABLE pecas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    diretor VARCHAR(255),
    ano_lancamento INT,
    tipo VARCHAR(255),
    sinopse TEXT
);

CREATE TABLE premiacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_premiacao VARCHAR(255),
    ano INT,
    id_peca INT,
    FOREIGN KEY (id_peca) REFERENCES pecas(id)
);

CREATE TABLE exibicoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    horario TIME,
    id_sala INT,
    id_peca INT,
    FOREIGN KEY (id_sala) REFERENCES salas(id),
    FOREIGN KEY (id_peca) REFERENCES pecas(id)
);

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carteira_trabalho VARCHAR(20) UNIQUE,
    nome VARCHAR(255),
    data_admissao DATE,
    salario DECIMAL(10,2)
);

CREATE TABLE horarios_funcionarios (
  id_horario TIME, 
  id_funcionario INT, 
  funcao VARCHAR(255),
  PRIMARY KEY (id_horario, id_funcionario), 
  FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);
