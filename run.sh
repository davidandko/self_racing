#!/bin/bash

# Get the absolute directory path of the script
project_dir=$(dirname "$(readlink -f "$0")")

# Ensure the latest image is used: pull the image if available
docker pull self_racing_image || echo "Using local image"

# Run the container with port mapping and volume mounting
docker run -it --rm -p 8888:8888 -v "$project_dir/self_racing":/app self_racing_image
