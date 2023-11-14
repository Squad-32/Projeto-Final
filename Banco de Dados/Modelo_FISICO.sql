CREATE DATABASE Ecoartesia;

USE Ecoartesia;

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(80),
    senha VARCHAR(20)
);

CREATE TABLE Contatos (
    id_contato INT PRIMARY KEY,
    nome VARCHAR(40),
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
    id_voluntario INT
);

CREATE TABLE Voluntarios (
    id_voluntario INT PRIMARY KEY,
    disponibilidade VARCHAR(100),
    interesses VARCHAR(255),
    id_usuario INT
);

CREATE TABLE Doacoes (
    id_doacoes INT PRIMARY KEY,
    quantidade_doada DECIMAL(10,2),
    data_doacao VARCHAR(10)
);

CREATE TABLE Campanhas (
    id_campanha INT PRIMARY KEY,
    nome INT,
    descricao VARCHAR(255),
    meta_arrecadacao_fundos DECIMAL(10,2),
    data_inicio VARCHAR(10),
    data_termino VARCHAR(10)
);

CREATE TABLE Organizacoes (
    id_organizacao INT PRIMARY KEY,
    nome VARCHAR(40),
    endereco_sede VARCHAR(100),
    id_campanha INT
);

CREATE TABLE Videos (
    id_video INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao VARCHAR(10),
    caminho_arquivo VARCHAR(255)
);

CREATE TABLE Envia_Contatos_Usuarios_Voluntarios (
    fk_Contatos_id_contato INT,
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT
);

CREATE TABLE Registro (
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT
);

CREATE TABLE Faz_Usuarios_Voluntarios_Doacoes (
    fk_Usuarios_id_usuario INT,
    fk_Voluntarios_id_voluntario INT,
    fk_Doacoes_id_doacao INT
);

CREATE TABLE Coordena (
    fk_Campanhas_id_campanha INT,
    fk_Voluntarios_id_voluntario INT
);

CREATE TABLE Assiste (
    fk_Usuarios_id_usuario INT,
    fk_Videos_id_video INT
);

CREATE TABLE Pertence (
    fk_Campanhas_id_campanha INT,
    fk_Organizacoes_id_organizacao INT
);

CREATE TABLE Participa (
    fk_Campanhas_id_campanha INT,
    fk_Usuarios_id_usuario INT
);

CREATE TABLE Visualizacoes (
    id_visualizacao INT PRIMARY KEY,
    tempo_visto VARCHAR(255),
    data_vista VARCHAR(10)
);

CREATE TABLE Gera (
    fk_Visualizacoes_id_visualizacao INT,
    fk_Videos_id_video INT
);
 
ALTER TABLE Envia_Contatos_Usuarios_Voluntarios ADD CONSTRAINT FK_Envia_Contatos_Usuarios_Voluntarios_1
    FOREIGN KEY (fk_Contatos_id_contato)
    REFERENCES Contatos (id_contato)
    ON DELETE RESTRICT;
 
ALTER TABLE Envia_Contatos_Usuarios_Voluntarios ADD CONSTRAINT FK_Envia_Contatos_Usuarios_Voluntarios_2
    FOREIGN KEY (fk_Usuarios_id_usuario)
    REFERENCES Usuarios (id_usuario)
    ON DELETE NO ACTION;
 
ALTER TABLE Envia_Contatos_Usuarios_Voluntarios ADD CONSTRAINT FK_Envia_Contatos_Usuarios_Voluntarios_3
    FOREIGN KEY (fk_Voluntarios_id_voluntario)
    REFERENCES Voluntarios (id_voluntario)
    ON DELETE NO ACTION;
 
