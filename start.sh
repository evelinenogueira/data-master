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


tail -f /dev/null