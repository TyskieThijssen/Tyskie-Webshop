USE TyskieWebshop
GO

/* Stored Procedure UPDATE Categorie Beheren */
CREATE PROCEDURE spd_updateCategorie
	@categorieNaam			VARCHAR(50),
	@oudCategorieNaam		VARCHAR(50),
	@categorieBeschrijving	VARCHAR(500),
	@hoofdCategorie			VARCHAR(50)
AS
	SET NOCOUNT, XACT_ABORT ON
	DECLARE @TranCounter INT;
	SET @TranCounter = @@TRANCOUNT;
	IF @TranCounter > 0
		SAVE TRANSACTION ProcedureSave;
	ELSE
		BEGIN TRANSACTION;
BEGIN TRY
		UPDATE Categorie
		SET categorieNaam = @categorieNaam, categorieBeschrijving = @categorieBeschrijving, hoofdCategorie = @hoofdCategorie
		WHERE categorieNaam = @oudCategorieNaam
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