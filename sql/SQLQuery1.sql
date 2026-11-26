USE master;
GO

-- Drop and recreate the 'HospitalData' database
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'HospitalData')
BEGIN
    ALTER DATABASE [HospitalData] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [HospitalData];
END
GO

-- Create the database
CREATE DATABASE HospitalData;
GO

-- Switch into it
USE HospitalData;
GO

-- Create the schemas
IF SCHEMA_ID('Bronze') IS NULL EXEC('CREATE SCHEMA Bronze');
GO
IF SCHEMA_ID('Silver') IS NULL EXEC('CREATE SCHEMA Silver');
GO
IF SCHEMA_ID('Gold') IS NULL EXEC('CREATE SCHEMA Gold');
GO

-- Create the table
IF OBJECT_ID('Silver.hospital_info', 'U') IS NOT NULL
    DROP TABLE Silver.hospital_info;
GO

CREATE TABLE Silver.hospital_info (
  PatientId NVARCHAR(20),
  AppointmentID INT,
  Gender VARCHAR(10),
  ScheduledDate DATE,
  AppointmentDate DATE,
  Age INT,
  Neighbourhood NVARCHAR(50),
  Scholarship INT,
  Hypertension INT,
  Diabetes INT,
  Alcoholism INT,
  Handicap INT,
  SMS_received INT,
  No_Show VARCHAR(10),
  Waiting_Days INT,
  Appointment_Weekday VARCHAR(10),
  Scheduled_Weekday VARCHAR(10),
  Timing NVARCHAR(20),
  Age_Group NVARCHAR(10)
);
GO

TRUNCATE TABLE Silver.hospital_info;
BULK INSERT Silver.hospital_info
FROM 'C:\Users\afola\Desktop\datasets\appointments_cleansed.csv'
WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
);

select * 
from Silver.hospital_info