
from pyspark.sql import functions as F


def main(df_dict, config_object):
    organization_transform_df = df_dict['administration_jdbc_organizations_bronze_datasource']
    # Get a list of all column names
    columns = organization_transform_df.columns

    # Concatenate all columns into a single string column and then hash it
    organization_transform_df = organization_transform_df.withColumn("source_record_id", F.hash(F.concat_ws("||", *columns)))

    # Additional columns as before
    organization_transform_df = organization_transform_df.withColumn("ingestion_timestamp", F.current_timestamp())

    return {"administration_delta_bronze_organization_sink": organization_transform_df}

# important : https://docs.delta.io/latest/optimizations-oss.html
