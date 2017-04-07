
USE SchedarioTerritorio
SELECT DISTINCT pri.IdQuietanza, pri.Id FROM ProvvIncassi pri INNER JOIN _oraIncassi ora 
ON pri.IdQuietanza = ora.IDQUIETANZA
ORDER BY pri.IdQuietanza DESC




--USE SchedarioTerritorio
--SELECT DISTINCT ora.idquietanza, ora.id, dett.IdQuietanza, dett.Voce FROM _oraIncassi ora
--LEFT JOIN 
--	(
--	SELECT DISTINCT idquietanza, Voce FROM ProvvIncassiDettaglio WHERE IdQuietanza IS NOT NULL
--	) AS dett 
--ON ora.idquietanza = dett.idquietanza 
--WHERE dett.idquietanza IS NULL


-- Check download progressing

--USE SchedarioTerritorio

--select COUNT(idq) from (
--	SELECT DISTINCT ora.idquietanza as idq, ora.id, dett.IdQuietanza, dett.Voce FROM _oraIncassi ora
--	LEFT JOIN 
--		(
--		SELECT DISTINCT idquietanza, Voce FROM ProvvIncassiDettaglio WHERE IdQuietanza IS NOT NULL
--		) AS dett 
--	ON ora.idquietanza = dett.idquietanza 
--	WHERE dett.idquietanza IS NULL
--) as kk

