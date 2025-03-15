#!/bin/bash

# Debugging output to check script execution
echo "Script is being executed..."

# Check if the build.gradle.kts file exists
if [ ! -f "app/build.gradle.kts" ]; then
    echo "Error: app/build.gradle.kts file not found."
    exit 1
fi

# Extract Android version code
if [ "$EXPOSE_CODE" == 'true' ]; then
    ANDROID_VERSION_CODE=$(grep "versionCode" app/build.gradle.kts | sed "s/.*versionCode\\s*=\\s*\\([0-9]*\\).*/\\1/")
    export ANDROID_VERSION_CODE
    echo "ANDROID_VERSION_CODE extracted: $ANDROID_VERSION_CODE"
fi

# Extract Android version name
if [ "$EXPOSE_NAME" == 'true' ]; then
    ANDROID_VERSION_NAME=$(grep "versionName" app/build.gradle.kts | sed "s/.*versionName\\s*=\\s*'\\(.*\\)'.*/\\1/" | tr -d '[:space:]' | sed 's/"//g' | sed 's/versionName=//')
    export ANDROID_VERSION_NAME
    echo "ANDROID_VERSION_NAME extracted: $ANDROID_VERSION_NAME"
fi

# Debugging output to indicate script completion
echo "Script execution complete."