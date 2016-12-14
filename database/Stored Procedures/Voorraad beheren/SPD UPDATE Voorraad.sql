USE TyskieWebshop
GO

/* Stored Procedure UPDATE Voorraad Beheren */
CREATE PROCEDURE spd_updateVoorraad
	@productCode		VARCHAR(10),
	@aantalVoorraad		INT,
	@oudAantalVoorraad	INT
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		UPDATE Voorraad
		SET aantalVoorraad = @aantalVoorraad
		WHERE productCode = @productCode AND aantalVoorraad = @oudAantalVoorraad
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