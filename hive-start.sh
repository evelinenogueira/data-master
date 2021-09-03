rm -rf metastore_db

schematool -dbType derby -initSchema

hive

CREATE EXTERNAL TABLE tweets_import
STORED AS AVRO
LOCATION 'hdfs:///twitter/tweets/*'
TBLPROPERTIES ('avro.schema.url'='hdfs://localhost:9000//twitter/schema/tweet.avsc')