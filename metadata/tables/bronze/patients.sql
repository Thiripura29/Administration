DROP TABLE IF EXISTS lakehouse_dev.administration.patients;
CREATE EXTERNAL TABLE lakehouse_dev.administration.patients (
  Id VARCHAR(50) PRIMARY KEY,
    BIRTHDATE DATE,
    SSN CHAR(11),
    DRIVERS VARCHAR(50),
    PASSPORT VARCHAR(50),
    PREFIX VARCHAR(10),
    FIRST VARCHAR(50),
    MIDDLE VARCHAR(50),
    LAST VARCHAR(50),
    SUFFIX VARCHAR(10),
    MAIDEN VARCHAR(50),
    MARITAL VARCHAR(20),
    RACE VARCHAR(50),
    ETHNICITY VARCHAR(50),
    GENDER CHAR(1),
    BIRTHPLACE VARCHAR(255),
    ADDRESS VARCHAR(255),
    CITY VARCHAR(255),
    STATE VARCHAR(255),
    COUNTY VARCHAR(255),
    FIPS CHAR(5),
    ZIP CHAR(5),
    LAT DECIMAL(10, 6),
    LON DECIMAL(10, 6),
    HEALTHCARE_EXPENSES DECIMAL(10, 2),
    HEALTHCARE_COVERAGE DECIMAL(10, 2),
    INCOME DECIMAL(10, 2)
)
USING DELTA
LOCATION 's3://lakehouse-administration1/bronze/patients'