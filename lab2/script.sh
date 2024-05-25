#!/bin/bash

file="my_file.txt"
message_file="messages.txt"

if [ ! -f "$file" ]; then
    echo "Error: $file not found!"
    exit 1
fi

if [ ! -f "$message_file" ]; then
    echo "Error: $message_file not found!"
    exit 1
fi

while IFS= read -r dir_name
do
    mkdir -p "$dir_name"

    touch "$dir_name/cherry_pie.sh"
    touch "$dir_name/good_coffee.sh"

    mkdir -p "$dir_name/post_box"
    cp "$message_file" "$dir_name/post_box/"
done < "$file"

echo "Please enter a message to be added to all messages.txt files:"
read -p "Message: " user_message

while IFS= read -r dir_name
do
    echo -e "\n$user_message" >> "$dir_name/post_box/$message_file"
done < "$file"

echo "Completed"
