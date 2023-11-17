CREATE DATABASE Ecoartesia;

USE Ecoartesia;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    senha VARCHAR(20)
);

CREATE TABLE Voluntarios (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    telefone VARCHAR(15),
    cep VARCHAR(9),
    endereco VARCHAR(100),
    numero VARCHAR(15),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado TEXT(2),
    disponibilidade TEXT(100),
    interesses TEXT(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Contatos (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    telefone VARCHAR(15),
    cep VARCHAR(9),
    endereco VARCHAR(100),
    numero VARCHAR(15),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    estado VARCHAR(2),
    cidade VARCHAR(50),
    mensagem VARCHAR(250),
    id_usuario INT,
    id_voluntario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_voluntario) REFERENCES Voluntarios(id_voluntario) ON DELETE CASCADE
);

CREATE TABLE Doacoes (
    id_doacoes INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(80),
    quantidade_doada DECIMAL(10,2),
    data_doacao DATE,
    id_usuario INT,
    id_voluntario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_voluntario) REFERENCES Voluntarios(id_voluntario)
);

CREATE TABLE Campanhas (
    id_campanha INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    meta_arrecadacao_fundos DECIMAL(10,2),
    data_inicio DATE,
    data_termino DATE
);

CREATE TABLE Organizacoes (
    id_organizacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    endereco_sede VARCHAR(100),
    id_campanha INT,
    FOREIGN KEY (id_campanha) REFERENCES Campanhas(id_campanha)
);

CREATE TABLE Videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao VARCHAR(10),
    caminho_arquivo VARCHAR(255)
);

CREATE TABLE Envia_Contatos_Usuarios_Voluntarios (
    fk_Contatos_id_contato INT,
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT,
    PRIMARY KEY (fk_Contatos_id_contato, fk_Usuarios_id_usuario, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Contatos_id_contato) REFERENCES Contatos(id_contato),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios(id_voluntario)
);

CREATE TABLE Registro (
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios(id_voluntario)
);

CREATE TABLE Faz_Usuarios_Voluntarios_Doacoes (
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT,
    fk_Doacoes_id_doacao INT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Voluntarios_id_voluntario, fk_Doacoes_id_doacao),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios(id_voluntario),
    FOREIGN KEY (fk_Doacoes_id_doacao) REFERENCES Doacoes(id_doacoes)
);

CREATE TABLE Coordena (
    fk_Campanhas_id_campanha INT,
    fk_Voluntarios_id_voluntario INT,
    PRIMARY KEY (fk_Campanhas_id_campanha, fk_Voluntarios_id_voluntario),
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas(id_campanha),
    FOREIGN KEY (fk_Voluntarios_id_voluntario) REFERENCES Voluntarios(id_voluntario)
);

CREATE TABLE Assiste (
    fk_Usuarios_id_usuario INT,
    fk_Videos_id_video INT,
    PRIMARY KEY (fk_Usuarios_id_usuario, fk_Videos_id_video),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (fk_Videos_id_video) REFERENCES Videos(id_video)
);

CREATE TABLE Pertence (
    fk_Campanhas_id_campanha INT,
    fk_Organizacoes_id_organizacao INT,
    PRIMARY KEY (fk_Campanhas_id_campanha, fk_Organizacoes_id_organizacao),
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas(id_campanha),
    FOREIGN KEY (fk_Organizacoes_id_organizacao) REFERENCES Organizacoes(id_organizacao)
);

