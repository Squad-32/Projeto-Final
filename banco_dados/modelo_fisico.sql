CREATE DATABASE Ecoartesia;

USE Ecoartesia;

CREATE TABLE Usuarios (
    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    senha VARCHAR(255)
);

CREATE TABLE Contatos (
    id_contato BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    mensagem TEXT,
    fk_Usuarios_id_usuario BIGINT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario) ON DELETE SET NULL
);

CREATE TABLE Voluntarios (
    id_voluntario BIGINT AUTO_INCREMENT PRIMARY KEY,
    fk_Usuarios_id_usuario BIGINT,
    disponibilidade TEXT,
    interesses TEXT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Doacoes (
    id_doacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    fk_Usuarios_id_usuario BIGINT,
    quantidade_doada DECIMAL(10,2),
    data_doacao TIMESTAMP,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Organizacoes (
    id_organizacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco_sede VARCHAR(255)
);

CREATE TABLE Campanhas (
    id_campanha BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    meta_arrecadacao DECIMAL(10,2),
    data_inicio TIMESTAMP,
    data_termino TIMESTAMP,
    fk_Organizacoes_id_organizacao BIGINT,
    FOREIGN KEY (fk_Organizacoes_id_organizacao) REFERENCES Organizacoes (id_organizacao) ON DELETE SET NULL
);

CREATE TABLE Visualizacoes (
    id_visualizacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    tempo_visto VARCHAR(255),
    data_vista TIMESTAMP
);

CREATE TABLE Videos (
    id_video BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao VARCHAR(10),
    caminho_arquivo VARCHAR(255),
    fk_Visualizacoes_id_visualizacao BIGINT,
    FOREIGN KEY (fk_Visualizacoes_id_visualizacao) REFERENCES Visualizacoes (id_visualizacao) ON DELETE SET NULL
);

CREATE TABLE Assiste_Videos (
    fk_Usuarios_id_usuario BIGINT,
    fk_Videos_id_video BIGINT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Videos_id_video),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (fk_Videos_id_video) REFERENCES Videos (id_video) ON DELETE CASCADE
);

CREATE TABLE Usuarios_Participa (
    fk_Usuarios_id_usuario BIGINT,
    fk_Campanhas_id_campanha BIGINT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Campanhas_id_campanha),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas (id_campanha)
);

CREATE TABLE Voluntarios_Faz (
    fk_Doacoes_id_doacao BIGINT,
    fk_Voluntarios_id_voluntario BIGINT,
    PRIMARY KEY (fk_Doacoes_id_doacao, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Doacoes_id_doacao) REFERENCES Doacoes (id_doacao) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios (id_voluntario)
);

-- Inserção de dados na tabela Usuarios
INSERT INTO Usuarios (nome, email, telefone, senha) VALUES 
('John Doe', 'john.doe@gmail.com', '1234567890', 'password');

-- Inserção de dados na tabela Voluntarios
INSERT INTO Voluntarios (fk_Usuarios_id_usuario, disponibilidade, interesses) VALUES 
(1, 'Fins de semana', 'Meio ambiente');

-- Inserção de dados na tabela Contatos
INSERT INTO Contatos (nome, email, telefone, mensagem, fk_Usuarios_id_usuario) VALUES 
('Jane Doe', 'jane.doe@example.com', '0987654321', 'Olá, Ecoartesia!', 1);

-- Inserção de dados na tabela Doacoes
INSERT INTO Doacoes (fk_Usuarios_id_usuario, quantidade_doada, data_doacao) VALUES 
(1, 50.00, NOW());

-- Inserção de dados na tabela Organizacoes
INSERT INTO Organizacoes (nome, endereco_sede) VALUES 
('ONG Ajudante', 'Rua Principal, 123');

-- Inserção de dados na tabela Campanhas
INSERT INTO Campanhas (nome, descricao, meta_arrecadacao, data_inicio, data_termino, fk_Organizacoes_id_organizacao) VALUES 
('Campanha de Arrecadação', 'Arrecadação de fundos para causas sociais', 500.00, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), 1);

-- Inserção de dados na tabela Visualizacoes
INSERT INTO Visualizacoes (tempo_visto, data_vista) VALUES
('0:12', NOW()),
('1:02', NOW()),
('0:14', NOW()),
('0:08', NOW()),
('0:15', NOW()),
('0:09', NOW()),
('0:29', NOW()),
('0:04', NOW()),
('0:17', NOW()),
('0:39', NOW());

