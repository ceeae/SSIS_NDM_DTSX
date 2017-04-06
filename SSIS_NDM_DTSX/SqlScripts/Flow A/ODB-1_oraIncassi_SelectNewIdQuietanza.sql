 USE SchedarioTerritorio
 SELECT ora.* FROM _oraIncassi ora LEFT JOIN ProvvIncassi pri ON ora.IDQUIETANZA = pri.IdQuietanza 
 WHERE pri.IdQuietanza IS NULL