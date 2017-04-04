USE [SchedarioTerritorio]
INSERT INTO [ProvvPagamentiAccentrati]
           (
           [TipologiaAccentramento]
           ,[Seprag]
           ,[NumeroFattura]
           ,[NumeroDocumento]
           ,[Data]
           ,[SepragEmittente]
           ,[Pagamento]
           ,[Log_Inserimento]
           ,[Log_InserimentoDataOra]
  			)
			SELECT 
				g.TIPOLOGIA_ACCENTRAMENTO
			   ,g.COD_SEPRAG
			   ,g.NUM_FATTURA
			   ,g.NUM_DOCUMENTO
			   ,g.DATA
			   ,g.SEPRAG_EMITTENTE
			   ,g.PAGAMENTO
			   , 'IMPORT' AS Log_Inserimento
			   , GETDATE() AS Log_InserimentoDataOra
			 FROM (
						SELECT TOP 100 PERCENT
							   TIPOLOGIA_ACCENTRAMENTO
							  ,COD_SEPRAG
							  ,NUM_FATTURA
							  ,NUM_DOCUMENTO
							  ,DATA
							  ,SEPRAG_EMITTENTE
							  ,PAGAMENTO
					 FROM [_oraAccentramenti]
					 GROUP BY 
					   TIPOLOGIA_ACCENTRAMENTO
						  ,COD_SEPRAG
						  ,NUM_FATTURA
						  ,NUM_DOCUMENTO
						  ,DATA
						  ,SEPRAG_EMITTENTE
						  ,PAGAMENTO

) AS g 
LEFT JOIN ProvvPagamentiAccentrati AS m 
	ON 
	 --g.TIPOLOGIA_ACCENTRAMENTO = m.TipologiaAccentramento AND
	 --g.COD_SEPRAG = m.Seprag AND
	 g.NUM_FATTURA = m.NumeroFattura AND
	 --g.NUM_DOCUMENTO = m.NumeroDocumento AND
	 g.DATA = m.Data --AND
	 --g.SEPRAG_EMITTENTE = m.SepragEmittente AND
	 --g.PAGAMENTO = m.Pagamento				 
	 WHERE
		m.Id IS NULL;
		
SELECT @@ROWCOUNT as RowsInserted;
	
