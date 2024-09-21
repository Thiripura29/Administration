CREATE SCHEMA IF NOT EXISTS lakehouse_dev.administration
COMMENT "This schema holds view,tables,volumes,modules,function related to administration department"
LOCATION 's3://lakehouse-administration1/unity_catalog/schema/'
WITH DBPROPERTIES(department='administration')
