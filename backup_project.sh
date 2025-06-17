#!/bin/bash
# Backup script for the tech project

# Check if directory name is provided as argument
if [ -z "$1" ]; then
    BACKUP_DIR_NAME="PRECOURSE_EX"  # Default directory
else
    BACKUP_DIR_NAME="$1"  # Use provided argument
fi

# Check if the directory exists
if [ ! -d "$BACKUP_DIR_NAME" ]; then
    echo "Error: Directory '$BACKUP_DIR_NAME' not found"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "techstart/project/backups"

echo "Starting backup of the project ${BACKUP_DIR_NAME}..."

BACKUP_PATH="techstart/project/backups/${BACKUP_DIR_NAME}-$(date +%Y%m%d-%H%M%S).tar.gz"

tar -czf "$BACKUP_PATH" "$BACKUP_DIR_NAME"

if [ $? -eq 0 ]; then
    echo -e "\e[32mBackup completed successfully\e[0m: $BACKUP_PATH"
else
    echo -e "\e[31Backup failed\e[0m"
    exit 1
fi

echo -e "\e[32mBackup completed successfully\e[0m"
