set -e
#!/bin/bash

container_name="my_container"

echo "Stopping container $container_name..."
docker stop $container_name
if [ $? -ne 0 ]; then
  echo "Failed to stop container $container_name"
  exit 1
fi

echo "Removing container $container_name..."
docker rm $container_name
if [ $? -ne 0 ]; then
  echo "Failed to remove container $container_name"
  exit 1
fi

echo "Container $container_name stopped and removed successfully."

