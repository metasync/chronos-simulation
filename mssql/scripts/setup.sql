/*
Enter custom T-SQL here that would run after SQL Server has started up. 
*/

CREATE DATABASE $(MSSQL_DATABASE);
GO
USE $(MSSQL_DATABASE);
GO
CREATE SCHEMA $(MSSQL_SCHEMA);
GO