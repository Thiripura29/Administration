# Databricks notebook source
path="/Volumes/lakehouse_dev/administration/artifacts/metadata/"

# COMMAND ----------

from pyspark.dbutils import DBUtils
dbutils.fs.ls(path)

# COMMAND ----------

def list_files_recursively(path):
    files = []
    items = dbutils.fs.ls(path)

    for item in items:
        if item.isDir():
            # If the item is a directory, recursively list its files
            files.extend(list_files_recursively(item.path))
        else:
            # If it's a file, add to the list
            files.append(item.path)

    return files

# Use the function to list files in the desired directory
all_files = list_files_recursively(path)
for file in all_files:
    print(file)


# COMMAND ----------

import traceback
execution_log={}
for file in all_files:
    file=file.replace("dbfs:","")
    execution_log["file_path"]=file
    try:
        sql_content=open(file,"r").read()
        print(sql_content)
        sql_statements=sql_content.split(";")
        for statement in sql_statements:
            if statement.strip():
                spark.sql(statement.strip())
        print(f"executed file: {file} successfully")
        execution_log["status"]="executed"
    except Exception as ex:
        raise ex
        execution_log["status"]="failed"
        execution_log["error"]=traceback.format_exc()
    
print(execution_log)
        
