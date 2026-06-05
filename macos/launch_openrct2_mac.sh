#!/bin/bash

# Define the expected path where macOS mounts the USB based on its label
USB_PATH="/Volumes/OpenRCT2_USB"
TARGET_APP="$USB_PATH/OpenRCT2.app"
DATA_FOLDER="$USB_PATH/data"

# Check if the USB and the game app actually exist
if [ -d "$TARGET_APP" ]; then
    # Move inside the USB directory context
    cd "$USB_PATH"
    
    # Path to the actual executable inside the macOS App bundle
    EXE_PATH="./OpenRCT2.app/Contents/MacOS/OpenRCT2"
    
    # Launch the game detached in the background with portable user data path
    if [ -f "$EXE_PATH" ]; then
        "$EXE_PATH" --user-data-path="$DATA_FOLDER" &
    fi
fi
