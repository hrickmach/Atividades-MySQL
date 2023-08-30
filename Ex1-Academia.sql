CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_alunos INT,
    horario TIME,
    duracao TIME,
    data_inicial DATE,
    data_final DATE,
    tipo_atividade VARCHAR(255),
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id)
);

CREATE TABLE instrutores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rg VARCHAR(20),
    nome VARCHAR(255),
    data_nascimento DATE,
    titulacao VARCHAR(255)
);

CREATE TABLE telefones_instrutores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id)
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10),
    data_matricula DATE,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    data_nascimento DATE,
    altura DECIMAL(10,2),
    peso DECIMAL(10,2)
);

CREATE TABLE monitores (
  id_turma INT, 
  id_aluno INT, 
  PRIMARY KEY (id_turma, id_aluno), 
  FOREIGN KEY (id_turma) REFERENCES turmas(id), 
  FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

CREATE TABLE matriculas (
  id_turma INT, 
  id_aluno INT, 
  ausencias INT,
  PRIMARY KEY (id_turma, id_aluno), 
  FOREIGN KEY (id_turma) REFERENCES turmas(id), 
  FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);
