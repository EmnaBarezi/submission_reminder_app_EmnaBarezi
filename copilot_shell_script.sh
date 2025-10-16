#!/bin/bash

# Prompt the user to enter the assignment name
echo "Please enter the new assignment name:"
read assignment_name

# Find the submission_reminder directory
dir_name=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1)

# Check if the directory exists
if [ -z "$dir_name" ]; then
    echo "Error: No submission_reminder directory found!"
    echo "Please run create_environment.sh first to create the environment."
    exit 1
fi

# Path to config.env
config_file="$dir_name/config/config.env"

# Check if config.env exists
if [ ! -f "$config_file" ]; then
    echo "Error: config.env file not found at $config_file"
    exit 1
fi

# Replace the ASSIGNMENT value in config.env using sed
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

echo "Assignment name updated to: $assignment_name"
echo "Updated config file:"
cat "$config_file"
echo ""
echo "Running startup.sh to check submissions for the new assignment..."
echo "--------------------------------------------"

# Run the startup.sh script
cd "$dir_name" && ./startup.sh
