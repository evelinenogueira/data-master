#!bin/bash

/etc/init.d/ssh start

/usr/hadoop-3.3.1/bin/hdfs namenode -format
/usr/hadoop-3.3.1/sbin/start-dfs.sh
/usr/hadoop-3.3.1/sbin/start-yarn.sh

jps

netstat -o

/usr/hadoop-3.3.1/bin/hdfs dfs -put ./titanic.csv /titanic.csv

/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /user/hive/warehouse

/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /tmp

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /user/hive/warehouse

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /tmp

#./pyspark --master yarn --queue desenvolvimento --name titanic

# df = spark.read.format("csv").option("header", True).option("separato", True).load("hdfs:///titanic.csv")

#/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir /twitter


#bin/flume-ng agent --conf ./conf/ -f conf/twitter.conf -Dtwitter4j.streamBaseURL=https://stream.twitter.com/1.1/ -n TwitterAgent

#/bin/bash


tail -f /dev/null