-- Inserção de dados na tabela Videos
INSERT INTO Videos (titulo, duracao, caminho_arquivo, fk_Visualizacoes_id_visualizacao) VALUES 
('Diversidade e inclusão', '0:12', './vid/Diversidade e inclusão.mp4', 1),
('Preparo e Cuidado Com o Solo', '1:02', './vid/Preparo e Cuidado Com o Solo.mp4', 2),
('Ações Voluntária de Limpeza', '0:14', './vid/Ações Voluntária de Limpeza.mp4', 3),
('Empoderamento e Liderança', '0:08', './vid/Empoderamento e Liderança.mp4', 4),
('Permacultura', '0:15', './vid/Permacultura.mp4', 5),
('Descarte Consciente', '0:09', './vid/Descarte Consciente.mp4', 6),
('Agricultura Sustentável', '0:29', './vid/Agricultura Sustentável.mp4', 7),
('Consumo Consciente', '0:04', './vid/Consumo Consciente.mp4', 8),
('Direitos Humanos e a Diversidade LGBTQIA+', '0:17', './vid/Direitos Humanos e a Diversidade LGBTQIA.mp4', 9),
('A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade', '0:39', './vid/A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade.mp4', 10);

-- Inserção de dados na tabela Assiste_Videos
INSERT INTO Assiste_Videos (fk_Usuarios_id_usuario, fk_Videos_id_video) VALUES 
(1, 1);

-- Inserção de dados na tabela Usuarios_Participa
INSERT INTO Usuarios_Participa (fk_Usuarios_id_usuario, fk_Campanhas_id_campanha) VALUES 
(1, 1);

-- Inserção de dados na tabela Voluntarios_Faz
INSERT INTO Voluntarios_Faz (fk_Doacoes_id_doacao, fk_Voluntarios_id_voluntario) VALUES 
(1, 1);

-- Consultas
-- Consultar todos os dados de um usuário específico
SELECT * FROM Usuarios WHERE email = 'john.doe@gmail.com';

-- Consultar todos os voluntários e suas doações
SELECT V.*, D.*
FROM Voluntarios V
JOIN Voluntarios_Faz VF ON V.id_voluntario = VF.fk_Voluntarios_id_voluntario
JOIN Doacoes D ON VF.fk_Doacoes_id_doacao = D.id_doacao;

-- Consultar todas as campanhas e organizações associadas
SELECT C.*, O.*
FROM Campanhas C
LEFT JOIN Organizacoes O ON C.fk_Organizacoes_id_organizacao = O.id_organizacao;

-- Listar os vídeos assistidos por um usuário específico
SELECT U.nome AS Nome_Usuario, Vi.titulo AS Titulo_Video
FROM Usuarios U
JOIN Assiste_Videos AV ON U.id_usuario = AV.fk_Usuarios_id_usuario
JOIN Videos Vi ON AV.fk_Videos_id_video = Vi.id_video;

-- Atualizações
-- Atualizar nome e email de um usuário
UPDATE Usuarios SET nome = 'Jonathan Doe', email = 'jonathan.doe@gmail.com' WHERE id_usuario = 1;

-- Atualizar informações de contato
UPDATE Contatos SET nome = 'Jonathan Doe', email = 'jonathan.doe@gmail.com', telefone = '987654321', mensagem = 'Mensagem atualizada' WHERE id_contato = 1;

-- Modificar a disponibilidade e interesses de um voluntário
UPDATE Voluntarios SET disponibilidade = 'Fins de semana e feriados', interesses = 'Meio ambiente, saúde' WHERE id_voluntario = 1;

-- Deleções
-- Excluir registros dependentes
DELETE FROM Visualizacoes WHERE id_visualizacao = 1;
DELETE FROM Usuarios_Participa WHERE fk_Usuarios_id_usuario = 1;
DELETE FROM Voluntarios_Faz WHERE fk_Doacoes_id_doacao = 1;
DELETE FROM Doacoes WHERE id_doacao = 1;
DELETE FROM Voluntarios WHERE id_voluntario = 1;
DELETE FROM Usuarios WHERE id_usuario = 1;