--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELECT [Timestamp],CardSize,TotalCards,GoodCards,RejectedCards
--	INTO [dbo].[PBI]
--FROM [dbo].[source_table_1]
--ORDER BY [Timestamp]


IF EXISTS(SELECT 1 FROM sys.procedures WHERE object_id=OBJECT_ID('[dbo].[pbi_tble_load]'))
	DROP PROC [dbo].[pbi_tble_load]
GO

CREATE PROC [dbo].[XYZ]
AS 
BEGIN 
	IF EXISTS(SELECT * FROM tempdb.sys.objects where object_id = OBJECT_ID('tempdb..#temp_pbi_load'))
		DROP TABLE tempdb..#temp_pbi_load

	DECLARE @@maxtime AS DATETIME
	SELECT @@maxtime = MAX([Timestamp]) FROM [dbo].[PBI]

	SELECT [Timestamp], [0] AS TotalCards, [2] AS RejectCards 
	INTO #temp_pbi_load
	FROM (
		SELECT [Timestamp], 
				[Value],
				ChannelIndex
		FROM [sourceserver].[dbo].[source_table_2]
		WHERE [Timestamp]> @@maxtime
		AND [UID] = 'xyz_value'
		AND SlotIndex = 0
		AND ChannelIndex IN (0,2)
	) as sc
	PIVOT
	(
		MAX([Value])
		FOR ChannelIndex IN ([0],[2])
	) as pv
	ORDER BY [Timestamp]

	INSERT INTO [dbo].[PBI]
	([Timestamp],TotalCards,RejectedCards)
	SELECT tp.*
	FROM #temp_pbi_load tp
	LEFT JOIN [dbo].[PBI] mn
	ON tp.[Timestamp] = mn.[Timestamp]
	WHERE mn.[Timestamp] IS NULL
	ORDER BY tp.[Timestamp]

	SELECT * FROM [dbo].[PBI] ORDER BY [Timestamp]
END
GO

EXEC [dbo].[pbi_tble_load]
GO

--GRANT EXECUTE ON [dbo].[pbi_tble_load] TO [domain/user]
