#!/usr/bin/env bash

scriptFolder=$(dirname $0)
configs="${scriptFolder}/config.sh"
source $configs

containers=`docker ps -f status=running --format "{{.Names}}"`
for container in $listOfContainers
do

  if ! (echo $containers |grep -q $container )
  then 
    echo "$container offline"
    message="Warning! The container $container is down ! \n \n"
    
    curl -H "Content-Type: application/json" \
    -X POST \
    -d "{\"username\": \"${username}\", \"content\": \"${message}\"}" $url
  fi
done
exit 0