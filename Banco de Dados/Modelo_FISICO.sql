/* Modelo_LOGICO: */

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(80),
    senha VARCHAR(20)
);

CREATE TABLE Contatos (
    id_contato INT PRIMARY KEY,
    nome VARCHAR(40),
    email VARCHAR(80,
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
    id_organizacoes INT PRIMARY KEY,
    nome VARCHAR(40),
    endereco_sede VARCHAR(100),
    id_campanha INT
);

CREATE TABLE Videos (
    id_videos INT PRIMARY KEY,
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
    fk_Doacoes_id_doacoes INT
);

CREATE TABLE Coordena (
    fk_Campanhas_id_campanha INT,
    fk_Voluntarios_id_voluntario INT
);

CREATE TABLE Assiste (
    fk_Usuarios_id_usuario INT,
    fk_Videos_id_videos INT
);

CREATE TABLE Pertence (
    fk_Campanhas_id_campanha INT,
    fk_Organizacoes_id_organizacoes INT
);

CREATE TABLE Participa (
    fk_Campanhas_id_campanha INT,
    fk_Usuarios_id_usuario INT
);

CREATE TABLE Visualizacoes (
    id_visualizacoes INT PRIMARY KEY,
    tempo_visto VARCHAR(255),
    data_vista VARCHAR(10)
);

CREATE TABLE Gera (
    fk_Visualizacoes_id_visualizacoes INT,
    fk_Videos_id_videos INT
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
    FOREIGN KEY (fk_Doacoes_id_doacoes)
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
    FOREIGN KEY (fk_Videos_id_videos)
    REFERENCES Videos (id_videos)
    ON DELETE SET NULL;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_1
    FOREIGN KEY (fk_Campanhas_id_campanha)
    REFERENCES Campanhas (id_campanha)
    ON DELETE RESTRICT;
 
ALTER TABLE Pertence ADD CONSTRAINT FK_Pertence_2
    FOREIGN KEY (fk_Organizacoes_id_organizacoes)
    REFERENCES Organizacoes (id_organizacoes)
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
    FOREIGN KEY (fk_Visualizacoes_id_visualizacoes???)
    REFERENCES ??? (???)
    ON DELETE SET NULL;
 
ALTER TABLE Gera ADD CONSTRAINT FK_Gera_2
    FOREIGN KEY (fk_Videos_id_videos???)
    REFERENCES ??? (???)
    ON DELETE SET NULL;