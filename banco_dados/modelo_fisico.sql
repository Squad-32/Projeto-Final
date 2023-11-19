CREATE DATABASE Ecoartesia;

USE Ecoartesia;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(80),
    senha VARCHAR(20),
    cep VARCHAR(9),
    endereco VARCHAR(100),
    numero VARCHAR(15),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    estado VARCHAR(2),
    cidade VARCHAR(50)
);

CREATE TABLE Contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(80),
    telefone VARCHAR(15),
    mensagem VARCHAR(250),
    fk_Usuarios_id_usuario INT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario) ON DELETE SET NULL
);

CREATE TABLE Voluntarios (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    disponibilidade TEXT,
    interesses TEXT
);

CREATE TABLE Doacoes (
    id_doacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    quantidade_doada DECIMAL(10,2),
    data_doacao DATE
);

CREATE TABLE Organizacoes (
    id_organizacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    endereco_sede VARCHAR(100)
);

CREATE TABLE Campanhas (
    id_campanha INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    descricao VARCHAR(255),
    meta_arrecadacao DECIMAL(10,2),
    data_inicio DATE,
    data_termino DATE,
    fk_Organizacoes_id_organizacao INT,
    FOREIGN KEY (fk_Organizacoes_id_organizacao) REFERENCES Organizacoes (id_organizacao) ON DELETE SET NULL
);

CREATE TABLE Visualizacoes (
    id_visualizacao INT AUTO_INCREMENT PRIMARY KEY,
    tempo_visto VARCHAR(255),
    data_vista VARCHAR(10)
);

CREATE TABLE Videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao VARCHAR(10),
    caminho_arquivo VARCHAR(255),
    fk_Visualizacoes_id_visualizacao INT,
    FOREIGN KEY (fk_Visualizacoes_id_visualizacao) REFERENCES Visualizacoes (id_visualizacao) ON DELETE RESTRICT
);

CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(40),
    categoria_curso VARCHAR(15),
    descricao_curso VARCHAR(80),
    duracao_curso VARCHAR(250)
);

CREATE TABLE Voluntarios_Coordena (
    fk_Campanhas_id_campanha INT,
    fk_Voluntarios_id_voluntario INT,
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas (id_campanha) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios (id_voluntario) ON DELETE SET NULL
);

CREATE TABLE Assiste_Videos (
    fk_Usuarios_id_usuario INT,
    fk_Videos_id_video INT,
    fk_Cursos_id_curso INT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (fk_Videos_id_video) REFERENCES Videos (id_video) ON DELETE SET NULL,
    FOREIGN KEY (fk_Cursos_id_curso) REFERENCES Cursos (id_curso) ON DELETE SET NULL
);

CREATE TABLE Possui_Campanhas (
    fk_Campanhas_id_campanha INT AUTO_INCREMENT PRIMARY KEY,
    fk_Organizacoes_id_organizacao INT,
    -- Adicionando um índice à coluna fk_Organizacoes_id_organizacao
    INDEX idx_fk_Organizacoes_id_organizacao (fk_Organizacoes_id_organizacao)
);

CREATE TABLE Usuarios_Participa (
    fk_Usuarios_id_usuario INT,
    fk_Campanhas_id_campanha INT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Campanhas_id_campanha),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario),
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas (id_campanha)
);

CREATE TABLE Voluntarios_Faz (
    fk_Doacoes_id_doacao INT,
    fk_Voluntarios_id_voluntario INT,
    PRIMARY KEY (fk_Doacoes_id_doacao, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Doacoes_id_doacao) REFERENCES Doacoes (id_doacao) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios (id_voluntario)
);

