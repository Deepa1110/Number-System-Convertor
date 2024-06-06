set -e
container_id= docker ps | awk -F " " '{print $1}'
docker rm -f $container_id
