CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    codigo VARCHAR(10),
    telefone VARCHAR(20),
    centro VARCHAR(255)
);

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    matricula VARCHAR(10),
    cpf VARCHAR(11),
    rua VARCHAR(255),
    cidade VARCHAR(255),
    cep VARCHAR(8),
    data_nascimento DATE,
    sexo ENUM('M', 'F'),
    id_departamento INT,
    id_curso INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

CREATE TABLE telefones_alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    tipo ENUM('Fundamental', 'Médio'),
    id_departamento INT,
    id_coordenador INT,
    id_vice_coordenador INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    FOREIGN KEY (id_coordenador) REFERENCES professores(id),
    FOREIGN KEY (id_vice_coordenador) REFERENCES professores(id)
);

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(11),
    telefone VARCHAR(20),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    codigo VARCHAR(10),
    creditos INT,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

CREATE TABLE ofertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    horario TIME,
    id_professor INT,
    id_disciplina INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id)
);

CREATE TABLE matriculas (
  id_aluno INT, 
  id_oferta INT, 
  PRIMARY KEY (id_aluno, id_oferta), 
  FOREIGN KEY (id_aluno) REFERENCES alunos(id), 
  FOREIGN KEY (id_oferta) REFERENCES ofertas(id)
);
