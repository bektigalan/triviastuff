#!/bin/bash

echo "Listing all directories in /var/www/html/..."
echo

# Get a list of all directories in /var/www/html/
directories=$(ls -d /var/www/html/*/)

# Count the total number of directories
total_dirs=$(echo "$directories" | wc -l)
current_dir=0

# Loop through each directory
for dir in $directories; do
    current_dir=$((current_dir + 1))
    echo "Processing directory $dir ($current_dir/$total_dirs)"

    # Apply chmod -x to the assets directory
    echo "Removing execute permission for assets directory in $dir"
    chmod -x "$dir/assets"

    echo
done

echo "Finished processing all directories."