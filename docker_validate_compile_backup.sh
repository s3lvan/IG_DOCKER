#!/bin/bash

# Run the Docker container with the source code mounted as a volume
docker run -it --rm \
  -v "$(pwd)/md_processor_Release:/usr/src/app/md_processor_Release" \
  -w /usr/src/app/md_processor_Release/Release \
  md_processor /bin/bash -c "
    # Clean and build the application
    make clean && make all && \
    # Check if the executable exists
    if [ -f md_processor ]; then
      echo 'Executable md_processor exists.'
      exit 0
    else
      echo 'Executable md_processor not found.'
      exit 1
    fi
  "
