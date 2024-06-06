#!/bin/bash
set -e

# Set your container name here
container_name="my_container"

# Log file for capturing output and errors
log_file="/var/log/stop_container.log"

# Ensure the log file directory exists
mkdir -p $(dirname $log_file)

# Check if the container name is set
if [ -z "$container_name" ]; then
  echo "Error: container_name is not set." | tee -a $log_file
  exit 1
fi

# Check if the container exists
if ! docker ps -a --format '{{.Names}}' | grep -q "^${container_name}$"; then
  echo "Container $container_name does not exist." | tee -a $log_file
  exit 0  # Exit with 0 since the container is already "stopped"
fi

# Stop the container
echo "Stopping container $container_name..." | tee -a $log_file
docker stop "$container_name" 2>&1 | tee -a $log_file
if [ $? -ne 0 ]; then
  echo "Failed to stop container $container_name" | tee -a $log_file
  exit 1
fi

# Remove the container
echo "Removing container $container_name..." | tee -a $log_file
docker rm "$container_name" 2>&1 | tee -a $log_file
if [ $? -ne 0 ]; then
  echo "Failed to remove container $container_name" | tee -a $log_file
  exit 1
fi

echo "Container $container_name stopped and removed successfully." | tee -a $log_file
e
