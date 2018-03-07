USE tempdb;
GO

IF DB_ID('geography-test') IS NOT NULL
BEGIN
    ALTER DATABASE [geography-test] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE [geography-test];
END;

CREATE DATABASE [geography-test];
GO

USE [geography-test];
GO

CREATE TABLE geo_table (id  INT       PRIMARY KEY NOT NULL IDENTITY(1, 1)
                      , geo GEOGRAPHY NOT NULL);
					  
GO

INSERT INTO dbo.geo_table (geo)
VALUES (geography::STGeomFromText('POINT (3 4)', 4250))
