/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /twitter/tweet

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /twitter/tweet

/usr/hadoop-3.3.1/bin/hdfs dfs -mkdir -p /twitter/schema

/usr/hadoop-3.3.1/bin/hdfs dfs -chmod g+w /twitter/schema

/usr/hadoop-3.3.1/bin/hdfs dfs -setfacl -m user:root:rwx /twitter

/usr/hadoop-3.3.1/bin/hdfs dfs -put /usr/tweet.avsc /twitter/schema/tweet.avsc

/usr/apache-flume-1.9.0-bin/bin/flume-ng agent --conf conf --conf-file /usr/apache-flume-1.9.0-bin/twitter.conf --name a1 -Dflume.root.logger=INFO,console &

cd usr
python3 consumer.py