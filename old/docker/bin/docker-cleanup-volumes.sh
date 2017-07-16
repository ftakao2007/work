#!/bin/sh

echo "1 : dry-run"
echo "2 : delete data volumes"
read flag

if [ "${flag}" != "2" ]; then
  flag=1
fi

docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker:/var/lib/docker \
    martin/docker-cleanup-volumes ${option}
