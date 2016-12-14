USE TyskieWebshop
GO

/* Stored Procedure UPDATE Product Beheren */
CREATE PROCEDURE spd_updateProduct
	@productCode	VARCHAR(10),
	@productNaam	VARCHAR(50),
	@productPrijs	INT,
	@beschrijving	VARCHAR(500)
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		UPDATE Product
		SET productNaam = @productNaam, productPrijs = @productPrijs, beschrijving = @beschrijving
		WHERE productCode = @productCode
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