rm -rf metastore_db

schematool -dbType derby -initSchema

hive

CREATE EXTERNAL TABLE tweets_2
STORED AS AVRO
LOCATION 'hdfs://localhost:9000/twitter/tweet'
TBLPROPERTIES ('avro.schema.url'='hdfs://localhost:9000/twitter/schema/tweet.avsc');

CREATE EXTERNAL TABLE IF NOT EXISTS tweets_2(
        text STRING,
        created_at STRING,
        screen_name STRING)
    COMMENT 'tweets com a hashtag santander'
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    location 'hdfs://localhost:9000/twitter/tweet';