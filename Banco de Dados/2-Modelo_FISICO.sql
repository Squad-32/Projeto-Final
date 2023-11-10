-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Usu�rio (
ID_usu�rio INT PRIMARY KEY,
Senha VARCHAR,
Telefone VARCHAR,
Nome VARCHAR,
Email VARCHAR,
Endere�o VARCHAR,
ID_doa��o INT,
ID_volunt�rio INT
)

CREATE TABLE Campanhas (
ID_campanha INT PRIMARY KEY,
Meta de arrecada��o de fundos DECIMAL,
Nome VARCHAR,
Descri��o VARCHAR,
Data de t�rmino DATE,
Data de in�cio DATE
)

CREATE TABLE Volunt�rios (
ID_volunt�rio INT PRIMARY KEY,
Disponibilidade VARCHAR,
Interesses VARCHAR,
ID_usu�rio INT,
ID_campanha INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha)
)

CREATE TABLE Doa��es (
Quantidade_doada DECIMAL,
ID_doa��o INT PRIMARY KEY,
ID_usu�rio INT,
Data da doa��o Date
)

CREATE TABLE Organiza��es (
ID_organiza��o INT PRIMARY KEY,
Endere�o da sede VARCHAR,
Nome VARCHAR,
ID_campanha INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha)
)

CREATE TABLE Participa (
ID_campanha INT,
ID_usu�rio INT,
FOREIGN KEY(ID_campanha) REFERENCES Campanhas (ID_campanha),
FOREIGN KEY(ID_usu�rio) REFERENCES Usu�rio (ID_usu�rio)
)

ALTER TABLE Usu�rio ADD FOREIGN KEY(ID_doa��o) REFERENCES Doa��es (ID_doa��o)
ALTER TABLE Usu�rio ADD FOREIGN KEY(ID_volunt�rio) REFERENCES Volunt�rios (ID_volunt�rio)
