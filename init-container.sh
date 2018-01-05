#!/bin/bash
# config hadoop container
docker exec -it jn1 bash -c "hdfs --daemon start journalnode"
docker exec -it jn2 bash -c "hdfs --daemon start journalnode"
docker exec -it jn3 bash -c "hdfs --daemon start journalnode"
docker exec -it namenode1 bash -c "echo -e y | hdfs zkfc -formatZK"
docker exec -it namenode1 bash -c "hdfs namenode -format"
docker exec -itd namenode1 bash -c "hdfs --daemon start namenode && sleep 10"
docker exec -it namenode2 bash -c "hdfs namenode -bootstrapStandby"
docker exec -it namenode3 bash -c "hdfs namenode -bootstrapStandby"
docker exec -it namenode1 bash -c "stop-dfs.sh && start-dfs.sh"

# get into hadoop master container
docker exec -it namenode1 bash