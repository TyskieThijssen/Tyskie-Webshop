USE TyskieWebshop
GO

/* Stored Procedure UPDATE Account Beheren */
CREATE PROCEDURE spd_updateAccount
	@gebruikersnaam VARCHAR(50),
	@email			VARCHAR(50),
	@wachtwoord		CHAR(128),
	@salt			CHAR(128),
	@postcode		VARCHAR(10),
	@telefoonnummer	VARCHAR(25)
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		UPDATE Account
		SET email = @email, wachtwoord = @wachtwoord, salt = @salt, postcode = @postcode, telefoonnummer = @telefoonnummer
		WHERE gebruikersnaam = @gebruikersnaam
		IF @TranCounter = 0 AND XACT_STATE() = 1
			COMMIT TRANSACTION;
END TRY
BEGIN CATCH
		IF @TranCounter = 0 
			BEGIN
				IF XACT_STATE() = 1 ROLLBACK TRANSACTION;
			END;
		ELSE
			BEGIN
				IF XACT_STATE() <> -1 ROLLBACK TRANSACTION ProcedureSave;
			END;	
		THROW
END CATCH
GO