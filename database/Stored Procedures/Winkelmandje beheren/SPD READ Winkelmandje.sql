USE TyskieWebshop
GO

/* Stored Procedure READ Winkelmandje Beheren */
CREATE PROCEDURE spd_readWinkelmandje
	@afrekenCode	VARCHAR(10)
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		SELECT pw.afrekenCode, pw.productCode, p.productNaam, p.productPrijs, pw.aantalProducten
		FROM ProductInWinkelmandje pw INNER JOIN Product p ON pw.productCode = p.productCode
		WHERE afrekenCode = @afrekenCode
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