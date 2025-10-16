#!/bin/bash

# Prompt the user for their name
echo "Please enter your name:"
read user_name

# Create the main directory
dir_name="submission_reminder_${user_name}"
mkdir -p "$dir_name"

echo "Creating directory structure for $dir_name..."

# Create subdirectories
mkdir -p "$dir_name/app"
mkdir -p "$dir_name/modules"
mkdir -p "$dir_name/assets"
mkdir -p "$dir_name/config"

# Create and populate config.env
cat > "$dir_name/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create and populate functions.sh
cat > "$dir_name/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Create and populate reminder.sh
cat > "$dir_name/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Create and populate submissions.txt with at least 5 more students
cat > "$dir_name/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Michael, Shell Navigation, submitted
Sarah, Git, not submitted
James, Shell Navigation, not submitted
Emily, Shell Basics, submitted
David, Shell Navigation, not submitted
Olivia, Git, submitted
EOF

# Create and populate startup.sh
cat > "$dir_name/startup.sh" << 'EOF'
#!/bin/bash

# Navigate to the app directory and run the reminder script
cd "$(dirname "$0")"
bash ./app/reminder.sh
EOF

# Make all .sh files executable
echo "Setting executable permissions for all .sh files..."
find "$dir_name" -type f -name "*.sh" -exec chmod +x {} \;

echo "Environment created successfully!"
echo "Directory structure:"
echo "$dir_name/"
echo "├── app/"
echo "│   └── reminder.sh"
echo "├── modules/"
echo "│   └── functions.sh"
echo "├── assets/"
echo "│   └── submissions.txt"
echo "├── config/"
echo "│   └── config.env"
echo "└── startup.sh"
echo ""
echo "To test the application, run:"
echo "cd $dir_name && ./startup.sh"
