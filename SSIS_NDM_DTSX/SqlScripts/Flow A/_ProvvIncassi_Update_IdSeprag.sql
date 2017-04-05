UPDATE ProvvIncassi SET IdSeprag = n.IdSeprag
FROM(
select TOP 100 PERCENT i.id, 
	--i.CodiceSede + i.CodiceProvincia + i.CodiceAgenzia as seprag,
	i.Seprag, 
	sep.ID as IdSeprag , 
	sep.Denominazione
FROm ProvvIncassi i
--LEFT JOIN UnitaTerritorialiSeprag sep On sep.CodiceSede = i.CodiceSede AND sep.CodiceProvincia = i.CodiceProvincia AND sep.CodiceAgenzia = i.CodiceAgenzia
LEFT JOIN UnitaTerritorialiSeprag sep On sep.CodiceSede + sep.CodiceProvincia + sep.CodiceAgenzia = i.Seprag
ORDER BY sep.ID
) n 
WHERE n.seprag = ProvvIncassi.Seprag

UPDATE ProvvIncassi SET IdSepragLocale = n.IdSeprag
FROM(
select TOP 100 PERCENT i.id, 
	i.SepragLocale, 
	sep.ID as IdSeprag , 
	sep.Denominazione
FROm ProvvIncassi i
LEFT JOIN UnitaTerritorialiSeprag sep On sep.CodiceSede + sep.CodiceProvincia + sep.CodiceAgenzia = i.SepragLocale
ORDER BY sep.ID
) n 
WHERE n.sepragLocale = ProvvIncassi.SepragLocale
