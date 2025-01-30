#!/bin/bash

# Get the absolute directory path of the script
project_dir=$(dirname "$(readlink -f "$0")")

# Run the container with port mapping and volume mounting
docker run -it --rm -p 8888:8888 -v "$project_dir/self_racing":/app self_racing_image
