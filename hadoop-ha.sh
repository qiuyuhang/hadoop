#!/bin/bash
# config hadoop container

i=1
while [ $i -lt 4 ]
do
	docker exec -itd zk$i bash -c "zkServer.sh start"
	i=$(( $i + 1 ))
done 

docker exec -itd namenode1 bash -c "start-dfs.sh"

# get into hadoop master container
docker exec -it namenode1 bash