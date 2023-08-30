CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    publico_alvo ENUM('jovem_adulto', 'adulto', 'criancas') NOT NULL
);

CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    data_direitos_autorais DATE NOT NULL,
    formato ENUM('capa_dura', 'brochura', 'ebook') NOT NULL,
    editor_id INT NOT NULL,
    FOREIGN KEY (editor_id) REFERENCES Autores(id)
);

CREATE TABLE Capitulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    livro_id INT NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
);

CREATE TABLE AutoresCapitulos (
    capitulo_id INT NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (capitulo_id) REFERENCES Capitulos(id),
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

CREATE TABLE AutoresGeneros (
    autor_id INT NOT NULL,
    genero_id INT NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id),
    FOREIGN KEY (genero_id) REFERENCES Generos(id)
);
