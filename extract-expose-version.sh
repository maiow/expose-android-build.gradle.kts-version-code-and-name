#!/bin/bash

# Extract Android version code
ANDROID_VERSION_CODE=$(grep "versionCode" app/build.gradle.kts | sed "s/.*versionCode\\s*=\\s*\\([0-9]*\\).*/\\1/")
if [ -z "$ANDROID_VERSION_CODE" ]; then
    echo "Error: Unable to extract version code."
    exit 1
fi

# Extract Android version name
ANDROID_VERSION_NAME=$(grep "versionName" app/build.gradle.kts | sed "s/.*versionName\\s*=\\s*'\\(.*\\)'.*/\\1/" | tr -d '[:space:]' | sed 's/"//g' | sed 's/versionName=//')
if [ -z "$ANDROID_VERSION_NAME" ]; then
    echo "Error: Unable to extract version name."
    exit 1
fi

# Write the extracted values to a temporary file
echo "ANDROID_VERSION_CODE=$ANDROID_VERSION_CODE" > extracted_values.txt
echo "ANDROID_VERSION_NAME=$ANDROID_VERSION_NAME" >> extracted_values.txt

# Debugging output to indicate script completion
echo "Script execution complete."
