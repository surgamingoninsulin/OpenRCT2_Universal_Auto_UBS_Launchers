#!/bin/bash

# Linux mounts USBs under /media/username/DriveLabel
USER_NAME=$(whoami)
USB_PATH="/media/$USER_NAME/OpenRCT2_USB"
TARGET_EXE="$USB_PATH/openrct2"
DATA_FOLDER="$USB_PATH/data"

# Check if the USB path and executable exist
if [ -f "$TARGET_EXE" ]; then
    # Move inside the USB directory context
    cd "$USB_PATH"
    
    # Ensure the file has permission to run, then launch it portably in the background
    chmod +x "./openrct2"
    ./openrct2 --user-data-path="$DATA_FOLDER" &
fi
