/usr/spark-3.1.2-bin-hadoop3.2/bin/pyspark --master yarn --queue desenvolvimento --name twitter

df = spark.read.format("csv").option("header", True).option("separator", True).load("hdfs://localhost:9000/twitter/tweet/*.csv")