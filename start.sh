#!bin/bash

/etc/init.d/ssh start

/usr/hadoop-3.3.1/bin/hdfs namenode -format
/usr/hadoop-3.3.1/sbin/start-dfs.sh

jps

netstat -a

tail -f /dev/null