ALTER TABLE Registro ADD CONSTRAINT FK_Registro_1
    FOREIGN KEY (fk_Usuarios_id_usuario)
    REFERENCES Usuarios (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Registro ADD CONSTRAINT FK_Registro_2
    FOREIGN KEY (fk_Voluntarios_id_voluntario)
    REFERENCES Voluntarios (id_voluntario)
    ON DELETE SET NULL;
 
ALTER TABLE Faz_Usuarios_Voluntarios_Doacoes ADD CONSTRAINT FK_Faz_Usuarios_Voluntarios_Doacoes_1
    FOREIGN KEY (fk_Usuarios_id_usuario)
    REFERENCES Usuarios (id_usuario)
    ON DELETE NO ACTION;
 
ALTER TABLE Faz_Usuarios_Voluntarios_Doacoes ADD CONSTRAINT FK_Faz_Usuarios_Voluntarios_Doacoes_2
    FOREIGN KEY (fk_Voluntarios_id_voluntario)
    REFERENCES Voluntarios (id_voluntario)
    ON DELETE NO ACTION;
 
ALTER TABLE Faz_Usuarios_Voluntarios_Doacoes ADD CONSTRAINT FK_Faz_Usuarios_Voluntarios_Doacoes_3
    FOREIGN KEY (fk_Doacoes_id_doacao)
    REFERENCES Doacoes (id_doacoes)
    ON DELETE RESTRICT;
 
ALTER TABLE Coordena ADD CONSTRAINT FK_Coordena_1
    FOREIGN KEY (fk_Campanhas_id_campanha)
    REFERENCES Campanhas (id_campanha)
    ON DELETE RESTRICT;
 
ALTER TABLE Coordena ADD CONSTRAINT FK_Coordena_2
    FOREIGN KEY (fk_Voluntarios_id_voluntario)
    REFERENCES Voluntarios (id_voluntario)
    ON DELETE SET NULL;
 
ALTER TABLE Assiste ADD CONSTRAINT FK_Assiste_1
    FOREIGN KEY (fk_Usuarios_id_usuario)
    REFERENCES Usuarios (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Assiste ADD CONSTRAINT FK_Assiste_2
    FOREIGN KEY (fk_Videos_id_video)
    REFERENCES Videos (id_video)
    ON DELETE SET NULL;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_1
    FOREIGN KEY (fk_Campanhas_id_campanha)
    REFERENCES Campanhas (id_campanha)
    ON DELETE RESTRICT;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_2
    FOREIGN KEY (fk_Organizacoes_id_organizacao)
    REFERENCES Organizacoes (id_organizacao)
    ON DELETE SET NULL;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Campanhas_id_campanha)
    REFERENCES Campanhas (id_campanha)
    ON DELETE SET NULL;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Usuarios_id_usuario)
    REFERENCES Usuarios (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_1
    FOREIGN KEY (fk_Visualizacoes_id_visualizacao)
    REFERENCES Visualizacoes (id_visualizacao)
    ON DELETE SET NULL;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_2
    FOREIGN KEY (fk_Videos_id_video)
    REFERENCES Videos (id_video)
    ON DELETE SET NULL;
    
-- Inserindo dados na tabela Usuarios
INSERT INTO Usuarios VALUES 
(default, 'John', 'john@gmail.com', '157'), 
(default, 'Amanda', 'amanda@gmail.com', '354');

-- Inserindo dados na tabela Contatos
INSERT INTO Contatos VALUES 
(default, 'John', 'john@gmail.com', '1234567890', '12345678', 'Rua 1', '10', 'Apto 101', 'Bairro 1', 'SP', 'São Paulo', 'Olá!', 1, NULL),
(default, 'Amanda', 'amanda@gmail.com', '0987654321', '87654321', 'Rua 2', '20', 'Apto 202', 'Bairro 2', 'DF', 'Brasília', 'Oi!', 2, NULL);

-- Inserindo dados na tabela Voluntarios
INSERT INTO Voluntarios VALUES 
(default, 'Disponível aos fins de semana', 'Meio ambiente, educação', 1);

-- Inserindo dados na tabela Doacoes
INSERT INTO Doacoes VALUES 
(default, 50.00, CURDATE());

-- Inserindo dados na tabela Campanhas
INSERT INTO Campanhas VALUES 
(default, 'Campanha de Arrecadação', 'Arrecadação de fundos para causas sociais', 500.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY));

-- Inserindo dados na tabela Organizacoes
INSERT INTO Organizacoes VALUES 
(default, 'ONG Ajudante', 'Rua Principal, 123', 1);

-- Inserir dados na tabela de Vídeos
INSERT INTO Videos (id_video, titulo, caminho_arquivo, duracao)
VALUES 
    ('a1', 'Diversidade e inclusão', '../vid/Diversidade e inclusão.mp4', '0:12'),
    ('a2', 'Preparo e Cuidado Com o Solo', '../vid/Preparo e Cuidado Com o Solo.mp4', '1:02'),
    ('a3', 'Ações Voluntária de Limpeza', '../vid/Ações Voluntária de Limpeza.mp4', '0:14'),
    ('a4', 'Empoderamento e Liderança', '../vid/Empoderamento e Liderança.mp4', '0:08'),
    ('a5', 'Permacultura', '../vid/Permacultura.mp4', '0:15'),
    ('a6', 'Descarte Consciente', '../vid/Descarte Consciente.mp4', '0:09'),
    ('a7', 'Agricultura Sustentável', '../vid/Agricultura Sustentável.mp4', '0:29'),
    ('a8', 'Consumo Consciente', '../vid/Consumo Consciente.mp4', '0:04'),
    ('a9', 'Direitos Humanos e a Diversidade LGBTQIA+', '../vid/Direitos Humanos e a Diversidade LGBTQIA.mp4', '0:17'),
    ('a10', 'A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade', '../vid/A Importância da Liderança na Promoção dos Direitos Humanos e da Igualdade.mp4', '0:39');

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
(2, 1, 1);

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

-- Excluindo um usuário e seu contato associado
DELETE FROM Contatos WHERE id_usuario = 1;
DELETE FROM Usuarios WHERE id_usuario = 1;

-- Excluindo um voluntário e suas doações associadas
DELETE FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1;
DELETE FROM Doacoes WHERE id_doacoes IN (SELECT fk_Doacoes_id_doacao FROM Faz_Usuarios_Voluntarios_Doacoes WHERE fk_Voluntarios_id_voluntario = 1);
DELETE FROM Voluntarios WHERE id_voluntario = 1;

-- Excluindo uma campanha e a organização associada (se houver)
DELETE FROM Organizacoes WHERE id_campanha = 1;
DELETE FROM Campanhas WHERE id_campanha = 1;

-- Excluindo registros de visualizações e vídeos associados
DELETE FROM Gera WHERE fk_Visualizacoes_id_visualizacao = 1;
DELETE FROM Visualizacoes WHERE id_visualizacao = 1;

-- Excluindo um usuário participante de uma campanha
DELETE FROM Participa WHERE fk_Usuarios_id_usuario = 1;

-- Excluindo registros de envio de contatos por voluntários
DELETE FROM Envia_Contatos_Usuarios_Voluntarios WHERE fk_Usuarios_id_usuario = 1;

-- Excluindo registros de coordenação de campanhas por voluntários
DELETE FROM Coordena WHERE fk_Voluntarios_id_voluntario = 1;

-- Excluindo registros de assistência a vídeos por usuários
DELETE FROM Assiste WHERE fk_Usuarios_id_usuario = 1;