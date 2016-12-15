USE TyskieWebshop
GO

DELETE ProductInWinkelmandje
DELETE Voorraad
DELETE Product
DELETE Winkelmandje
DELETE Account
DELETE Categorie

INSERT INTO Account(gebruikersnaam, email, wachtwoord, salt, postcode, telefoonnummer) VALUES
	('TyskieZLY', 'tyskie.thijssen@gmail.com', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '6562BT', '0642094769'),
	('Swagger10', 'swagger@gmail.com', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '6562AH', '0243977247')

INSERT INTO Categorie(categorieNaam, categorieBeschrijving, hoofdCategorie) VALUES
	('Computer', 'Dit categorie bevat alles wat te maken heeft met een computer.', NULL),
	('Hardware', 'Dit categorie bevat alle hardware componenten.', 'Computer'),
	('Moederborden', 'Dit categorie bevat alle moederborden.', 'Hardware'),
	('MSI', 'Dit categorie bevat alle MSI moederborden.', 'Computer')

INSERT INTO Product(productCode, productNaam, productPrijs, beschrijving, categorieNaam) VALUES
	('PC001', 'Razer Deathadder', 70, 'The Razer Deathadder gaming mouse', 'Computer'),
	('PC002', 'Razer Deathadder Chroma', 75, 'The Razer Deathadder Chroma gaming mouse', 'MSI')

INSERT INTO Voorraad(productCode, aantalVoorraad) VALUES
	('PC001', 10),
	('PC002', 5)

INSERT INTO Winkelmandje(afrekenCode, gebruikersnaam) VALUES
	('ORDER 001', 'TyskieZLY')

INSERT INTO ProductInWinkelmandje(afrekenCode, productCode, aantalProducten) VALUES
	('ORDER 001', 'PC001', 3),
	('ORDER 001', 'PC002', 6)

