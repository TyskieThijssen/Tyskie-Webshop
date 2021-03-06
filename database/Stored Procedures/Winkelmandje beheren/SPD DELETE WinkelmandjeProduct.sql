USE TyskieWebshop
GO

/* Stored Procedure DELETE Winkelmandje Beheren */
CREATE PROCEDURE spd_deleteProductWinkelmandje
	@afrekenCode		VARCHAR(10),
	@productCode		VARCHAR(10),
	@aantalProducten	INT
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		DELETE FROM ProductInWinkelmandje
		WHERE afrekenCode = @afrekenCode AND productCode = @productCode AND aantalProducten = @aantalProducten
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