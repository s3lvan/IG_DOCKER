#!/bin/bash

# Define variables for paths and container name
SOURCE_DIR="$(pwd)/md_processor_Release"
CONTAINER_WORKDIR="/usr/src/app/md_processor_Release"
CONTAINER_NAME="md_processor"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Run the Docker container with the source code mounted as a volume
docker run -it --rm \
  -v "$SOURCE_DIR:$CONTAINER_WORKDIR" \
  -w "$CONTAINER_WORKDIR/Release" \
  "$CONTAINER_NAME" /bin/bash -c "
    # Clean and build the application
    if ! make clean; then
      echo 'Error: Failed to clean the build environment.'
      exit 1
    fi

    # if ! make all; then
    if ! make all; then
      echo 'Error: Build process failed.'
      exit 1
    fi

    # Check if the executable exists
    if [ -f md_processor ]; then
      echo 'Executable md_processor exists.'
    #  exit 0
    else
      echo 'Error: Executable md_processor not found.'
      exit 1
    fi
  "

# Check the exit status of the Docker command
#if [ $? -ne 0 ]; then
#  echo "Error: Docker command failed."
#  exit 1
#fi
