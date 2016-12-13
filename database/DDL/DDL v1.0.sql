USE master
GO

IF DB_ID('TyskieWebshop') IS NOT NULL
BEGIN
	DROP DATABASE TyskieWebshop
END
GO

CREATE DATABASE TyskieWebshop
GO

CREATE TABLE test (
	Name		VARCHAR(50),
	Password	VARCHAR(50)
)
GO