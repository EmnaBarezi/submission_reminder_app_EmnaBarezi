# Submission Reminder Application

## Overview

This application helps track student assignment submissions and sends reminders to students who have not submitted their assignments. The system uses shell scripts to manage the application environment and check submission statuses.

## Repository Structure


submission_reminder_app/
├── create_environment.sh       # Script to set up the application environment
├── copilot_shell_script.sh     # Script to update assignment name and check submissions
└── README.md                   # This file


## Prerequisites

- Linux/Unix-based operating system (Ubuntu, macOS, etc.)
- Bash shell (version 4.0 or higher recommended)
- Basic command-line knowledge

## Installation and Setup

### Step 1: Clone the Repository

bash
git clone https://github.com/YOUR_USERNAME/submission_reminder_app_YOUR_USERNAME.git
cd submission_reminder_app_YOUR_USERNAME


### Step 2: Make Scripts Executable

bash
chmod +x create_environment.sh
chmod +x copilot_shell_script.sh


### Step 3: Create the Application Environment

Run the create_environment.sh script to set up the directory structure:

bash
./create_environment.sh


You will be prompted to enter your name. The script will create a directory named submission_reminder_{yourName} with the following structure:


submission_reminder_{yourName}/
├── app/
│   └── reminder.sh              # Main reminder script
├── modules/
│   └── functions.sh             # Helper functions
├── assets/
│   └── submissions.txt          # Student submission records
├── config/
│   └── config.env               # Configuration file
└── startup.sh                   # Application startup script


## Usage

### Running the Application

After creating the environment, navigate to the created directory and run the startup script:

bash
cd submission_reminder_{yourName}
./startup.sh


This will display:
- The current assignment name
- Days remaining to submit
- A list of students who have not submitted the assignment

### Updating the Assignment Name

To check submissions for a different assignment, use the copilot_shell_script.sh:

bash
./copilot_shell_script.sh


You will be prompted to enter a new assignment name. The script will:
1. Update the assignment name in config/config.env
2. Automatically run the application to check submissions for the new assignment

### Adding More Students

To add more student records, edit the submissions.txt file in the assets directory:

bash
nano submission_reminder_{yourName}/assets/submissions.txt


Follow this format:

student, assignment, submission status
StudentName, AssignmentName, submitted
AnotherStudent, AssignmentName, not submitted


## Configuration

The application configuration is stored in config/config.env:

bash
ASSIGNMENT="Shell Navigation"    # Current assignment name
DAYS_REMAINING=2                 # Days remaining to submit


You can manually edit this file or use the copilot_shell_script.sh to update the assignment name.

## Features

- *Automated Environment Setup*: Creates all necessary directories and files with a single script
- *Flexible Assignment Tracking*: Easily switch between different assignments
- *Student Submission Monitoring*: Identifies students who have not submitted assignments
- *Modular Design*: Separates configuration, functions, and data for easy maintenance

## Troubleshooting

### Script Permission Denied

If you encounter a "Permission denied" error, ensure the scripts are executable:

bash
chmod +x create_environment.sh copilot_shell_script.sh


### Directory Not Found

If copilot_shell_script.sh cannot find the submission_reminder directory:
1. Ensure you've run create_environment.sh first
2. Run copilot_shell_script.sh from the same directory where you ran create_environment.sh

### No Reminders Displayed

If no reminders are shown:
1. Check that the assignment name in config/config.env matches entries in submissions.txt
2. Verify that there are students with "not submitted" status for that assignment
3. Ensure the assignment names match exactly (case-sensitive)

## File Descriptions

### create_environment.sh
Sets up the complete application directory structure, creates all necessary files with appropriate content, and sets executable permissions for all shell scripts.

### copilot_shell_script.sh
Allows users to update the assignment name in the configuration file and automatically runs the application to check submissions for the new assignment.

### startup.sh (Generated)
Entry point for the application. Sources configuration and functions, then runs the reminder script.

### reminder.sh (Generated)
Main application logic that displays assignment information and checks for non-submitted assignments.

### functions.sh (Generated)
Contains the check_submissions function that reads the submissions file and identifies students who haven't submitted.

### config.env (Generated)
Configuration file storing the current assignment name and days remaining.

### submissions.txt (Generated)
CSV-format file containing student submission records.

## Development Workflow

This project follows a Git branching workflow:

1. *Feature Branch*: Development work is done on feature/setup branch
2. *Main Branch*: Final, clean version with only the three main files:
   - create_environment.sh
   - copilot_shell_script.sh
   - README.md

## Author

**Name**: Emna Barezi

**Email**: [e.barezi@alustudent.com](e.barezi@alustudent.com)

Created as part of a shell scripting assignment to demonstrate:
- Shell script automation
- Directory structure management
- File manipulation with sed
- Version control with Git
- Technical documentation

## License

For educational purposes.
