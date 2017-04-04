USE SchedarioTerritorio

DECLARE @Id BIGINT,  @NumeroFattura varchAR(20), @NumeroDocumento varchar(20), @Data DATETIME, @IdSeprag INT

DECLARE cur CURSOR FOR  
	SELECT Id, NumeroFattura, NumeroDocumento, Data, IdSeprag FROM ProvvPagamentiAccentrati
ORDER BY NumeroFattura,Data 

OPEN cur  
	FETCH NEXT FROM cur  INTO @Id, @NumeroFattura, @NumeroDocumento, @Data, @IdSeprag
	WHILE @@FETCH_STATUS = 0  
	BEGIN	

		INSERT INTO [dbo].[ProvvPagamentiAccentratiDettaglio]
			   ([IdPagamento]
			   ,[NumeroFattura]
			   ,[NumeroDocumento]
			   ,[Data]
			   ,[Voce]
			   ,[Importo]
			   ,[IdSepragLocale]
			   ,[SepragLocale]
			   ,[CodiceBA]
			   ,[CircoscrizioneLocale]
			   ,[DenominazioneLocale]
			   ,[IndirizzoLocale]
			   ,[Comune]
			   ,[Organizzatore]
			   ,[Responsabile]
			   ,[IdEventoSchedaAbbonamento]
			   ,[Log_Inserimento]
			   ,[Log_InserimentoDataOra]
			   ,[Log_Aggiornamento]
			   ,[Log_AggiornamentoDataOra])

		SELECT DISTINCT @Id, @NumeroFattura, @NumeroDocumento, @Data, VOCE_INCASSO, Importo,
			@IdSeprag, SEPRAG_LOC, CODICE_BA, CIRCOSCRIZIONE_LOCALE, DENOMINAZIONE_LOCALE,
			INDIRIZZO_LOCALE, Comune, Organizzatore, Responsabile, ID_SCHEDA_ABBONAMENTO,
			'IMPORT', GETDATE(), NULL, NULL
		FROM _oraAccentramenti appo
		WHERE appo.NUM_FATTURA = @NumeroFattura AND appo.Data = @Data

		FETCH NEXT FROM cur  INTO @Id, @NumeroFattura, @NumeroDocumento, @Data, @IdSeprag
	END

CLOSE cur
DEALLOCATE cur
