#!bin/bash

/etc/init.d/ssh start

/usr/hadoop-3.3.1/bin/hdfs namenode -format
/usr/hadoop-3.3.1/sbin/start-dfs.sh
/usr/hadoop-3.3.1/sbin/start-yarn.sh

jps

netstat -o

#/bin/bash

#/usr/hadoop-3.3.1/bin/hdfs dfs -put ./titanic.csv /titanic.csv
#
#/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /user/hive/warehouse
#
#/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /tmp
#
#/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /user/hive/warehouse
#
#/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /tmp

/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /twitter/tweet

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /twitter/tweet
#
/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /twitter/schema

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /twitter/schema
#
/usr/hadoop-3.3.1/bin/hdfs dfs -put /usr/tweet.avsc /twitter/schema/tweet.avsc
#
/usr/apache-flume-1.9.0-bin/bin/flume-ng agent --conf conf --conf-file twitter.conf --name a1 -Dflume.root.logger=INFO,console &
#
#
usr/python3 consumer.py


tail -f /dev/null