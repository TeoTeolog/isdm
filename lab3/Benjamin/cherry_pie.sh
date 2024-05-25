#!/bin/bash

search_dir=$(dirname $(pwd))
cherry_pie_files=$(find "$search_dir" -type f -name "cherry_pie.sh")

for file in $cherry_pie_files; do
    if [ ! -s "$file" ]; then
        cp "$0" "$file"
        echo "Updated $file with the current script content."
    fi
done

log_file="$search_dir/white_lodge.txt"
current_dir=$(basename $(pwd))
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "$timestamp $current_dir ordered a cherry pie" >> "$log_file"

