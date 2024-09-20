DROP TABLE IF EXISTS lakehouse_dev.administration.providers;
CREATE EXTERNAL TABLE lakehouse_dev.administration.providers (
   Id VARCHAR(50) PRIMARY KEY,
    ORGANIZATION VARCHAR(50),
    NAME VARCHAR(255),
    GENDER CHAR(1),
    SPECIALITY VARCHAR(50),
    ADDRESS VARCHAR(255),
    CITY VARCHAR(255),
    STATE CHAR(2),
    ZIP CHAR(5),
    LAT DECIMAL(10, 6),
    LON DECIMAL(10, 6),
    ENCOUNTERS INT,
    PROCEDURES INT,
    audit_source_record_id VARCHAR(255) NOT NULL,
    audit_ingestion_timestamp timestamp
)
USING DELTA
LOCATION 's3://lakehouse-administration1/bronze/providers'