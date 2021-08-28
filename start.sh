#!bin/bash

/etc/init.d/ssh start

/usr/hadoop-3.3.1/bin/hdfs namenode -format
/usr/hadoop-3.3.1/sbin/start-dfs.sh
/usr/hadoop-3.3.1/sbin/start-yarn.sh

jps

netstat -o

/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir /twitter

cd /usr/apache-flume-1.9.0-bin/

bin/flume-ng agent --conf ./conf/ -f conf/twitter.conf -Dflume.root.logger=INFO,console -n TwitterAgent

/bin/bash


#tail -f /dev/null