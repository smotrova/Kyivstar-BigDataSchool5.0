-- run on sqldwschool
CREATE SCHEMA smotrova_yellow_taxi 
GO

-- run on master
CREATE LOGIN [smotrova] WITH PASSWORD=N'my_psswd'
GO

-- run on sqldwschool
CREATE USER [smotrova] FOR LOGIN smotrova
WITH DEFAULT_SCHEMA=[smotrova_yellow_taxi];
GO

-- Add an existing user to the role
-- run on master
EXEC sp_addrolemember N'db_owner', N'smotrova'
GO


-- select DRM.role_principal_id, DRM.member_principal_id, DP.name FROM sys.database_role_members DRM JOIN sys.database_principals DP on DRM.member_principal_id = DP.principal_id;