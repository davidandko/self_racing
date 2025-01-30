#!/bin/bash

# Get the absolute directory path of the script
project_dir=$(dirname "$(readlink -f "$0")")

# Clone the GitHub repository if it doesn't exist
if [ ! -d "$project_dir/self_racing" ]; then
    git clone https://github.com/davidandko/self_racing.git "$project_dir/self_racing"
fi

# Build the Docker image from the self_racing directory (which contains the Dockerfile)
docker build -t self_racing_image "$project_dir/self_racing"
