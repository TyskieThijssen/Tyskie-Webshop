USE TyskieWebshop
GO

/* Stored Procedure UPDATE Winkelmandje Beheren */
CREATE PROCEDURE spd_updateWinkelmandje
	@afrekenCode		VARCHAR(10),
	@productCode		VARCHAR(10),
	@aantalProducten	INT,
	@oudAantalProducten	INT
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		UPDATE ProductInWinkelmandje
		SET aantalProducten = @aantalProducten
		WHERE afrekenCode = @afrekenCode AND productCode = @productCode AND aantalProducten = @oudAantalProducten
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