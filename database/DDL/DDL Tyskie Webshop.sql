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
	userName	VARCHAR(50),
	password	VARCHAR(50),
	salt		char(16)
)
GO