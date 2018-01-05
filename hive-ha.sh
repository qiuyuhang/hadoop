#!/bin/bash
# config hadoop container
i=1
while [ $i -lt 4 ]
do
	docker exec -itd namenode$i  bash -c "hiveserver2 && cat"      
	i=$(( $i + 1 ))
done 


# get into hadoop master container
docker exec -it namenode1 bash