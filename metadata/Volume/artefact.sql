CREATE EXTERNAL VOLUME IF NOT EXISTS lakehouse_dev.administration.artifacts
COMMENT "This is my external volume on s3"
LOCATION 's3://lakehouse-administration1/artifacts/'

