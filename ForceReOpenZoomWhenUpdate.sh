#!/bin/bash
#Create by Agung Sujiwo 
#Date Create 30-1-2025
#Date Testing 30-1-2025

# Zoom application location
zoom_app="/Applications/zoom.us.app"

# Get the currently installed Zoom version
current_version=$(defaults read "$zoom_app/Contents/Info.plist" CFBundleShortVersionString)
#echo $current_version

# Compare with the latest installed Zoom version
latest_version=$(defaults read "$zoom_app/Contents/Info.plist" CFBundleShortVersionString)
#echo $latest_version

# If versions do not match, it means an update has been applied, so restart the application
if [[ "$current_version" != "$latest_version" ]]; then
	#echo $current_version
	#echo $latest_version
    echo "Zoom has been updated. Restarting the Zoom application..."

    # Close Zoom if it's running
    pkill -f "zoom.us"

    # Wait briefly to ensure Zoom is closed
    sleep 3

    # Reopen the Zoom application
    open -a "zoom.us"
else
    echo "Zoom is already up to date, no action needed."
fi
