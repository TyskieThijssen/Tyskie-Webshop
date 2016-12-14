--Winkelmandje Met totaalprijs
SELECT w.afrekenCode, SUM(pw.aantalProducten * productPrijs) as Totaalprijs
FROM ProductInWinkelmandje pw INNER JOIN Winkelmandje w ON w.afrekenCode = pw.afrekenCode
	 INNER JOIN Product p ON pw.productCode = p.productCode
GROUP BY w.afrekenCode
HAVING w.afrekenCode = 'ORDER 001'

SELECT *
FROM Product