#!bin/bash

/etc/init.d/ssh start

/usr/hadoop-3.3.1/bin/hdfs namenode -format
/usr/hadoop-3.3.1/sbin/start-dfs.sh
/usr/hadoop-3.3.1/sbin/start-yarn.sh

jps

netstat -o

/bin/bash

#tail -f /dev/null