CREATE TABLE Participa (
    fk_Campanhas_id_campanha INT,
    fk_Usuarios_id_usuario INT,
    PRIMARY KEY (fk_Campanhas_id_campanha, fk_Usuarios_id_usuario),
    FOREIGN KEY (fk_Campanhas_id_campanha) REFERENCES Campanhas(id_campanha),
    FOREIGN KEY (fk_Usuarios_id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Visualizacoes (
    id_visualizacao INT AUTO_INCREMENT PRIMARY KEY,
    tempo_visto VARCHAR(255),
    data_vista DATE
);

CREATE TABLE Gera (
    fk_Visualizacoes_id_visualizacao INT,
    fk_Videos_id_video INT,
    PRIMARY KEY (fk_Visualizacoes_id_visualizacao, fk_Videos_id_video),
    FOREIGN KEY (fk_Visualizacoes_id_visualizacao) REFERENCES Visualizacoes(id_visualizacao),
    FOREIGN KEY (fk_Videos_id_video) REFERENCES Videos(id_video)
);

-- Inserindo dados na tabela Usuarios
INSERT INTO Usuarios VALUES 
(1, 'John', 'john@gmail.com', '157'), 
(2, 'Amanda', 'amanda@gmail.com', '354');

-- Inserindo dados na tabela Voluntarios
INSERT INTO Voluntarios VALUES 
(default, 'John', 'john@gmail.com', '1234567890', '12345678', 'Rua 1', '10', 'Apto 101', 'Bairro 1', 'SP', 'São Paulo', 'Disponível aos fins de semana', 'Meio ambiente, educação', 1);

-- Inserindo dados na tabela Contatos
INSERT INTO Contatos VALUES 
(default, 'John', 'john@gmail.com', '1234567890', '12345678', 'Rua 1', '10', 'Apto 101', 'Bairro 1', 'SP', 'São Paulo', 'Olá!', 1, 1),
(default, 'Amanda', 'amanda@gmail.com', '0987654321', '87654321', 'Rua 2', '20', 'Apto 202', 'Bairro 2', 'DF', 'Brasília', 'Oi!', 2, 1);

-- Inserindo dados na tabela Doacoes
INSERT INTO Doacoes VALUES 
(default, 'John', 'john@gmail.com', 50.00, CURDATE(), 1, 1),
(default, 'Amanda', 'amanda@gmail.com', 50.00, CURDATE(), 2, 1);

-- Inserindo dados na tabela Campanhas
INSERT INTO Campanhas VALUES 
(default, 'Campanha de Arrecadação', 'Arrecadação de fundos para causas sociais', 500.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY));

-- Inserindo dados na tabela Organizacoes
INSERT INTO Organizacoes VALUES 
(default, 'ONG Ajudante', 'Rua Principal, 123', 1);

-- Inserir dados na tabela de Vídeos
INSERT INTO Videos (id_video, titulo, caminho_arquivo, duracao)
VALUES 
    (default, 'Diversidade e inclusão', './vid/Diversidade e inclusão.mp4', '0:12'),
    (default, 'Preparo e Cuidado Com o Solo', './vid/Preparo e Cuidado Com o Solo.mp4', '1:02'),
    (default, 'Ações Voluntária de Limpeza', './vid/Ações Voluntária de Limpeza.mp4', '0:14'),
    (default, 'Empoderamento e Liderança', './vid/Empoderamento e Liderança.mp4', '0:08'),
    (default, 'Permacultura', './vid/Permacultura.mp4', '0:15'),
    (default, 'Descarte Consciente', './vid/Descarte Consciente.mp4', '0:09'),
    (default, 'Agricultura Sustentável', './vid/Agricultura Sustentável.mp4', '0:29'),
    (default, 'Consumo Consciente', './vid/Consumo Consciente.mp4', '0:04'),
    (default, 'Direitos Humanos e a Diversidade LGBTQIA+', './vid/Direitos Humanos e a Diversidade LGBTQIA.mp4', '0:17'),
    (default, 'A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade', './vid/A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade.mp4', '0:39');

-- Inserindo dados na tabela Envia_Contatos_Usuarios_Voluntarios
INSERT INTO Envia_Contatos_Usuarios_Voluntarios VALUES 
(1, 1, 1),
(2, 2, 1);

-- Inserindo dados na tabela Registro
INSERT INTO Registro VALUES 
(1, 1),
(2, 1);

-- Inserindo dados na tabela Faz_Usuarios_Voluntarios_Doacoes
INSERT INTO Faz_Usuarios_Voluntarios_Doacoes VALUES 
(1, 1, 1),
(2, 1, 2);

-- Inserindo dados na tabela Coordena
INSERT INTO Coordena VALUES 
(1, 1);

-- Inserindo dados na tabela Assiste
INSERT INTO Assiste VALUES 
(1, 1),
(2, 1);

-- Inserindo dados na tabela Pertence
INSERT INTO Pertence VALUES 
(1, 1);

-- Inserindo dados na tabela Participa
INSERT INTO Participa VALUES 
(1, 1);

-- Inserindo dados na tabela Visualizacoes
INSERT INTO Visualizacoes VALUES 
(default, '10 minutos', CURDATE());

-- Inserindo dados na tabela Gera
INSERT INTO Gera VALUES 
(1, 1);

-- Verificando quem coordena campanhas
SELECT V.nome AS Nome_Voluntario, C.nome AS Nome_Campanha
FROM Voluntarios V
JOIN Coordena Co ON V.id_voluntario = Co.fk_Voluntarios_id_voluntario
JOIN Campanhas C ON Co.fk_Campanhas_id_campanha = C.id_campanha;

-- Selecionando todos os usuários e seus contatos
SELECT U.*, C.*
FROM Usuarios U
JOIN Contatos C ON U.id_usuario = C.id_usuario;

-- Selecionando todos os voluntários e suas doações
SELECT V.*, D.*
FROM Voluntarios V
JOIN Faz_Usuarios_Voluntarios_Doacoes FUV ON V.id_voluntario = FUV.fk_Voluntarios_id_voluntario
JOIN Doacoes D ON FUV.fk_Doacoes_id_doacao = D.id_doacoes;

-- Obtendo informações sobre as campanhas e organizações associadas
SELECT C.*, O.*
FROM Campanhas C
LEFT JOIN Organizacoes O ON C.id_campanha = O.id_campanha;

-- Listando os vídeos assistidos por usuários
SELECT U.nome AS Nome_Usuario, V.titulo AS Titulo_Video
FROM Usuarios U
JOIN Assiste A ON U.id_usuario = A.fk_Usuarios_id_usuario
JOIN Videos V ON A.fk_Videos_id_video = V.id_video;

-- Recuperando detalhes das visualizações e vídeos associados
SELECT V.*, Vi.*
FROM Videos V
JOIN Gera G ON V.id_video = G.fk_Videos_id_video
JOIN Visualizacoes Vi ON G.fk_Visualizacoes_id_visualizacao = Vi.id_visualizacao;

-- Encontrando usuários que participam de campanhas
SELECT U.*, P.*
FROM Usuarios U
JOIN Participa P ON U.id_usuario = P.fk_Usuarios_id_usuario;

-- Obtendo contatos enviados por voluntários
SELECT C.*
FROM Contatos C
JOIN Envia_Contatos_Usuarios_Voluntarios ECUV ON C.id_contato = ECUV.fk_Contatos_id_contato;

-- Verificando quem coordena campanhas
SELECT V.nome AS Nome_Voluntario, C.nome AS Nome_Campanha
FROM Voluntarios V
JOIN Coordena Co ON V.id_voluntario = Co.fk_Voluntarios_id_voluntario
JOIN Campanhas C ON Co.fk_Campanhas_id_campanha = C.id_campanha;

-- Selecionando todos os vídeos
SELECT * FROM Videos;

-- Atualizando nome e email de um usuário na tabela Usuarios
UPDATE Usuarios SET 
	nome = 'João', 
	email = 'joao@gmail.com' 
WHERE id_usuario = 1;

-- Atualizando informações de contato na tabela Contatos
UPDATE Contatos 
SET 
	nome = 'João', 
	email = 'joao@gmail.com', 
	telefone = '987654321', 
	cep = '87654321', 
	endereco = 'Rua Atualizada', 
	numero = '25', 
	complemento = 'Apto 303', 
	bairro = 'Novo Bairro', 
	estado = 'RJ', 
	cidade = 'Rio de Janeiro', 
	mensagem = 'Mensagem Atualizada'
WHERE id_usuario = 1;

-- Modificando a disponibilidade e interesses de um voluntário na tabela Voluntarios
UPDATE Voluntarios SET 
	disponibilidade = 'Fins de semana e feriados',
	interesses = 'Meio ambiente, saúde' 
WHERE id_voluntario = 1;

-- Excluindo registros dependentes na tabela Envia_Contatos_Usuarios_Voluntarios
DELETE FROM Envia_Contatos_Usuarios_Voluntarios WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo registros dependentes na tabela Faz_Usuarios_Voluntarios_Doacoes
DELETE FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo registros de coordenação de campanhas por voluntários
DELETE FROM Coordena WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo registros de envio de contatos por voluntários
DELETE FROM Envia_Contatos_Usuarios_Voluntarios WHERE fk_Usuarios_id_usuario = 1;

-- Excluindo registros de visualizações associadas a vídeos
DELETE FROM Gera WHERE fk_Visualizacoes_id_visualizacao = 1;

-- Excluindo registros de participação em campanhas por usuários
DELETE FROM Participa WHERE fk_Usuarios_id_usuario = 1;

-- Excluindo registros de pertencimento a campanhas por organizações
DELETE FROM Pertence WHERE fk_Campanhas_id_campanha = 1;

-- Excluindo organizações associadas a uma campanha (se houver)
DELETE FROM Organizacoes WHERE id_campanha = 1;

-- Excluindo campanhas
DELETE FROM Campanhas WHERE id_campanha = 1;

-- Excluindo doações associadas a um voluntário
DELETE FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo doações
DELETE FROM Doacoes WHERE id_doacoes IN (SELECT fk_Doacoes_id_doacao FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1);

-- Excluindo registros de assistência a vídeos por usuários (se necessário, dependendo do seu modelo)
DELETE FROM Assiste WHERE fk_Usuarios_id_usuario = 1;

-- Excluindo registros de contatos
DELETE FROM Contatos WHERE id_usuario = 1;

-- Excluindo doações associadas a um voluntário
DELETE FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo doações
DELETE FROM Doacoes WHERE id_voluntario = 1;

-- Excluindo registros na tabela Registro
DELETE FROM Registro WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo o voluntário
DELETE FROM Voluntarios WHERE id_voluntario = 1;

-- Excluindo o usuário
DELETE FROM Usuarios WHERE id_usuario = 1;