CREATE TABLE Usuarios_Faz (
    fk_Doacoes_id_doacao INT,
    fk_Usuarios_id_usuario INT,
    PRIMARY KEY (fk_Doacoes_id_doacao, fk_Usuarios_id_usuario),
    FOREIGN KEY (fk_Doacoes_id_doacao) REFERENCES Doacoes (id_doacao) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Usuarios_Envia (
    fk_Contatos_id_contato INT,
    fk_Usuarios_id_usuario INT,
    PRIMARY KEY (fk_Contatos_id_contato, fk_Usuarios_id_usuario),
    FOREIGN KEY (fk_Contatos_id_contato) REFERENCES Contatos (id_contato) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Voluntarios_Envia (
    fk_Contatos_id_contato INT,
    fk_Voluntarios_id_voluntario INT,
    PRIMARY KEY (fk_Contatos_id_contato, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Contatos_id_contato) REFERENCES Contatos (id_contato) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios (id_voluntario)
);

CREATE TABLE Matricula_se (
    fk_Cursos_id_curso INT,
    fk_Usuarios_id_usuario INT,
    PRIMARY KEY (fk_Cursos_id_curso, fk_Usuarios_id_usuario),
    FOREIGN KEY (fk_Cursos_id_curso) REFERENCES Cursos (id_curso),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Enviado_Para (
    fk_Contatos_id_contato INT,
    fk_Organizacoes_id_organizacao INT,
    PRIMARY KEY (fk_Contatos_id_contato, fk_Organizacoes_id_organizacao),
    FOREIGN KEY (fk_Contatos_id_contato) REFERENCES Contatos (id_contato) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Organizacoes_id_organizacao) REFERENCES Organizacoes (id_organizacao)
);

-- Inserindo dados na tabela Usuarios
INSERT INTO Usuarios VALUES 
(DEFAULT, 'John', 'john@gmail.com', 'senha123', '123456789', 'Rua Principal', '10', 'Apto 101', 'Bairro 1', 'SP', 'São Paulo');

-- Inserindo dados na tabela Voluntarios
INSERT INTO Voluntarios VALUES 
(DEFAULT, 'John', 'john@gmail.com', 'Disponível aos fins de semana', 'Meio ambiente, educação');

-- Inserindo dados na tabela Contatos
INSERT INTO Contatos VALUES 
(DEFAULT, 'John', 'john@gmail.com', '1234567890', 'Olá!', 1);

-- Inserindo dados na tabela Doacoes
INSERT INTO Doacoes VALUES 
(DEFAULT, 'John', 'john@gmail.com', 50.00, CURDATE());

-- Inserindo dados na tabela Organizacoes
INSERT INTO Organizacoes VALUES 
(DEFAULT, 'ONG Ajudante', 'Rua Principal, 123');

-- Inserindo dados na tabela Campanhas
INSERT INTO Campanhas VALUES 
(DEFAULT, 'Campanha de Arrecadação', 'Arrecadação de fundos para causas sociais', 500.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 1);

-- Inserindo dados na tabela Visualizacoes
INSERT INTO Visualizacoes VALUES 
(DEFAULT, '10 minutos', CURDATE());

-- Inserindo dados na tabela de Vídeos sem especificar o valor do fk_Visualizacoes_id_visualizacao
INSERT INTO Videos (titulo, duracao, caminho_arquivo)
VALUES 
('Diversidade e inclusão', '0:12', './vid/Diversidade e inclusão.mp4'),
('Preparo e Cuidado Com o Solo', '1:02', './vid/Preparo e Cuidado Com o Solo.mp4'),
('Ações Voluntária de Limpeza', '0:14', './vid/Ações Voluntária de Limpeza.mp4'),
('Empoderamento e Liderança', '0:08', './vid/Empoderamento e Liderança.mp4'),
('Permacultura', '0:15', './vid/Permacultura.mp4'),
('Descarte Consciente', '0:09', './vid/Descarte Consciente.mp4'),
('Agricultura Sustentável', '0:29', './vid/Agricultura Sustentável.mp4'),
('Consumo Consciente', '0:04', './vid/Consumo Consciente.mp4'),
('Direitos Humanos e a Diversidade LGBTQIA+', '0:17', './vid/Direitos Humanos e a Diversidade LGBTQIA.mp4'),
('A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade', '0:39', './vid/A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade.mp4');

-- Inserindo dados na tabela Cursos
INSERT INTO Cursos VALUES 
(DEFAULT, 'Curso Teste', 'Categoria Teste', 'Descrição do curso teste', '4 semanas');

-- Inserindo dados na tabela Enviado_Para
INSERT INTO Enviado_Para VALUES 
(1, 1);

-- Selecione todos os voluntários e suas doações
SELECT V.*, D.*
FROM Voluntarios V
JOIN Voluntarios_Faz VF ON V.id_voluntario = VF.fk_Voluntarios_id_voluntario
JOIN Doacoes D ON VF.fk_Doacoes_id_doacao = D.id_doacao;

-- Selecione todas as campanhas e organizações associadas
SELECT C.*, O.*
FROM Campanhas C
LEFT JOIN Organizacoes O ON C.fk_Organizacoes_id_organizacao = O.id_organizacao;

-- Listar os vídeos assistidos por usuários
SELECT U.nome AS Nome_Usuario, V.titulo AS Titulo_Video
FROM Usuarios U
JOIN Assiste_Videos AV ON U.id_usuario = AV.fk_Usuarios_id_usuario
JOIN Videos V ON AV.fk_Videos_id_video = V.id_video;

-- Atualizar nome e email de um usuário na tabela Usuarios
UPDATE Usuarios SET 
	nome = 'João', 
	email = 'joao@gmail.com' 
WHERE id_usuario = 1;

-- Atualizar informações de contato na tabela Contatos
UPDATE Contatos 
SET 
	nome = 'João', 
	email = 'joao@gmail.com', 
	telefone = '987654321', 
	mensagem = 'Mensagem Atualizada'
WHERE id_contato = 1;

-- Modificar a disponibilidade e interesses de um voluntário na tabela Voluntarios
UPDATE Voluntarios SET 
	disponibilidade = 'Fins de semana e feriados',
	interesses = 'Meio ambiente, saúde' 
WHERE id_voluntario = 1;

-- Excluir registros dependentes na tabela Usuario_Envia
DELETE FROM Usuarios_Envia WHERE fk_Usuarios_id_usuario = 1;

-- Excluir registros dependentes na tabela Usuario_Faz
DELETE FROM Usuarios_Faz WHERE fk_Usuarios_id_usuario = 1;

-- Excluir registros de coordenação de campanhas por voluntários
DELETE FROM Voluntarios_Coordena WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluir registros de envio de contatos por voluntários
DELETE FROM Voluntarios_Envia WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluir registros de visualizações associadas a vídeos
DELETE FROM Visualizacoes WHERE id_visualizacao = 1;

-- Excluir registros de participação em campanhas por usuários
DELETE FROM Usuarios_Participa WHERE fk_Usuarios_id_usuario = 1;

-- Excluir registros de posses por organizações
DELETE FROM Possui_Campanhas WHERE fk_Organizacoes_id_organizacao = 1;

-- Excluir registros de envio para a organização
DELETE FROM enviado_para WHERE fk_Organizacoes_id_organizacao = 1;

-- Agora, você pode excluir a organização
DELETE FROM Organizacoes WHERE id_organizacao = 1;

-- Excluir campanhas
DELETE FROM Campanhas WHERE id_campanha = 1;

-- Excluir doações associadas a um voluntário
DELETE FROM Voluntarios_Faz WHERE fk_Doacoes_id_doacao = 1;

-- Excluir doações
DELETE FROM Doacoes WHERE id_doacao = 1;

-- Excluir voluntários
DELETE FROM Voluntarios WHERE id_voluntario = 1;

-- Excluir usuários
DELETE FROM Usuarios WHERE id_usuario = 1;