USE TyskieWebshop
GO

DELETE Account
DELETE Winkelmandje
DELETE ProductInWinkelmandje
DELETE Product
DELETE Voorraad

INSERT INTO Account(gebruikersnaam, afrekenCode, email, wachtwoord, salt, postcode, telefoonnummer) VALUES
('TyskieZLY', NULL, 'tyskie.thijssen@gmail.com', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '634D71DCD22474D5EC20529EBD2789268DC8E68DC6E33E398C755FA673735204EE3237CDAF9E87B6A16D503FE04365099980C6004A96CC969391FBC5763D4CDF', '6562BT', '0642094769')

INSERT INTO 