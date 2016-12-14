USE master
GO

IF DB_ID('TyskieWebshop') IS NOT NULL
	DROP DATABASE TyskieWebshop
GO

CREATE DATABASE TyskieWebshop
GO

USE TyskieWebshop
GO

CREATE TABLE Account (
	gebruikersnaam	VARCHAR(50)		NOT NULL,
	email			VARCHAR(50)		NOT NULL,
	wachtwoord		CHAR(128)		NOT NULL,
	salt			CHAR(128)		NOT NULL,
	postcode		VARCHAR(10)		NULL,
	telefoonnummer	VARCHAR(25)		NULL,
	CONSTRAINT PK_Account PRIMARY KEY (gebruikersnaam)
)
GO

CREATE TABLE Winkelmandje (
	afrekenCode		VARCHAR(10)		NOT NULL,
	gebruikersnaam	VARCHAR(50)		NOT NULL,
	totaalprijs		INT				NOT NULL,
	CONSTRAINT PK_Winkelmandje PRIMARY KEY (afrekenCode)
)
GO

CREATE TABLE ProductInWinkelmandje (
	afrekenCode		VARCHAR(10)		NOT NULL,
	productCode		VARCHAR(10)		NOT NULL,
	aantalProducten	INT				NOT NULL,
	CONSTRAINT PK_ProductInWinkelmandje PRIMARY KEY (afrekenCode, productCode, aantalProducten)
)
GO

CREATE TABLE Product (
	productCode		VARCHAR(10)		NOT NULL,
	productNaam		VARCHAR(50)		NOT NULL,
	productPrijs	INT				NOT NULL,
	beschrijving	VARCHAR(500)	NOT NULL,
	CONSTRAINT PK_Product PRIMARY KEY (productCode)
)
GO

CREATE TABLE Voorraad (
	productCode		VARCHAR(10)		NOT NULL,
	aantalVoorraad	INT				NOT NULL,
	CONSTRAINT PK_Voorraad PRIMARY KEY (productCode)
)
GO

ALTER TABLE Winkelmandje
ADD CONSTRAINT FK_Winkelmandje_Account FOREIGN KEY (gebruikersnaam) REFERENCES Account(gebruikersnaam)
GO

ALTER TABLE ProductInWinkelmandje
ADD CONSTRAINT FK_ProductInWinkelmandje_Winkelmandje FOREIGN KEY (afrekenCode) REFERENCES Winkelmandje(afrekenCode)
GO

ALTER TABLE ProductInWinkelmandje
ADD CONSTRAINT FK_ProductInWinkelmandje_Product FOREIGN KEY (productCode) REFERENCES Product(productCode)
GO

ALTER TABLE Voorraad
ADD CONSTRAINT FK_Voorraad_Product FOREIGN KEY (productCode) REFERENCES Product(productCode)
GO