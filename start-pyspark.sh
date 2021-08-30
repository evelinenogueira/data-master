/usr/spark-3.1.2-bin-hadoop3.2/bin/pyspark --master yarn --queue desenvolvimento --name titanic

df = spark.read.format("csv").option("header", True).option("separato", True).load("hdfs:///titanic.csv")