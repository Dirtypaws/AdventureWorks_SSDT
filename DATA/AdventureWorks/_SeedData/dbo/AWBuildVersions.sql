SET IDENTITY_INSERT [dbo].[AWBuildVersion] ON

MERGE INTO [dbo].[AWBuildVersion] AS t
USING ( VALUES
	(1, N'12.0.1800', N'2014-02-20 04:26:00', N'2014-07-08 00:00:00')
) AS s ([SystemInformationID], [Database Version], [VersionDate], [ModifiedDate])
	ON [t].[SystemInformationID] = [s].[SystemInformationID]
WHEN MATCHED AND (s.[SystemInformationID] <> t.[SystemInformationID]) THEN
	UPDATE SET
		[SystemInformationID] = [s].[SystemInformationID], 
		[Database Version] = [s].[Database Version], 
		[VersionDate] = [s].[VersionDate], 
		[ModifiedDate] = [s].[ModifiedDate]
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([SystemInformationID], [Database Version], [VersionDate], [ModifiedDate])
	VALUES ([s].[SystemInformationID], [s].[Database Version], [s].[VersionDate], [s].[ModifiedDate])
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;

SET IDENTITY_INSERT [dbo].[AWBuildVersion] OFF