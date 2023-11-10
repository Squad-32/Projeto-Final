-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Usuário (
ID_usuário INT PRIMARY KEY,
Senha VARCHAR,
Telefone VARCHAR,
Nome VARCHAR,
Email VARCHAR,
Endereço VARCHAR,
ID_doação INT,
ID_voluntário INT
)

CREATE TABLE Campanhas (
ID_campanha INT PRIMARY KEY,
Meta de arrecadação de fundos DECIMAL,
Nome VARCHAR,
Descrição VARCHAR,
Data de término DATE,
Data de início DATE
)

CREATE TABLE Voluntários (
ID_voluntário INT PRIMARY KEY,
Disponibilidade VARCHAR,
Interesses VARCHAR,
ID_usuário INT,
ID_campanha INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha)
)

CREATE TABLE Doações (
Quantidade_doada DECIMAL,
ID_doação INT PRIMARY KEY,
ID_usuário INT,
Data da doação Date
)

CREATE TABLE Organizações (
ID_organização INT PRIMARY KEY,
Endereço da sede VARCHAR,
Nome VARCHAR,
ID_campanha INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha)
)

CREATE TABLE Participa (
ID_campanha INT,
ID_usuário INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha),
FOREIGN KEY(ID_usuário) REFERENCES Usuário (ID_usuário)
)

ALTER TABLE Usuário ADD FOREIGN KEY(ID_doação) REFERENCES Doações (ID_doação)
ALTER TABLE Usuário ADD FOREIGN KEY(ID_voluntário) REFERENCES Voluntários (ID_voluntário)
