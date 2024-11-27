#!/bin/bash

# Define the paths
EXECUTABLE_PATH="md_processor_Release/Release/md_processor"
DATA_DIR="md_processor_Release/data"
STATS_FILE="$DATA_DIR/md-test.C-M.stats"
CSV_FILE="$DATA_DIR/md-test-2.C-M.csv"

# Check if the executable exists
if [ ! -f "$EXECUTABLE_PATH" ]; then
  echo "Executable $EXECUTABLE_PATH not found. Please build the project first."
  exit 1
fi

# Run the Docker container with the executable and data directory mounted
docker run -it --rm \
  -v "$(pwd)/md_processor_Release/Release:/usr/src/app/md_processor_Release/Release" \
  -v "$(pwd)/$DATA_DIR:/usr/src/app/$DATA_DIR" \
  -w /usr/src/app \
  md_processor /bin/bash -c "
    # Run the command
    $EXECUTABLE_PATH --p=C --d=M --f=$DATA_DIR/md-test-2.json 2> $STATS_FILE > $CSV_FILE

    # Check if the command was successful
    if [ \$? -eq 0 ]; then
      # Print the top 10 lines of the CSV file
      echo 'Top 10 lines of $CSV_FILE:'
      head -n 10 $CSV_FILE

      # Remove the .stats and .csv files
      rm $STATS_FILE $CSV_FILE
      echo 'Removed $STATS_FILE and $CSV_FILE'
    else
      echo 'Command failed to execute.'
      exit 1
    fi
  "
