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

CREATE TABLE SpatialTable
    ( id int IDENTITY (1,1),
    GeogCol1 geography,
    GeogCol2 AS GeogCol1.STAsText() );
GO

INSERT INTO SpatialTable (GeogCol1)
VALUES (geography::STGeomFromText('LINESTRING(-122.360 47.656, -122.343 47.656 )', 4326));

INSERT INTO SpatialTable (GeogCol1)
VALUES (geography::STGeomFromText('POLYGON((-122.358 47.653 , -122.348 47.649, -122.348 47.658, -122.358 47.658, -122.358 47.653))', 4326));
GO
